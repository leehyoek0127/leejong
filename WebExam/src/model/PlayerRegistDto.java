package model;

import java.sql.Date;

public class PlayerRegistDto {
	
	int player_games;
	int player_goals;
	int player_yellow;
	int player_red;
	String id;
	int league_code;
	int t_code;
	String player_position;
	int player_uniformnum;
	public int getPlayer_games() {
		return player_games;
	}
	public void setPlayer_games(int player_games) {
		this.player_games = player_games;
	}
	public int getPlayer_goals() {
		return player_goals;
	}
	public void setPlayer_goals(int player_goals) {
		this.player_goals = player_goals;
	}
	public int getPlayer_yellow() {
		return player_yellow;
	}
	public void setPlayer_yellow(int player_yellow) {
		this.player_yellow = player_yellow;
	}
	public int getPlayer_red() {
		return player_red;
	}
	public void setPlayer_red(int player_red) {
		this.player_red = player_red;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLeague_code() {
		return league_code;
	}
	public void setLeague_code(int league_code) {
		this.league_code = league_code;
	}
	public int getT_code() {
		return t_code;
	}
	public void setT_code(int t_code) {
		this.t_code = t_code;
	}
	public String getPlayer_position() {
		return player_position;
	}
	public void setPlayer_position(String player_position) {
		this.player_position = player_position;
	}
	public int getPlayer_uniformnum() {
		return player_uniformnum;
	}
	public void setPlayer_uniformnum(int player_uniformnum) {
		this.player_uniformnum = player_uniformnum;
	}
	
}