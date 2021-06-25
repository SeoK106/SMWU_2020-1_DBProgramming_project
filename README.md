# [SMWU 2020-1] 도서관 홈페이지 제작하기 
##### #데이터베이스프로그래밍 #대학교도서관서비스 #팀프로젝트 #웹/데이터베이스
<br>
JSP와 JDBC,PL/SQL을 사용해 **데이터베이스와 웹이 연동된 프로그램**을 만들어보기 위해 도서관 서비스를 구현해보았다.<br>

대학교 도서관 홈페이지에서는 다양한 서비스를 제공하는데 우리는 그 중 **도서 서비스**와 **좌석 서비스**, 그리고 **로그인 서비스**를 구현했다.<br>

![1](https://user-images.githubusercontent.com/66738234/123346002-4553e680-d592-11eb-8645-dac94bbfa957.jpg)

개발환경
---
- Java SE 8 이상의 **Java** 설치
- JSP사용을 위해 JSP인터프리터인 **Tomcat** 설치 
- **JDBC 드라이버** 설치

폴더 설명
---
- PL/SQL로 쓰여서 데이터베이스와 관련된 코드는 [sql 폴더](https://github.com/SeoK106/SMWU_2020-1_DBProgramming_project/tree/master/sql)에 있다.
- HTML로 웹을 개발하고 Java로 데이터베이스와 연동하여 개발한 코드는 [jsp 폴더](https://github.com/SeoK106/SMWU_2020-1_DBProgramming_project/tree/master/jsp)에 있다.  
- [images 폴더](https://github.com/SeoK106/SMWU_2020-1_DBProgramming_project/tree/master/images)에는 사용한 로고와 심볼 이미지가 들어있다. 


웹 기능
---
로그인 후 도서 검색이나 **대출, 반납, 예약**을 할 수 있고, 좌석의 **예약과 예약 취소**를 할 수 있다.<br>
추가로 **비밀번호 변경** 기능도 있다. 
![2](https://user-images.githubusercontent.com/66738234/123346572-97e1d280-d593-11eb-8f57-20699c7a3124.jpg)
![3](https://user-images.githubusercontent.com/66738234/123346579-9adcc300-d593-11eb-8b06-c82a0ac67c41.jpg)

여러 기능을 실행 후 마이페이지에 들어가면 **데이터베이스에 로그인한 아이디로 저장된 정보**를 모두 불러와 보여준다.

![4](https://user-images.githubusercontent.com/66738234/123346517-78e34080-d593-11eb-86c9-78fb3ec93835.jpg)
