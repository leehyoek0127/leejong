package model;

import java.sql.Date;

public class LeagueDto {
	int league_code;
	String league_name;
	Date league_date;
	int branch_no;
	public int getLeague_code() {
		return league_code;
	}
	public void setLeague_code(int league_code) {
		this.league_code = league_code;
	}
	public String getLeague_name() {
		return league_name;
	}
	public void setLeague_name(String league_name) {
		this.league_name = league_name;
	}
	public Date getLeague_date() {
		return league_date;
	}
	public void setLeague_date(Date league_date) {
		this.league_date = league_date;
	}
	public int getBranch_no() {
		return branch_no;
	}
	public void setBranch_no(int branch_no) {
		this.branch_no = branch_no;
	}
	
}
