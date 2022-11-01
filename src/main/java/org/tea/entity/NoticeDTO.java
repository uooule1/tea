package org.tea.entity;

public class NoticeDTO {
	
	private int n_num;
	private String n_title;
	private int n_readnum;
	private String n_createdate;
	
	public NoticeDTO() {}

	

	public NoticeDTO(int n_num, String n_title, int n_readnum, String n_createdate) {
		this.n_num = n_num;
		this.n_title = n_title;
		this.n_readnum = n_readnum;
		this.n_createdate = n_createdate;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public int getN_readnum() {
		return n_readnum;
	}

	public void setN_readnum(int n_readnum) {
		this.n_readnum = n_readnum;
	}

	public String getN_createdate() {
		return n_createdate;
	}

	public void setN_createdate(String n_createdate) {
		this.n_createdate = n_createdate;
	}

}
