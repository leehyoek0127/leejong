package model;
import java.sql.Date;
import java.sql.Timestamp;

public class YonglistDto {
	String yId;
	int yNo;
	
	String yMember;
	Date yDate;
	String yBranch;
	String yGround;
	String yTel1;
	String yTel2;
	String yTel3;
	String yMatchdate;
	String yTime;
	String yApply;
	String yTeam;
	String yContents;
	public int getyNo() {
		return yNo;
	}
	public void setyNo(int yNo) {
		this.yNo = yNo;
	}
	public String getyId() {
		return yId;
	}
	public void setyId(String yId) {
		this.yId = yId;
	}
	public String getyTel1() {
		return yTel1;
	}
	public void setyTel1(String yTel1) {
		this.yTel1 = yTel1;
	}
	public String getyTel2() {
		return yTel2;
	}
	public void setyTel2(String yTel2) {
		this.yTel2 = yTel2;
	}
	public String getyTel3() {
		return yTel3;
	}
	public void setyTel3(String yTel3) {
		this.yTel3 = yTel3;
	}
	public String getyMember() {
		return yMember;
	}
	public void setyMember(String yMember) {
		this.yMember = yMember;
	}
	public Date getyDate() {
		return yDate;
	}
	public void setyDate(Date yDate) {
		this.yDate = yDate;
	}
	public String getyBranch() {
		return yBranch;
	}
	public void setyBranch(String yBranch) {
		this.yBranch = yBranch;
	}
	public String getyGround() {
		return yGround;
	}
	public void setyGround(String yGround) {
		this.yGround = yGround;
	}
	
	public String getyMatchdate() {
		return yMatchdate;
	}
	public void setyMatchdate(String yMatchdate) {
		this.yMatchdate = yMatchdate;
	}
	public String getyTime() {
		return yTime;
	}
	public void setyTime(String yTime) {
		this.yTime = yTime;
	}
	public String getyApply() {
		return yApply;
	}
	public void setyApply(String yApply) {
		this.yApply = yApply;
	}
	public String getyTeam() {
		return yTeam;
	}
	public void setyTeam(String yTeam) {
		this.yTeam = yTeam;
	}
	public String getyContents() {
		return yContents;
	}
	public void setyContents(String yContents) {
		this.yContents = yContents;
	}

	
	
	
}
