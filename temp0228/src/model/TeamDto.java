package model;

import java.sql.Date;

public class TeamDto {
	int t_code;
	String t_name;
	String t_logo;
	int t_ranking;
	String t_uniform_home;
	String t_uniform_away;
	Date t_birth;	
	String t_class;
	int league_result_code;
	String id;
	String teamtype;
	String branchcode;
	String word;
	public String getTeamtype() {
		return teamtype;
	}
	public void setTeamtype(String teamtype) {
		this.teamtype = teamtype;
	}
	public String getBranchcode() {
		return branchcode;
	}
	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	String t_email;
	
	public String getT_email() {
		return t_email;
	}
	public void setT_email(String t_email) {
		this.t_email = t_email;
	}
	public Date getT_birth() {
		return t_birth;
	}
	public void setT_birth(Date t_birth) {
		this.t_birth = t_birth;
	}
	
	public int getT_code() {
		return t_code;
	}
	public void setT_code(int t_code) {
		this.t_code = t_code;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_logo() {
		return t_logo;
	}
	public void setT_logo(String t_logo) {
		this.t_logo = t_logo;
	}
	public int getT_ranking() {
		return t_ranking;
	}
	public void setT_ranking(int t_ranking) {
		this.t_ranking = t_ranking;
	}
	public String getT_uniform_home() {
		return t_uniform_home;
	}
	public void setT_uniform_home(String t_uniform_home) {
		this.t_uniform_home = t_uniform_home;
	}
	public String getT_uniform_away() {
		return t_uniform_away;
	}
	public void setT_uniform_away(String t_uniform_away) {
		this.t_uniform_away = t_uniform_away;
	}
	
	public String getT_class() {
		return t_class;
	}
	public void setT_class(String t_class) {
		this.t_class = t_class;
	}
	public int getLeague_result_code() {
		return league_result_code;
	}
	public void setLeague_result_code(int league_result_code) {
		this.league_result_code = league_result_code;
	}
	
	
	

}
