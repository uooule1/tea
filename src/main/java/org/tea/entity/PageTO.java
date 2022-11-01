package org.tea.entity;

import java.util.ArrayList;

public class PageTO {

	ArrayList<NoticeDTO> noticelist;
	
	
	int curPage;
	int perPage=10;
	int totalCount;
	
	
	public ArrayList<NoticeDTO> getNoticelist() {
		return noticelist;
	}
	public void setNoticelist(ArrayList<NoticeDTO> noticelist) {
		this.noticelist = noticelist;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
