package model;

import java.sql.Date;


public class QnaDto {
	int qNo;
	String qMember;
	String qSecret;
	String qSecretNum;
	Date qDate;
	int qCount;
	String qContents;
	String qTitle;
	String qEmail;
	String qId;
	
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getqMember() {
		return qMember;
	}
	public void setqMember(String qMember) {
		this.qMember = qMember;
	}
	public String getqSecret() {
		return qSecret;
	}
	public void setqSecret(String qSecret) {
		this.qSecret = qSecret;
	}
	public String getqSecretNum() {
		return qSecretNum;
	}
	public void setqSecretNum(String qSecretNum) {
		this.qSecretNum = qSecretNum;
	}
	
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public int getqCount() {
		return qCount;
	}
	public void setqCount(int qCount) {
		this.qCount = qCount;
	}
	public String getqContents() {
		return qContents;
	}
	public void setqContents(String qContents) {
		this.qContents = qContents;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqEmail() {
		return qEmail;
	}
	public void setqEmail(String qEmail) {
		this.qEmail = qEmail;
	}
	public String getqId() {
		return qId;
	}
	public void setqId(String qId) {
		this.qId = qId;
	}
	
	
}
