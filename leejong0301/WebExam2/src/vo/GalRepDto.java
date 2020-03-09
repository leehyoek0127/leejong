package vo;

import java.sql.Date;

public class GalRepDto {
	int g_rep_no;
	String g_rep_contents;
	Date g_rep_date;
	int g_b_no;
	String id;
	public int getG_rep_no() {
		return g_rep_no;
	}
	public void setG_rep_no(int g_rep_no) {
		this.g_rep_no = g_rep_no;
	}
	public String getG_rep_contents() {
		return g_rep_contents;
	}
	public void setG_rep_contents(String g_rep_contents) {
		this.g_rep_contents = g_rep_contents;
	}
	
	public Date getG_rep_date() {
		return g_rep_date;
	}
	public void setG_rep_date(Date g_rep_date) {
		this.g_rep_date = g_rep_date;
	}
	public int getG_b_no() {
		return g_b_no;
	}
	public void setG_b_no(int g_b_no) {
		this.g_b_no = g_b_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
