package com.five.mall.model.dto;

public class BoardDto {

	private String brdno;
	private String brdtitle;
	private String brdwriter;
	private String brdcontent;
	private String brddate;
	private String brdhit;
	
	public String getBrdno() {
		return brdno;
	}
	public void setBrdno(String brdno) {
		this.brdno = brdno;
	}
	public String getBrdtitle() {
		return brdtitle;
	}
	public void setBrdtitle(String brdtitle) {
		this.brdtitle = brdtitle;
	}
	public String getBrdwriter() {
		return brdwriter;
	}
	public void setBrdwriter(String brdwriter) {
		this.brdwriter = brdwriter;
	}
	public String getBrdcontent() {
		return brdcontent;
	}
	public void setBrdcontent(String brdcontent) {
		this.brdcontent = brdcontent;
	}
	public String getBrddate() {
		return brddate;
	}
	public void setBrddate(String brddate) {
		this.brddate = brddate;
	}
	public String getBrdhit() {
		return brdhit;
	}
	public void setBrdhit(String brdhit) {
		this.brdhit = brdhit;
	}
	@Override
	public String toString() {
		return "BoardDto [brdno=" + brdno + ", brdtitle=" + brdtitle + ", brdwriter=" + brdwriter + ", brdcontent="
				+ brdcontent + ", brddate=" + brddate + ", brdhit=" + brdhit + "]";
	}
	
	
}
