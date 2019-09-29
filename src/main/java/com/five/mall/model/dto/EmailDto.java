package com.five.mall.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class EmailDto {

	private String senderName;
	private String receiveMail;
	private String subject;
	private String message;
	private String pictureUrl;
	private MultipartFile file;
	
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getReceiveMail() {
		return receiveMail;
	}
	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "EmailDto [senderName=" + senderName + ", receiveMail=" + receiveMail + ", subject=" + subject
				+ ", message=" + message + ", pictureUrl=" + pictureUrl + ", file=" + file + "]";
	}
}
