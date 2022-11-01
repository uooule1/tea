package org.tea.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.tea.entity.NoticeDTO;
import org.tea.entity.PageTO;

public class NoticeDAO {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	
	String url = "jdbc:mysql://localhost:3306/tea?serverTimezone=UTC";
	String userid = "root";
	String password = "12345";
	
	public NoticeDAO() {
		try {
			Class.forName(driver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	// 공지게시판 전체 컬럼 카운트
	public int totalCount() {
		int count = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, password);
			String sql = "SELECT count(*) FROM notice";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	
	//페이징 구현
	public PageTO page(int curPage) {
		PageTO to = new PageTO();
		int totalCount = totalCount();
		
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, password);
			String sql = "SELECT * FROM notice ORDER BY n_num DESC";
			ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = ps.executeQuery();
			
			int perPage = to.getPerPage();
			int skip = (curPage - 1) * perPage;
			if (skip > 0) {
				rs.absolute(skip);
			}
			
			for (int i = 0; i < perPage && rs.next(); i++) {
				int n_num = rs.getInt("n_num");
				String n_title = rs.getString("n_title");
				int n_readnum = rs.getInt("n_readnum");
				String n_createdate = rs.getString("n_createdate");
				
				if (n_title.length() >= 40) {
					n_title = n_title.substring(0,40) + "...";
				}
				
				NoticeDTO data = new NoticeDTO();
				data.setN_num(n_num);
				data.setN_title(n_title);
				data.setN_readnum(n_readnum);
				data.setN_createdate(n_createdate);
				
				list.add(data);
						
			}
			
			to.setNoticelist(list);
			to.setTotalCount(totalCount);
			to.setCurPage(curPage);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return to;
	}

}
