package vo;

import java.sql.Date;

public class GalBoardDto {
	int g_b_no;
	String g_b_contents;
	String g_b_subject;
	Date g_b_date;
	int g_b_readcount;
	String g_b_file;
	String id;
	int t_code;
	public int getG_b_no() {
		return g_b_no;
	}
	public void setG_b_no(int g_b_no) {
		this.g_b_no = g_b_no;
	}
	public String getG_b_contents() {
		return g_b_contents;
	}
	public void setG_b_contents(String g_b_contents) {
		this.g_b_contents = g_b_contents;
	}
	public String getG_b_subject() {
		return g_b_subject;
	}
	public void setG_b_subject(String g_b_subject) {
		this.g_b_subject = g_b_subject;
	}
	public Date getG_b_date() {
		return g_b_date;
	}
	public void setG_b_date(Date g_b_date) {
		this.g_b_date = g_b_date;
	}
	public int getG_b_readcount() {
		return g_b_readcount;
	}
	public void setG_b_readcount(int g_b_readcount) {
		this.g_b_readcount = g_b_readcount;
	}
	public String getG_b_file() {
		return g_b_file;
	}
	public void setG_b_file(String g_b_file) {
		this.g_b_file = g_b_file;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getT_code() {
		return t_code;
	}
	public void setT_code(int t_code) {
		this.t_code = t_code;
	}
	
}
