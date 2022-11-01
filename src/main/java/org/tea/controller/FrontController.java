package org.tea.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tea.service.Command;
import org.tea.service.NoticeListCommand;

@SuppressWarnings("serial")
@WebServlet("*.do")
public class FrontController extends HttpServlet{
	// 일반 클래스를 서블릿을 상속해서 컨트롤러 역활 할수있도록 설정
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청과 응답을 같은 포맷으로 맞춰줬다.
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		// 프로젝트명 + 주소
		String requestURI = req.getRequestURI();
		// 프로젝트명
		String contextPath = req.getContextPath();
		// 가상주소
		String com = requestURI.substring(contextPath.length());
		
		Command command = null;
		String nextPage = null;
		
		if (com.equals("/noticelist.do")) {
			command = new NoticeListCommand();
			command.execute(req, resp);
			nextPage = "/notice/list.jsp";
		}
		
		RequestDispatcher dis =	req.getRequestDispatcher(nextPage);
		dis.forward(req, resp);
	}
	
}
