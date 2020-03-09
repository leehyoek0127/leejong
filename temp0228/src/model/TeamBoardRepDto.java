package model;

import java.sql.Date;

public class TeamBoardRepDto {
	int tb_rep_no;
	String tb_rep_contents;
	Date tb_rep_date;
	int t_b_no;
	String id;
	public int getTb_rep_no() {
		return tb_rep_no;
	}
	public void setTb_rep_no(int tb_rep_no) {
		this.tb_rep_no = tb_rep_no;
	}
	public String getTb_rep_contents() {
		return tb_rep_contents;
	}
	public void setTb_rep_contents(String tb_rep_contents) {
		this.tb_rep_contents = tb_rep_contents;
	}
	public Date getTb_rep_date() {
		return tb_rep_date;
	}
	public void setTb_rep_date(Date tb_rep_date) {
		this.tb_rep_date = tb_rep_date;
	}
	public int getT_b_no() {
		return t_b_no;
	}
	public void setT_b_no(int t_b_no) {
		this.t_b_no = t_b_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
