package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;
import vo.YonglistDto;



public class YonglistDao {

	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://localhost/futsal?useSSL=false&useUnicode=true&characterEncoding=utf8";
	private final String USER_NAME = "root";
	private final String PASSWORD = "0000";
	Connection conn = null;
	Statement state = null;

	public YonglistDao() {
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

	public void insert(YonglistDto yong) {
		try {
		con_db();
		state = conn.createStatement();
	//	System.out.println("아이디는 : >>"+yong.getY_b_name());
	//	System.out.println("입력 1단계 내용물들 입니다.ID : "+ yong.getY_b_name()+" date : "+yong.getYdate()+"Contents : "+yong.getY_b_contents());
		String s = "insert into yongboard_tb(ID,Y_B_NAME,  Y_B_BRANCH,  Y_B_GROUND,  Y_B_TEL,  Y_B_SCHEDULE,  Y_B_TIME,  Y_B_STATUS,  Y_B_LEVEL,  Y_B_CONTENTS) values ('"+yong.getYid()+"','"+yong.getY_b_name()+"','"+yong.getY_b_branch()+"','"+yong.getY_b_ground()+"','"+yong.getY_b_tel1()+yong.getY_b_tel2()+yong.getY_b_tel3()+"','"+yong.getY_b_schedule()+"','"+yong.getY_b_time()+"','"+yong.getY_b_status()+"','"+yong.getY_b_level()+"','"+yong.getY_b_contents()+"');";
	//	System.out.println(s);
		int y=state.executeUpdate(s);//만약 insert가 success하면 int값 1을 반환.
		//insert 나 delete나 update 등 상황이 변할 때 esecuteUpdate 사용.
		
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
	public void update(YonglistDto yong) {
		try {
		con_db();
		state = conn.createStatement();
	//	System.out.println("수정 1단계 내용물들 입니다. yNo : "+ yong.getYno()+" date : "+yong.getYdate()+"Contents : "+yong.getY_b_contents()+"yBranch : "+yong.getY_b_branch()+"yGround : "+yong.getY_b_ground());
		String up ="update yongboard_tb set Y_B_BRANCH='"+yong.getY_b_branch()+"',Y_B_GROUND='"+yong.getY_b_ground()+"',Y_B_NAME='"+yong.getY_b_name()+"',Y_B_TEL='"+yong.getY_b_tel1()+yong.getY_b_tel2()+yong.getY_b_tel3()+"',Y_B_SCHEDULE='"+yong.getY_b_schedule()+"',Y_B_TIME='"+yong.getY_b_time()+"',Y_B_STATUS='"+yong.getY_b_status()+"',Y_B_LEVEL='"+yong.getY_b_level()+"',Y_B_CONTENTS='"+yong.getY_b_contents()+"'where Y_B_NO="+yong.getYno()+";";
		
		int y=state.executeUpdate(up);//만약 insert가 success하면 int값 1을 반환.
		//insert 나 delete나 update 등 상황이 변할 때 esecuteUpdate 사용.
		
		if(y>0)
			System.out.println("update가 성공적으로 실행되었습니다.");
		else
			System.out.println("입력에 오류가 있습니다.");
		}
		catch (Exception e) {
		
		}
		finally{
			exit();
		}
	}
	public void delete(int index) {
		int yNo = index;
		try {
		con_db();
		state = conn.createStatement();
	
		String del ="delete from yongboard_tb where Y_B_NO="+yNo+";";
		int y=state.executeUpdate(del);//만약 insert가 success하면 int값 1을 반환.
		//insert 나 delete나 update 등 상황이 변할 때 esecuteUpdate 사용.
//		System.out.println("y의 값: "+y);
		if(y>0)
			System.out.println("delete가 성공적으로 실행되었습니다.");
		else
			System.out.println("입력에 오류가 있습니다.");
		}
		catch (Exception e) {

		}
		finally{
			exit();
		}
	}
	
	
	public ArrayList<YonglistDto> select() {  //select 하는 메소드 kim 이라는 기본키 (ID) 를 넣었다.
		ArrayList<YonglistDto> yl = new ArrayList<YonglistDto>();
		try { 
			con_db();
			state = conn.createStatement();
			String s = "select * from yongboard_tb;";  //"" 안에 있는 문장이 정확히 mysql 에 입력하는 문자이다. ; 까지도
			ResultSet aa = state.executeQuery(s);
	
			while(aa.next())  // 중요 !! aa.next()>> SET 타입의 경우 순서가 없기때문에 있는지 확인하는 과정 ! (너 있니?)하고 그냥 떠돌아다니는 자료를 찾는것이다.
			{
				YonglistDto mod = new YonglistDto();
				mod.setYno(aa.getInt("Y_B_NO")); //번호 
				mod.setYid(aa.getString("ID")); //아이디 
				mod.setY_b_name(aa.getString("Y_B_NAME")); //신청자명 Y_B_NAME
			//	mod.setYdate(aa.getDate("yDate")); // 글접수 일짜
				mod.setY_b_branch(aa.getString("Y_B_BRANCH")); //구장선택 Y_B_BRANCH
				mod.setY_b_ground(aa.getString("Y_B_GROUND")); //지점선택 Y_B_GROUND
				mod.setY_b_tel1(aa.getString("Y_B_TEL")); //전화번호1
				mod.setY_b_schedule(aa.getString("Y_B_SCHEDULE")); //매치일정
				mod.setY_b_time(aa.getString("Y_B_TIME")); //시간선택 Y_B_TIME
				mod.setY_b_status(aa.getString("Y_B_STATUS")); //마감여부 y_b_status
				mod.setY_b_level(aa.getString("Y_B_LEVEL")); //팀 수준 
				mod.setY_b_contents(aa.getString("Y_B_CONTENTS"));
				
				
				yl.add(mod);
			}
			aa.close();        //항상 잘 닫아야한다 닫아야 잘 실행..		
		} catch (Exception e) {

		}
		finally {
		exit();
		}
		return yl;
	}
	
//	public ArrayList<YonglistDto> selectone(int index) {  //select 하는 메소드 
//		ArrayList<YonglistDto> ylone = new ArrayList<YonglistDto>();
//		int num = index;
//		try { 
//			con_db();
//			state = conn.createStatement();
//			String s = "select * from applyyong where yNo='"+num+"';";  //"" 안에 있는 문장이 정확히 mysql 에 입력하는 문자이다. ; 까지도
//			ResultSet aa = state.executeQuery(s);
//	
//			while(aa.next())  // 중요 !! aa.next()>> SET 타입의 경우 순서가 없기때문에 있는지 확인하는 과정 ! (너 있니?)하고 그냥 떠돌아다니는 자료를 찾는것이다.
//			{
//				YonglistDto mod = new YonglistDto();
//				mod.setYno(aa.getInt("yNo"));
//				mod.setYid(aa.getString("yId"));
//				mod.setyMember(aa.getString("yMember"));
//				mod.setYdate(aa.getDate("yDate"));
//				mod.setY_b_branch(aa.getString("yBranch"));
//				mod.setY_b_ground(aa.getString("yGround"));
//				mod.setY_b_tel1(aa.getString("yTel1"));
//				mod.setY_b_tel2(aa.getString("yTel2"));
//				mod.setY_b_tel3(aa.getString("yTel3"));
//				mod.setyMatchdate(aa.getString("yMatchdate"));
//				mod.setY_b_time(aa.getString("yTime"));
//				mod.setyApply(aa.getString("yApply"));
//				mod.setyTeam(aa.getString("yTeam"));
//				mod.setY_b_contents(aa.getString("yContents"));
//				
//				
//				ylone.add(mod);
//			}
//			aa.close();        //항상 잘 닫아야한다 닫아야 잘 실행..		
//		} catch (Exception e) {
//		}
//		finally {
//		exit();
//		}
//		return ylone;
//	}
	public YonglistDto yongselectone(int yNo, String yid) {	//로그인
		YonglistDto mod = new YonglistDto();
		try {
			con_db();
			state = conn.createStatement();

			String s = "select * from yongboard_tb where Y_B_NO = "+yNo+" and ID='"+yid+"';";
			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				
				mod.setYno(aa.getInt("Y_B_NO"));
				
				mod.setYid(aa.getString("ID"));
				mod.setY_b_name(aa.getString("Y_B_NAME"));
			//	mod.setYdate(aa.getDate("yDate"));
				mod.setY_b_branch(aa.getString("Y_B_BRANCH"));
				mod.setY_b_ground(aa.getString("Y_B_GROUND"));
				mod.setY_b_tel1(aa.getString("Y_B_TEL"));
			//	mod.setY_b_tel2(aa.getString("yTel2"));
			//	mod.setY_b_tel3(aa.getString("yTel3"));
				mod.setY_b_schedule(aa.getString("Y_B_SCHEDULE"));
				mod.setY_b_time(aa.getString("Y_B_TIME"));
				mod.setY_b_status(aa.getString("Y_B_STATUS"));
				mod.setY_b_level(aa.getString("Y_B_LEVEL"));
				mod.setY_b_contents(aa.getString("Y_B_CONTENTS"));


			}

		} catch (Exception e) {
			System.out.println(e);
			
		} finally {
			exit();
		}
		return mod;
	}
	
	
	
	
}

