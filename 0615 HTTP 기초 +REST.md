# 0615 HTTP 기초 +REST

## 1. 웹서비스의 기초



(요청) ----------------------주소( URL)--------------------->  (응답)

​		<-----------------------문서(HTML,

​					                XML,Json등...) ------------------

*HTTP 기본속성:



Stateless: 상태정보가 저장되지 않음. 즉, 요청 사이에는 연결고리가 없음.

Connectless: 서버에 요청을 하고 응답을 한 이후에 연결은 끊어짐.



*URL(Uniform Resource Locator): 특정 웹서버의 특정 자원에 대한 구체적인 위치



*URI(Uniform Resource Identifier): 특정 자원 식별자



*

**Scheme/Protocol**          <u>Host</u>                      'Port'                     Path

**http://**                             <u>localhost</u>                '3000'                    ports/3



*HTTP 요청 메세지

Method / Path / Version of protocol

=GET / HTTP / 1.1



## REST(Representational State Transfer)

* HTTP를 더 효과적으로 사용하기 위해 방법론 적으로 새로 개발한 것

​     가장핵심: 1) 자원(URI), 2) 행위(HTTP Method), 3) 표현(Representations)