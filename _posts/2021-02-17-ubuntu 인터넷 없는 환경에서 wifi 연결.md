---
title: "안 쓰는 노트북으로 우분투 서버 돌리기(1)"
categories:
    - server
tags:
    - server
    - ubuntu
    - 노트북 서버 개발기
last_modified: 2021-02-19T18:03:15
comment: true
---
# 안쓰는 노트북으로 우분투 서버 돌리기(1)

2010년도(초등학교 4학년)에 구매한 구형 노트북이 집에서 데스크톱을 구매한 2018년부터 썩어가고 있었다.
그리고 서버 개발을 2019년부터 시도해왔지만, amazon web service를 이용하느라 별 감흥 없이 그냥 썩혀뒀다.
하지만 2020년 하던 개발도 없고, 만들고 싶은 것들은 많은데 구지 AWS를 사용하여 매달 결제되는 금액을 만들고 싶지는 않았다.
그래서 다시 노트북을 예토전생시키기로 하였다.

## 목표
<img src="/images/2021-02-17/안 쓰는 노트북으로 우분투 서버 돌리기(1)/서버_계획.jpg"/>

대략적으로 이런 느낌으로 진행하려고 한다.

## 문제점
지금 노트북을 다시 사용하려고 하니 생각보다 많은 문제가 있었다.
1. 랜선을 연결하면 인터넷에 연결할 수가 없었다.
    - 정확히 dhcp 서버에서 노트북으로 값이 넘어오지 않는다.
    - 공유기 모뎀은 정상인데 노트북이 비정상인 것 같다.
    - wifi를 이용하여 받아오도록 하였다.
2. 22번 포트가 외부에서 막혀있다.
    - sk 측에서 막아둔 듯 하다.
    - 이 내용은 [여기](/server/sk-포트-제한-풀기)

## 인터넷 없는 환경에서 wifi 연결하기!
※ 해당 내용은 대부분 [여기](https://medium.com/@yping88/how-to-enable-wi-fi-on-ubuntu-server-20-04-without-a-wired-ethernet-connection-42e0b71ca198)를 참고 하였다.

대부분의 wifi 연결 튜토리얼은 wpa_supplicant package를 이용하라 추천한다. 
하지만 인터넷을 연결하고 싶어 wifi를 연결하는 사람으로써 `apt-get install`은 사용이 불가능하다.
따라서 wpa_supplicant package를 다른 컴퓨터에서 받아서 옮겨와 해당 서버에 설치해야만 한다.

`apt-get`으로 설치할 수 있는 package는 `apt-get install --download-only`명령어를 통해
생 package를 구할 수 있다. 해당 명령어를 사용하면 `/var/cache/apt/archives/` 해당 위치에
package 파일이 받아지게 된다.

해당 파일을 usb에 옮겨담아 server에만 담아주면 충분하다.

### usb를 우분투에 연결하기
아쉽게도 우분투에서는 usb를 연결하면 새로운 드라이버로 인식하지 못한다. 그냥 파일이 `/dev/` 디렉토리에 추가될 뿐이다.
심지어 해당 disk의 이름도 모른다.
원래 `/dev/`디렉토리에 뭐가 있었는지 기억하고 있다가 추가되는 걸 봐야할 뿐이다.
(물론 대게 리눅스가 설치된 드라이브를 sda로 저장하고 외부 것을 sdb로 표현하는 정도는 알 수 있다.)

아니면 우리가 연결한 usb 드라이브의 용량이나 파일 시스템 등을 기억해
`sudo fdisk -f` 명령어를 통해 비교하여 찾아 낼 수도 있다. (추천 방법!)

아무튼 추가된 파일을 우리가 안의 내용을 볼 수 있도록 `mount`과정을 거쳐야만 한다.

인식된 usb 드라이브를 `/dev/sdb1`이라고 하면
```shellscript
sudo mkdir /media/usb
sudo mount -t vfat /dev/sdb1 /media/usb
```
같은 식으로 연결해주면 된다.

### 네트워크 장비 설정
해당 글에서는 `ls /sys/class/net | grep -i wlp`명령어를 이용하여 장비를 찾았지만
나의 경우 `ip addr` 명령어를 통해 장비명을 알아내었다.(네트워크 관리사 공부의 영향으로 ip 명령어가 편하다.)

위 경우 나는 eth0 등 전통적인 네이밍이 없어서 놀랐는데 찾아보니 규칙이 다양한 것이더라. [궁굼하면](https://unix.stackexchange.com/questions/134483/why-is-my-ethernet-interface-called-enp0s10-instead-of-eth0#answer-134485)

그리고 해당 이름을 알아냈으면
```
sudo cp /etc/netplan/00-installer-config.yaml /etc/netplan/00.bak
sudo vim /etc/netplan/00-installer-config.yaml
```
에서 세팅을 해주자 (아래 내용은 dhcp4를 이용하는 경우)
```yaml
network:
  ethernetes: {}
  wifis:
    wlp***:
      dhcp4: true
      optional:true
      access-points:
        "network_ssid_name":
          password: "**********"
  version: 2
  renderer: networkd
```

### 오류 확인과 적용
항상 중요한 거지만 linux의 꽃은 오류이다. 시스템이 불안정하여 언제 오류로 죽을지 모른다. 오류체크는 생명이다.
`sudo netplan --debug generate` netplan의 설정을 해당 명령어를 통해 먼저 확인해주자.
(필자의 경우 password를 passwrd라 작성하여 오류가 날 뻔하였다.)

그러곤 적용시켜주자
```
sudo netplan apply
sudo reboot
```

## 노트북을 덮으면 리눅스가 꺼진다고!?
그렇다. 해당 서버도 태생이 노트북인지라 덮으면 절전모드로 들어가진다. 우분투에서도 기본적으로 해당 기능을 지원한다.
따라서 제 기능을 못하도록 막아두자!

```
sudo vi /etc/systemd/logind.conf

<HandleLidSwitch=ignore 으로 값 변경>

systemctl restart systemd-logind
```

해주면 끝!

---
### 참고링크
- [wifi 설정](https://medium.com/@yping88/how-to-enable-wi-fi-on-ubuntu-server-20-04-without-a-wired-ethernet-connection-42e0b71ca198)
- [네트워크 장비 명 규칙](https://unix.stackexchange.com/questions/134483/why-is-my-ethernet-interface-called-enp0s10-instead-of-eth0#answer-134485)
- [덮개 설정](http://w3devlabs.net/wp/?p=16711)
