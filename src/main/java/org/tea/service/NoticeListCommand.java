package org.tea.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tea.dao.NoticeDAO;
import org.tea.entity.PageTO;

public class NoticeListCommand implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int curPage = 1;
		
		if (req.getParameter("curPage") != null) {
			curPage = Integer.parseInt(req.getParameter("curPage"));
		}
		
		NoticeDAO dao = new NoticeDAO();
		PageTO list = dao.page(curPage);
		
		req.setAttribute("list", list.getNoticelist());
		req.setAttribute("page", list); //왼쪽이름으로 list로 오른 쪽 값을 담음
	}

}
