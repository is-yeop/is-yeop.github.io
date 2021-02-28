# January 09th, 2021

# R

- [원하는 줄 추출](https://c10106.tistory.com/5318)

# ggplot

- Error (ggmap_test.R#20): Discrete value supplied to continuous scale
    - 원본 코드 : 
    ```
        map <- get_map(location = c(127.07729963862394, 37.15018706280286), zoom = 10, maptype = "roadmap", color = "bw")

        illigal_parking <- read.csv(file = "../data/1.오산시_주정차단속(2018~2020).csv", header = TRUE, as.is = TRUE)

        sub_illigal_parking <- subset(illigal_parking, select = c("스쿨존여부", "단속위치_경도", "단속위치_위도"))

        ggmap(map) + geom_point(
            data = sub_illigal_parking,
            aes(x = (단속위치_경도),
            y = (단속위치_위도),
            color = 스쿨존여부,
            alpha = 0.5, size = 4)
            )
    ```
    
    - 원인 : 위도 경도 값이 문자열인 경우 점 위치를 표시할 수 없었던 거임

    - 해결 : 문자열을 숫자 취급해주자!
    ```
    ggmap(map) + geom_point(
  data = sub_illigal_parking,
  aes(x = as.numeric(단속위치_경도),
      y = as.numeric(단속위치_위도),
      color = 스쿨존여부,
      alpha = 0.5, size = 4))
    ```

# github에 로그인 하기
- 가능?