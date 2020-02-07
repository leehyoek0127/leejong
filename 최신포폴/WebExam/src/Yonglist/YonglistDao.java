package Yonglist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Qna.QnaDto;

public class YonglistDao {

	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://localhost/footsal?useSSL=false&useUnicode=true&characterEncoding=utf8";
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
		System.out.println("입력 1단계 내용물들 입니다.id : "+ yong.yId+" date : "+yong.yDate+"Contents : "+yong.yContents);
		String s = "insert into applyyong (yId,yMember,yBranch,yGround,yTel1,yTel2,yTel3,yMatchdate,yTime,yApply,yTeam,yContents) values ('"+yong.getyId()+"','"+yong.getyMember()+"','"+yong.getyBranch()+"','"+yong.getyGround()+"','"+yong.getyTel1()+"','"+yong.getyTel2()+"','"+yong.getyTel3()+"','"+yong.getyMatchdate()+"','"+yong.getyTime()+"','"+yong.getyApply()+"','"+yong.getyTeam()+"','"+yong.getyContents()+"');";
		
		int y=state.executeUpdate(s);//만약 insert가 success하면 int값 1을 반환.
		//insert 나 delete나 update 등 상황이 변할 때 esecuteUpdate 사용.
		
		if(y>0)
			System.out.println("insert가 성공적으로 실행되었습니다.");
		else
			System.out.println("입력에 오류가 있습니다.");
		}
		catch (Exception e) {
		}
		finally{
			exit();
		}
	}
	public void update(YonglistDto yong) {
		try {
		con_db();
		state = conn.createStatement();
		System.out.println("수정 1단계 내용물들 입니다. yNo : "+ yong.yNo+" date : "+yong.yDate+"Contents : "+yong.yContents+"yBranch : "+yong.yBranch+"yGround : "+yong.yGround);
		String up ="update applyyong set yBranch='"+yong.yBranch+"',yGround='"+yong.yGround+"',yMember='"+yong.yMember+"',yTel1='"+yong.yTel1+"',yTel2='"+yong.yTel2+"',yTel3='"+yong.yTel3+"',yMatchdate='"+yong.yMatchdate+"',yTime='"+yong.yTime+"',yApply='"+yong.yApply+"',yTeam='"+yong.yTeam+"',yContents='"+yong.yContents+"'where yNo="+yong.yNo+";";
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
		int yNo = index;
		try {
		con_db();
		state = conn.createStatement();
		System.out.println("삭제 1단계 내용물들 입니다. yNo : "+ yNo);
		String del ="delete from applyyong where yNo="+yNo+";";
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
	
	
	public ArrayList<YonglistDto> select() {  //select 하는 메소드 kim 이라는 기본키 (ID) 를 넣었다.
		ArrayList<YonglistDto> yl = new ArrayList<YonglistDto>();
		try { 
			con_db();
			state = conn.createStatement();
			String s = "select * from applyyong;";  //"" 안에 있는 문장이 정확히 mysql 에 입력하는 문자이다. ; 까지도
			ResultSet aa = state.executeQuery(s);
	
			while(aa.next())  // 중요 !! aa.next()>> SET 타입의 경우 순서가 없기때문에 있는지 확인하는 과정 ! (너 있니?)하고 그냥 떠돌아다니는 자료를 찾는것이다.
			{
				YonglistDto mod = new YonglistDto();
				mod.setyNo(aa.getInt("yNo"));
				mod.setyId(aa.getString("yId"));
				mod.setyMember(aa.getString("yMember"));
				mod.setyDate(aa.getDate("yDate"));
				mod.setyBranch(aa.getString("yBranch"));
				mod.setyGround(aa.getString("yGround"));
				mod.setyTel1(aa.getString("yTel1"));
				mod.setyTel2(aa.getString("yTel2"));
				mod.setyTel3(aa.getString("yTel3"));
				mod.setyMatchdate(aa.getString("yMatchdate"));
				mod.setyTime(aa.getString("yTime"));
				mod.setyApply(aa.getString("yApply"));
				mod.setyTeam(aa.getString("yTeam"));
				mod.setyContents(aa.getString("yContents"));
				
				
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
	
	public ArrayList<YonglistDto> selectone(int index) {  //select 하는 메소드 
		ArrayList<YonglistDto> ylone = new ArrayList<YonglistDto>();
		int num = index;
		try { 
			con_db();
			state = conn.createStatement();
			String s = "select * from applyyong where yNo='"+num+"';";  //"" 안에 있는 문장이 정확히 mysql 에 입력하는 문자이다. ; 까지도
			ResultSet aa = state.executeQuery(s);
	
			while(aa.next())  // 중요 !! aa.next()>> SET 타입의 경우 순서가 없기때문에 있는지 확인하는 과정 ! (너 있니?)하고 그냥 떠돌아다니는 자료를 찾는것이다.
			{
				YonglistDto mod = new YonglistDto();
				mod.setyNo(aa.getInt("yNo"));
				mod.setyId(aa.getString("yId"));
				mod.setyMember(aa.getString("yMember"));
				mod.setyDate(aa.getDate("yDate"));
				mod.setyBranch(aa.getString("yBranch"));
				mod.setyGround(aa.getString("yGround"));
				mod.setyTel1(aa.getString("yTel1"));
				mod.setyTel2(aa.getString("yTel2"));
				mod.setyTel3(aa.getString("yTel3"));
				mod.setyMatchdate(aa.getString("yMatchdate"));
				mod.setyTime(aa.getString("yTime"));
				mod.setyApply(aa.getString("yApply"));
				mod.setyTeam(aa.getString("yTeam"));
				mod.setyContents(aa.getString("yContents"));
				
				
				ylone.add(mod);
			}
			aa.close();        //항상 잘 닫아야한다 닫아야 잘 실행..		
		} catch (Exception e) {
		}
		finally {
		exit();
		}
		return ylone;
	}
	public YonglistDto yongselectone(int yNo, String yid) {	//로그인
		YonglistDto mod = new YonglistDto();
		try {
			con_db();
			state = conn.createStatement();

			String s = "select * from applyyong where yNo = "+yNo+" and yId='"+yid+"';";
			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				
				mod.setyNo(aa.getInt("yNo"));
				mod.setyId(aa.getString("yId"));
				mod.setyMember(aa.getString("yMember"));
				mod.setyDate(aa.getDate("yDate"));
				mod.setyBranch(aa.getString("yBranch"));
				mod.setyGround(aa.getString("yGround"));
				mod.setyTel1(aa.getString("yTel1"));
				mod.setyTel2(aa.getString("yTel2"));
				mod.setyTel3(aa.getString("yTel3"));
				mod.setyMatchdate(aa.getString("yMatchdate"));
				mod.setyTime(aa.getString("yTime"));
				mod.setyApply(aa.getString("yApply"));
				mod.setyTeam(aa.getString("yTeam"));
				mod.setyContents(aa.getString("yContents"));


			}

		} catch (Exception e) {
		} finally {
			exit();
		}
		return mod;
	}
	
	
	
	
}

