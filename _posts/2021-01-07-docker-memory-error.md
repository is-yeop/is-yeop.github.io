---
title: "도커 메모리 부족현상"
image:
    path: /images/2021-01-07/pip_오류.png
categories:
    - server 
tags:
    - docker
    - ubuntu
last_modified: 2021-01-07T10:40:37
comment: true
---

## 2장요약 

아닛 137번오류다!

<img src="/images/2021-01-07/pip_오류.png"/>

스왑을 추가한다!

<img src="/images/2021-01-07/swap_설정해줌.png">

아래부터 본론

---
# 도커 메모리 부족 오류
관련 소스 링크:
https://github.com/BlueCoffeeBean/heritage_api_and_db

## 대략적인 서버 상황
현재 본인은 oracle cloud에서 always free 가능 instance를 생성해 사용하고 있다.
사용중인 instance의 성능은 이러하다.

<img src="/images/2021-01-07/server_env.png"/>

나머지 성능은 다 제쳐두고, 메모리에 집중해 보자. 딱 1GB이다. 그리고 메모리 사용 그래프를 보았을 때 대략 절반 정도 운영체제가 사용하고 있어 실제 사용할 수 있는 것은 0.6GB 정도뿐이다.

## 문제 발생
docker-compose up 명령어를 사용하였을 때 가상 서버에서 이미지를 구축한 뒤에 이미지를 띄우는 방식이기에 중간에 docker file에 있는 명령어가 실행 중 오류가 나면 이미지 구축이 되지 않을 뿐 더러 해당 이미지를 실행시킨 이후 docker 기능도 제대로 작동하지 않는다. 이게 제일 이상적이긴 하다. 

하지만 하나의 프로젝트만 완성하면 충분한 입장에서는 여간 귀찮은 일이 아닐 수 없다. 일단 실행돼서 어떻게든 고치는 게 마음이 편한데 말이다. 

일단 오류 내용을 살펴보자

<img src="/images/2021-01-07/pip_오류.png"/>

```
Killed
ERROR: Service 'web' failed to build: The command '/bin/sh -c pip install -r 
requirements.txt' returned a non-zero code: 137
```

DockerFile의 내용 중 pip 설치 내용에서 오류가 났다는 모양이다. 그리고 마지막으로 설치된 패키지가
tensorflow고, 또 하필 tensorflow의 크기가 394.7MB 라는 거대한 크기였다.

따라서 이 문제는 느낌상 메모리 부족 문제로 pip 설치가 실패했을 거라 예상하고 시작하였다.
(근데 또 찾아보니 137 오류 코드가 메모리 부족이라는 이야기가 있더라….
[관련 stackoverflow 링크](https://stackoverflow.com/questions/57291806/docker-build-failed-after-pip-installed-requirements-with-exit-code-137))

## swap 영역이 있으니 어떻게던 비비지 않을까?
모든 운영체제에는 부족한 메모리를 해결하기 위해 swap 영역이 존재한다. 
우분투를 많이 깔아본 입장에서 데스크톱 같이 64GB라는 거대한 메모리 용량을 가지고 있지 않은 이상. 
일단 8기가 정도를 swap 영역에 할당하는 편이다. 
따라서 oracle Ubuntu에도 swap 영역이 존재할 것으로 생각했다.
<ins>(하지만 곧 이건 망상이라는 걸 깨닫게 되었다.)</ins>

그래서 일단 

<img src="/images/2021-01-07/db_실행을_하지_않기로_함.png">

조금이나마 메모리 아끼려 docker compose file에서 데이터베이스 실행 코드를 주석처리 해버렸다.

그 이후 docker를 실행시키고

<img src="/images/2021-01-07/db_실행_x.png">

컨테이너에 bash를 실행해 직접 설치를 시도하였다.

<img src="/images/2021-01-07/직접_인스톨_시도.png">

그런데 와우!

<img src="/images/2021-01-07/메모리 치솟음.png">

그 이후로도 몇 번 더 시도해봤지만, 가상 서버가 멈출 뿐이었다.

## swap영역이 얼마길래 이래?
알다시피 우분투에서 메모리 확인하는 방법은 `sudo free -m` 이다.

<img src="/images/2021-01-07/알고비니_swap영역_x.png">

으아닛! swap 영역이 존재하지 않는다니! 나는 절망했다.... 오라클 클라우드는 내가 생각한 것보다 
착하지 않다는 것! swap 영역은 직접 설정하라니! 일단 원하는 대로 swap 영역을 설정하는 걸 
구글링했다.

## swap 영역 설정하자!
* 해당 내용은 [HiSEON 님의 블로그](https://hiseon.me/linux/linux-swap-file/)를
참고하였습니다.

일단 swap으로 사용할 파일을 할당해준다. 이때 특정 크기의 파일을 생성해주는 `fallocate`명령어를 이용한다. 그리고 root만 읽을 수 있게 설정해준다. (알기 쉽게 이름은 swap file로)

`sudo fallocate -l 4G /swapfile && sudo chmod 600 /swapfile`

그리고 만든 파일을 swap file로 초기화하고 swap file로 설정해준다.

`sudo mkswap /swapfile && sudo swapon /swapfile`

그러고 확인하려면 `sudo free -m`하면 된다.

아 그리고 껏다가 키면 사라지니 [HiSEON 님의 블로그](https://hiseon.me/linux/linux-swap-file/)를 참고해달라구!
```
환경 설정

위의 명령어로 설정한 경우, 재부팅되면 swap 파일이 적용되지 않습니다. 따라서 /etc/fstab 파일을 수정하여 부팅시 자동으로 swap 파일이 사용되도록 설정합니다. 아래의 내용을 /etc/fstab 파일에 추가하면 재부팅 후에도 swap 파일이 사용되게 됩니다.

/swapfile   none    swap    sw    0   0
```

1장 요약!

<img src="/images/2021-01-07/swap_설정해줌.png">

(아 중간에 틀린 거 좀 봐주라 a하고 q하고 맨날 타자 헷갈린다.)

## 설치 완료

뭐 다시 메모리가 폭발 적으로 치솟긴 했지만....

<img src="/images/2021-01-07/눈_돌린새_설치_완료.png">

이제 잘만 돌아가더라!

---
여담
## docker에도 swap 설정해주는 게 있다고?
- 이 내용은 Deok.ME 님의 
[Ubuntu-에서-Docker-운영-시-필수-옵션-설정하기](https://comcube.tistory.com/entry/Ubuntu-에서-Docker-운영-시-필수-옵션-설정하기)를
참고하였습니다.

도커에서 swap 영역을 계산할 수 있도록 허용을 해줘야 한다.

/etc/default/grub 안에 있는 GRUB_CMDLINE_LINUX 속성을 "cgroup_enable=memory swapaccount=1" 로 바꿔주기만 하면 된다!

<img src="/images/2021-01-07/docker_swap_설정.png">

grub를 업데이트해 주고 재부팅 하면 되는데 이때 위에서 설정했던 swap이 날아 감으로
환경설정을 반드시 해주고 재부팅해달라고!

`sudo update-grub`

`sudo reboot`

이만 