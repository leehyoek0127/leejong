package model;

import java.sql.Date;

public class TeamBoardListDto {
	int T_B_NO;
	String T_B_CONTENTS;
	String T_B_SUBJECT;
	Date T_B_DATE;
	int T_B_READCOUNT;
	String id;
	int T_CODE;
	public int getT_B_NO() {
		return T_B_NO;
	}
	public void setT_B_NO(int t_B_NO) {
		T_B_NO = t_B_NO;
	}
	public String getT_B_CONTENTS() {
		return T_B_CONTENTS;
	}
	public void setT_B_CONTENTS(String t_B_CONTENTS) {
		T_B_CONTENTS = t_B_CONTENTS;
	}
	public String getT_B_SUBJECT() {
		return T_B_SUBJECT;
	}
	public void setT_B_SUBJECT(String t_B_SUBJECT) {
		T_B_SUBJECT = t_B_SUBJECT;
	}
	public Date getT_B_DATE() {
		return T_B_DATE;
	}
	public void setT_B_DATE(Date t_B_DATE) {
		T_B_DATE = t_B_DATE;
	}
	public int getT_B_READCOUNT() {
		return T_B_READCOUNT;
	}
	public void setT_B_READCOUNT(int t_B_READCOUNT) {
		T_B_READCOUNT = t_B_READCOUNT;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getT_CODE() {
		return T_CODE;
	}
	public void setT_CODE(int t_CODE) {
		T_CODE = t_CODE;
	}
	
}
