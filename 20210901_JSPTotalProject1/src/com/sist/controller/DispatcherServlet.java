package com.sist.controller;

import java.io.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 
 *    MVC 식당
 *    V => 사용자
 *    M => 주방
 *    C => 서빙(매니저)
 *    
 *    JSP (주문) ============= Controller(서빙) ========> Model(음식이 제작)
 *            주문서(request)       주문서           주방(주문서) => request에 담는다
 *        음식차리기 <========== Controller
 *                            ========== service()안에 제작    
 */

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 파일 읽기 => 메뉴만들기 (Model클래스를 저장) => 실행중에 한번만 호출 => Model 클래스를 메모리 할당
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// 메뉴판 만드는곳 => 메뉴판 => .do      main.do , list.do
	}

    // 자동 호출되는 함수 => 사용자 요청이 있으면 호출되는 함수
	// service() => GET/POST 통합 => GET = doGet ,POST = doPost
	// service() => 요청처리 => Model 찾기 => JSP로 request를 전송
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 서빙
	}

}
