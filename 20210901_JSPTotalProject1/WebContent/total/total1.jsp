<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1.model 1방식
	  = JSP안에서 처리 (Java/HTML혼합)
	  = 자바와 HTML의 구분
	       구분 (스크립트)
	    <% %> : 일반 자바(메소드 호출, 변수 선언, 클래스 메모리 할당, 제어문 , 연산자)
	            = 선언변수(지역변수)
	            *** JSP는 클래스가 아니다 (메소드 영역= _jspService())
	            *** HTML앞에는 out.println() 생략 (편집이 쉽게 제작)
	            *** JSP가 구동되면 호출되는 메소드 (톰캣에 의해 호출
	            1) _jspInit() => 한번만 호출되는 메소드 (생상자 함수 역할) => 초기화
	            			  => web.xml에 데이터 저장 => 읽어서 초기화
	            2) _jspService() => 사용자가 요청시 마다 호출되는 메소드
	         	   접속한 사용자마다 따로 호출되는 메소드 (쓰레드)
	         	   쓰레드는 서버프로그램에서 접속자마다 별도의 쓰레드가 생성 따로 동작
	         	   접속자가 10명이면 쓰레드가 10개 생성 => 서버로 따로 동작을 할 수 있게 만들어준다.
	         	   쓰레드안에는 통신을 담당하는 기능을 가지고 있다( 서버프로그램 내장)
	            3) _jspDestory() => 새로고침 , 화면이동 (jsp의 메모리 해제) => 초기화
	    <%= %> : 브라우저 출력 (out.println(****);) => ;을 사용하면 오류 발생
	    <%! %> : 메소드 제작, 멤버 변수 선언
	    a.jsp 요청 ===> 톰캣에 의해 클래스가 제작
	               	  ================== a_jsp
	               	  public class a_jsp extends HttpServlet
	               	  {
	               	  	<%! %>에 코딩한 내용은 여기에 첨부
	               	  	public void _jspInit()
	               	  	{
	               	  	}
	               	  	public void _jspDestory()
	               	  	{
	               	  	}
	               	  	public void _jspService()
	               	  	{
	               	  		<% %> 코딩한 내용이 첨부
	               	  		HTML => out.println()
	               	  	}
	               	  }
	               	  ==> 1) 컴파일 (a_jsp.class) javac
	               	      2) 실행 (java) => 메모리에 HTML만 출력 (buffer)
	               	      3) 출력된 HTML을 브라우저에서 읽어서 인터프리터를한다
	               	         **인터프리터 (HTML) : 한줄씩 출력
	     = 자바 사용시 (지시자) => <%@ 지시자명 속성 ="값" 속성명 ="값" %>
	       ======== 속성은 이미 만들어져 있다
	         = 자바 정보 : page : contentType="" => HTML<XML,JSON
	         				   import ="자바 라이브러리"
	         				           ============ 자동인식 라이브러리
	         				           java.lang.* , javax..servlet.http.*
	         				                         =====================
	         				                         request,response,session
	         				   errorPage="에러시 이동할 페이지"
	         				   buffer="8kb" => 화면이 완전출력을 하지 않는다
	         = 자바/태그 : tablib : 12장
	                    ====== 
	                    core : 변수 선언 , 제어문 , URL
	                           <c:set var="" value=""/>
	                                   |        |
	             request.setAttribute( key, value)  
	                                   제어문 :
	                           <c:if test="조건문"> , 
	                           <c:forEach var="변수" begin="" end="" step=""> :일반 for ,
	                           			  variable(변수선언) begin= 초기값
	                           			  				   end= 범위 (포함)
	                           			  				   step= 증가 (감소값은 없다)
	                                               예) for(int i=1; i<=10;i++)
	                                  <c:forEach var="i" begin="1" end="10" step="1">
	                           <c:forEach>	:forEach문
	                           		for(MovieVO vo :list)
	                           		=> <c:forEach var="vo" item="${list}">
	                           		                       ==============
	                           		                       request.getAttribute("list")		  				   
	                           <c:choose> : 다중 조건문
	                           		<c:choose>
	                           			<c:when test="조건문"></c:when>
	                           			<c:when test="조건문"></c:when>
	                           			<c:when test="조건문"></c:when>
	                           			<c:otherwise></c:otherwise> ==> else(조건에 해당이 없는경우)
	                           		</c:choose>
	                           <c:forTokens> => StringTokenizer
	                           	<c:forTokens var="s" value="red,blue,black" delmits=",">
	                           	 그림파일 출력
	                           	 자바) StringTokenizer s= new String Tokenizer(value, demits);
	                           	 	  while(st.hasMoreTokens())
	                           	 	  {
	                           	 	  	String s=st.nextToken()
	                           	 	  }
	                    url관련 : <c:redirect>    => <c:redirect url="">
	                    						    response.sendRedirect(url); 화면이동
	                    fmt : 날짜변환, 숫자변환
	                          <fmt:formatDate value="" pattern="yyyy-MM-dd hh:mm:ss">
	                          	=> SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
	                    fn : String 메소드
	                    	fn:trim(),fn:length(),fn:substring(),fn:indexOf()
	                    	fn:replace()
	               11장 :
	               JSP(View역할) => Spring
	                               ====== Model, Controller(이미 제작:DispatcherServlet)
	                                      =====
	                                      ~VO ,~DAO,~Manager ,~Model(자바 코딩)
	               11장 => 화면 출력 (EL)
	                      ${값}
	                      = request.setAttribute()
	                        => 사용자 요청 정보를 보내느 경우 : request에 결과값을 추가해서 전송
	                        => request에 추가된 데이터를 받는경우 : ${키}
	                        							   =====
	                      = session.setAttribute() => ${sessionScope.키}
	                      							  =================
	                      							   session.getAttribute(키)
	                      = 연산자 : 문자열 비교 (== eq, != ne)
	                                          문자열 결합 => +=
	                                          산술연산    => "10" +"20" => Integer.parseInt()							                           	
	         =다른 JSP파일을 추가    :include      	        
	         	<%@ include file=""%> 정적 (처음 한번만 추가) => JSP+JSP => 한개의 JSP를 만들어서
	         = 내장객체
	           ======
	            request : 사용자 요청 정보 (사용자가 보낸값)
	            		  1. setCharacterEncording("UTF-8") => 디코딩
	            		  2. 사용자가 보낸 값을 받는다
	            		     getParameter()
	            		     getParameterValues() => <select> <input type =checkbox>
	            		                             ========
	            		                             single , multi
	            		  3. 값을 추가 : setAttribute() , 추가된 값 일기 getAttribute() => ${}
	            		  4. getRequestURI() , getContextPath()
	            		     http://localhost:8080 /JSPProject/main/main.jsp (URL)
	            		     ===================== ========================= URI
	            		           	 서버정보               ============ ContextPath    
	            		  5. 세션 생성 , 쿠키읽기         
	            		     ======
	            		      request.getSession(), request.getCookie()	                        
	            response : 응답, 화면 이동 정보
	                       === 두가지 응답 (HTML, Cookie) => 한개의 JSP에서는 한번만 전송이 가능
	                                    ============= 두개를 동시에 보낼수 없다(한개 선택)
	                        response.setContentType("text/html") => page지시자에 선언
	                        response.addCookie()            
	                       === 화면 이동 sendRedirext , 브라우저 전송전에 미리 보낸다             
	            session : 서버에 사용자의 일부정보 저장
	                           저장 : setAttribute("키",Object) => 쿠키는 문자열만 저장이 가능 , 세션은 Object저장
	                           읽기 : getAttribute()
	                           저장기간 설정 :setManInactiveInterval(1800) => 30qns
	                           삭제 :
	                           1개 삭제 :removeAttribute(키) : 장바구니에서 한개 제거, 찜제거
	                                               전체 삭제 : invalidate() => 브라우저 종료 , 로그아웃
	                                                              
	            application : 서버정보 (실제 경로명)	 
	                          web.xml에 등록된 값 읽기 => 그림 올리기(후기게시판,갤러리게시판)
	2.model 2방식 (현재 실무) => MVC(Model = View = Contoroller)
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>