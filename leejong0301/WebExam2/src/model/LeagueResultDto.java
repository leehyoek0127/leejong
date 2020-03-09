package model;

import java.sql.Date;

public class LeagueResultDto {
	int league_result_code;
	int league_win;
	int league_lose;
	int league_draw;
	int league_gf;
	int league_ga;
	int t_code;
	int league_code;
	
	public int getLeague_result_code() {
		return league_result_code;
	}
	public void setLeague_result_code(int league_result_code) {
		this.league_result_code = league_result_code;
	}
	public int getLeague_win() {
		return league_win;
	}
	public void setLeague_win(int league_win) {
		this.league_win = league_win;
	}
	public int getLeague_lose() {
		return league_lose;
	}
	public void setLeague_lose(int league_lose) {
		this.league_lose = league_lose;
	}
	
	public int getLeague_draw() {
		return league_draw;
	}
	public void setLeague_draw(int league_draw) {
		this.league_draw = league_draw;
	}
	
	public int getLeague_gf() {
		return league_gf;
	}
	public void setLeague_gf(int league_gf) {
		this.league_gf = league_gf;
	}
	public int getLeague_ga() {
		return league_ga;
	}
	public void setLeague_ga(int league_ga) {
		this.league_ga = league_ga;
	}
	public int getT_code() {
		return t_code;
	}
	public void setT_code(int t_code) {
		this.t_code = t_code;
	}
	public int getLeague_code() {
		return league_code;
	}
	public void setLeague_code(int league_code) {
		this.league_code = league_code;
	}
}