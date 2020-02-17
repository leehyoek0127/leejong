package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import vo.MatchlistDto;
import vo.YonglistDto;

public class MatchlistDao {

	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://localhost/futsal?useSSL=false&useUnicode=true&characterEncoding=utf8";
	private final String USER_NAME = "root";
	private final String PASSWORD = "0000";
	Connection conn = null;
	Statement state = null;

	public MatchlistDao() {
		try {// 외부작업으로 들어가니 우선 try
			Class.forName(JDBC_DRIVER); // mysql 에 연결할게 !
		} catch (Exception e) {
		}
	}

	void con_db() { // Connect DB () 작업마다 열어야하는게 맞다.
		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		} catch (Exception e) {

		}
	}

	void exit() { // close 에 관한건 finally 에 넣어서 무조건 끝낸다.
		if (state != null) {
			try {
				state.close();
			} catch (Exception e) {
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
				}
			}
		}
	}

	public void insert(MatchlistDto match) {
		try {
		con_db();
		state = conn.createStatement();
		System.out.println("insert 접근1");
		String s = "insert into matchboard_tb(ID,M_B_NAME,  M_B_BRANCH,  M_B_GROUND,  M_B_TEL,  M_B_SCHEDULE,  M_B_TIME,  M_B_STATUS,  M_B_LEVEL,  M_B_CONTENTS, M_B_TYPE, M_B_COUNT) values ('"+match.getMid()+"','"+match.getM_b_name()+"','"+match.getM_b_branch()+"','"+match.getM_b_ground()+"','"+match.getM_b_tel1()+match.getM_b_tel2()+match.getM_b_tel3()+"','"+match.getM_b_schedule()+"','"+match.getM_b_time()+"','"+match.getM_b_status()+"','"+match.getM_b_level()+"','"+match.getM_b_contents()+"','"+match.getM_b_type()+"','"+match.getM_b_count()+"');";
		
		int y=state.executeUpdate(s);//만약 insert가 success하면 int값 1을 반환.
		//insert 나 delete나 update 등 상황이 변할 때 esecuteUpdate 사용.
		System.out.println("insert 접근2");
		if(y>0)
			System.out.println("insert가 성공적으로 실행되었습니다.");
		else
			System.out.println("입력에 오류가 있습니다.");
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally{
			exit();
		}
	}
	public void update(MatchlistDto match) {
		try {
		con_db();
		state = conn.createStatement();

		String up ="update matchboard_tb set M_B_BRANCH='"+match.getM_b_branch()+"',M_B_GROUND='"+match.getM_b_ground()+"',M_B_NAME='"+match.getM_b_name()+"',M_B_TEL='"+match.getM_b_tel1()+match.getM_b_tel2()+match.getM_b_tel3()+"',M_B_SCHEDULE='"+match.getM_b_schedule()+"',M_B_TIME='"+match.getM_b_time()+"',M_B_STATUS='"+match.getM_b_status()+"',M_B_LEVEL='"+match.getM_b_level()+"',M_B_CONTENTS='"+match.getM_b_contents()+"',M_B_TYPE='"+match.getM_b_type()+"',M_B_COUNT='"+match.getM_b_count()+"'where M_B_NO="+match.getMno()+";";
		int y=state.executeUpdate(up);//만약 insert가 success하면 int값 1을 반환.
		//insert 나 delete나 update 등 상황이 변할 때 esecuteUpdate 사용.
		System.out.println("y의 값: "+y);
		if(y>0)
			System.out.println("update가 성공적으로 실행되었습니다.");
		else
			System.out.println("입력에 오류가 있습니다.");
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally{
			exit();
		}
	}
	public void delete(int index) {
		int mNo = index;
		try {
		con_db();
		state = conn.createStatement();
		System.out.println("삭제 1단계 내용물들 입니다. yNo : "+ mNo);
		String del ="delete from matchboard_tb where M_B_NO="+mNo+";";
		int y=state.executeUpdate(del);//만약 insert가 success하면 int값 1을 반환.
		//insert 나 delete나 update 등 상황이 변할 때 esecuteUpdate 사용.
		System.out.println("y의 값: "+y);
		if(y>0)
			System.out.println("delete가 성공적으로 실행되었습니다.");
		else
			System.out.println("입력에 오류가 있습니다.");
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally{
			exit();
		}
	}
	
	
	public ArrayList<MatchlistDto> select() {  //select 하는 메소드 kim 이라는 기본키 (ID) 를 넣었다.
		ArrayList<MatchlistDto> ml = new ArrayList<MatchlistDto>();
		try { 
			con_db();
			state = conn.createStatement();
			String s = "select * from matchboard_tb;";  //"" 안에 있는 문장이 정확히 mysql 에 입력하는 문자이다. ; 까지도
			ResultSet aa = state.executeQuery(s);
	
			while(aa.next())  // 중요 !! aa.next()>> SET 타입의 경우 순서가 없기때문에 있는지 확인하는 과정 ! (너 있니?)하고 그냥 떠돌아다니는 자료를 찾는것이다.
			{
				MatchlistDto mod = new MatchlistDto();
				mod.setMno(aa.getInt("M_B_NO")); //번호 
				mod.setMid(aa.getString("ID")); //아이디 
				mod.setM_b_name(aa.getString("M_B_NAME")); //신청자명 Y_B_NAME
			//	mod.setYdate(aa.getDate("yDate")); // 글접수 일짜
				mod.setM_b_branch(aa.getString("M_B_BRANCH")); //구장선택 Y_B_BRANCH
				mod.setM_b_ground(aa.getString("M_B_GROUND")); //지점선택 Y_B_GROUND
				mod.setM_b_tel1(aa.getString("M_B_TEL")); //전화번호1
				mod.setM_b_schedule(aa.getString("M_B_SCHEDULE")); //매치일정
				mod.setM_b_time(aa.getString("M_B_TIME")); //시간선택 Y_B_TIME
				mod.setM_b_status(aa.getString("M_B_STATUS")); //마감여부 y_b_status
				mod.setM_b_level(aa.getString("M_B_LEVEL")); //팀 수준 
				mod.setM_b_contents(aa.getString("M_B_CONTENTS"));
				mod.setM_b_count(aa.getString("M_B_COUNT"));
				mod.setM_b_type(aa.getString("M_B_TYPE"));
				
				
				ml.add(mod);
			}
			aa.close();        //항상 잘 닫아야한다 닫아야 잘 실행..		
		} catch (Exception e) {
		}
		finally {
		exit();
		}
		return ml;
	}
	

	public MatchlistDto matchselectone(int mNo, String mid) {	//로그인
		MatchlistDto mod = new MatchlistDto();
		try {
			con_db();
			state = conn.createStatement();

			String s = "select * from matchboard_tb where M_B_NO = "+mNo+" and ID='"+mid+"';";
			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				
				mod.setMno(aa.getInt("M_B_NO"));
				
				mod.setMid(aa.getString("ID"));
				mod.setM_b_name(aa.getString("M_B_NAME"));
			//	mod.setYdate(aa.getDate("yDate"));
				mod.setM_b_branch(aa.getString("M_B_BRANCH"));
				mod.setM_b_ground(aa.getString("M_B_GROUND"));
				mod.setM_b_tel1(aa.getString("M_B_TEL"));
			
				mod.setM_b_schedule(aa.getString("M_B_SCHEDULE"));
				mod.setM_b_time(aa.getString("M_B_TIME"));
				mod.setM_b_status(aa.getString("M_B_STATUS"));
				mod.setM_b_level(aa.getString("M_B_LEVEL"));
				mod.setM_b_contents(aa.getString("M_B_CONTENTS"));
				mod.setM_b_count(aa.getString("M_B_COUNT"));
				mod.setM_b_type(aa.getString("M_B_TYPE"));

			}

		} catch (Exception e) {
			System.out.println(e);
			
		} finally {
			exit();
		}
		return mod;
	}
	
	
	
	
}

