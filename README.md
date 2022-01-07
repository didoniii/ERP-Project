# ERP-Project

	ERP Program
ERP ( Enterprise Resource Planning ) : 전사적 자원관리의 약어.
쉽게 말해 기업에서 사용하는 모든 자원을 관리하기 쉽도록 지원하는 시스템 전략입니다.
회계/구매/경영/재고/판매/물류/생산/인사 등등 많은 자원 요소들이 있습니다.
각 회사마다 중점적으로 취급하는 품목이 다르고 업무 프로세스가 다르기 때문에 각 회사마다
구축하는 ERP의 요소는 다릅니다.
본 프로젝트에서는 유통회사의 ERP 프로그램을 개발하였습니다.





	목차
1.	개발환경
2.	구현 기능
3.	Database 모델링
4.	ERP 기능





1.	개발환경
	
	OS  :  MS Windows10
	DB  :  Oracle 11g
	Tool  :  Eclipse
	Version  :  JDK 1.8
	Server  :  Tomcat 9.0
	Framework  :  Mybatis
	Language  :  Java, JavaScript, html5/css3





2.	구현 기능

	구매
   →	구매를 위한 구매처 등록
   →	구매를 위한 상품 등록
   →	구매 주문 관리  
   
	판매
   →	판매를 위한 판매처 등록
   →	판매 주문 관리
   
	재고
   →	현 재고 현황과 재고 변동 내역 관리
   →	입고 내역 관리
   →	출고 내역 관리
   
	회계
   →	매입 내역 관리
   →	매출 내역 관리
   →	총 이익, 상품 별 월별 결산 
   
	인사
   →	사원 등록
   →	사원 정보 관리
   →	로그인 관리





3.	Database 모델링
	
	![image](https://user-images.githubusercontent.com/87827545/148508305-527814b1-e7b3-4b3d-a213-39ebbd91d1f7.png)
  
  
  
  
  
4.	ERP 기능
	구매등록/ 판매등록

![image](https://user-images.githubusercontent.com/87827545/148508608-bd9a7c14-2a52-4085-a6b9-b7658f926bde.png)   ![image](https://user-images.githubusercontent.com/87827545/148508623-faec073c-5bd3-4c23-9ff8-d7208fa3b8ef.png)
      
-	구매 등록 시 예산과 매입단가를 고려하여 구매 가능한 수량이 몇 개인지 보여줍니다.
-	판매 등록 시에는 해당 상품의 현재 재고 개수를 보여줍니다.

	재고 변동 내역
 
 ![image](https://user-images.githubusercontent.com/87827545/148508719-45324283-39e6-47bb-b29c-0fe11c7238cc.png)

-	재고 현황에서 재고를 수정하게 되면 기존 재고와 변동된 재고의 개수를 고려하여 변동된 개수 도출하여 이를 보여주는 페이지를 만들었습니다. 

	월별결산
 
 ![image](https://user-images.githubusercontent.com/87827545/148508739-2055cfb9-1b5c-4a3c-8fc7-60a4d47a8756.png)

-	월별 결산에서 해당 월에서 상품별로 매입/판매 단가 , 매입/판매 수량, 매입/매출 총액들을 고려하여 손익이 얼마인지 보여줍니다.

	비밀번호 초기화

![image](https://user-images.githubusercontent.com/87827545/148508779-fbde5131-124c-4b14-b885-ccc732c57bce.png)
![image](https://user-images.githubusercontent.com/87827545/148508795-aae07840-e522-45a1-8a62-a1db360958dd.png)
![image](https://user-images.githubusercontent.com/87827545/148508798-92dd1235-e667-4959-ac09-15bfe68a0498.png)

-	정보 수정 시 비밀번호 5회 이상 틀리게 되면 자동으로 비밀번호가 초기화 됩니다.
-	두번째 사진과 같은 알림창이 뜹니다. 확인을 누를 시 사원정보에 있던 이메일의 사이트로 자동 이동되고 새로운 임시 비밀번호가 메일로 전송 됩니다. 
-	새로운 임시번호를 받은 이메일에서 바로 로그인 페이지로 이동하여 로그인을 합니다.

![image](https://user-images.githubusercontent.com/87827545/148508834-1602002c-7394-4403-9362-92e8ca6cc55f.png)   ![image](https://user-images.githubusercontent.com/87827545/148508856-c71fb9a7-2b82-40ee-a74b-78451f932547.png)

-	로그인 페이지에서 ‘비밀번호를 잊으셨나요?’를 클릭하면 오른쪽 사진과 같은 화면이 나오고 사번과 등록되어 있는 이메일을 입력하면 정보수정에서 보았던 과정 그대로 기존 비밀번호가 초기화 되고 새로운 임시비밀번호가 주어집니다.
-	
	사원등록
 
 ![image](https://user-images.githubusercontent.com/87827545/148508951-f31a8f91-5cde-48f5-88eb-d3047204fde5.png)

-	인사팀의 권한을 가진 사원만 사원 등록을 할 수 있습니다.
-	새로운 사원을 등록하면 초기 비밀번호는 자동으로 ‘0000’으로 설정됩니다.
 
 ![image](https://user-images.githubusercontent.com/87827545/148508969-89637852-8b96-4b1b-90ba-af8ec7c65bbd.png)

-	신입사원이 본인의 사번과 초기 비밀번호 ‘0000’을 입력하면 이와 같은 창이 나옵니다.
-	확인을 누르면 정보수정 페이지로 이동합니다.
 
 ![image](https://user-images.githubusercontent.com/87827545/148508986-49f9eb86-7961-4897-95ad-be61efbba51b.png)

-	인사팀이 아닌 다른 팀으로 등록된 사원은 사원등록 탭을 누르면 사원등록 권한이 없다는  창이 나옵니다.

  






