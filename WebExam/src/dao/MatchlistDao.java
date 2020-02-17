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
		try {// �ܺ��۾����� ���� �켱 try
			Class.forName(JDBC_DRIVER); // mysql �� �����Ұ� !
		} catch (Exception e) {
		}
	}

	void con_db() { // Connect DB () �۾����� ������ϴ°� �´�.
		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		} catch (Exception e) {

		}
	}

	void exit() { // close �� ���Ѱ� finally �� �־ ������ ������.
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
		System.out.println("insert ����1");
		String s = "insert into matchboard_tb(ID,M_B_NAME,  M_B_BRANCH,  M_B_GROUND,  M_B_TEL,  M_B_SCHEDULE,  M_B_TIME,  M_B_STATUS,  M_B_LEVEL,  M_B_CONTENTS, M_B_TYPE, M_B_COUNT) values ('"+match.getMid()+"','"+match.getM_b_name()+"','"+match.getM_b_branch()+"','"+match.getM_b_ground()+"','"+match.getM_b_tel1()+match.getM_b_tel2()+match.getM_b_tel3()+"','"+match.getM_b_schedule()+"','"+match.getM_b_time()+"','"+match.getM_b_status()+"','"+match.getM_b_level()+"','"+match.getM_b_contents()+"','"+match.getM_b_type()+"','"+match.getM_b_count()+"');";
		
		int y=state.executeUpdate(s);//���� insert�� success�ϸ� int�� 1�� ��ȯ.
		//insert �� delete�� update �� ��Ȳ�� ���� �� esecuteUpdate ���.
		System.out.println("insert ����2");
		if(y>0)
			System.out.println("insert�� ���������� ����Ǿ����ϴ�.");
		else
			System.out.println("�Է¿� ������ �ֽ��ϴ�.");
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
		int y=state.executeUpdate(up);//���� insert�� success�ϸ� int�� 1�� ��ȯ.
		//insert �� delete�� update �� ��Ȳ�� ���� �� esecuteUpdate ���.
		System.out.println("y�� ��: "+y);
		if(y>0)
			System.out.println("update�� ���������� ����Ǿ����ϴ�.");
		else
			System.out.println("�Է¿� ������ �ֽ��ϴ�.");
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
		System.out.println("���� 1�ܰ� ���빰�� �Դϴ�. yNo : "+ mNo);
		String del ="delete from matchboard_tb where M_B_NO="+mNo+";";
		int y=state.executeUpdate(del);//���� insert�� success�ϸ� int�� 1�� ��ȯ.
		//insert �� delete�� update �� ��Ȳ�� ���� �� esecuteUpdate ���.
		System.out.println("y�� ��: "+y);
		if(y>0)
			System.out.println("delete�� ���������� ����Ǿ����ϴ�.");
		else
			System.out.println("�Է¿� ������ �ֽ��ϴ�.");
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally{
			exit();
		}
	}
	
	
	public ArrayList<MatchlistDto> select() {  //select �ϴ� �޼ҵ� kim �̶�� �⺻Ű (ID) �� �־���.
		ArrayList<MatchlistDto> ml = new ArrayList<MatchlistDto>();
		try { 
			con_db();
			state = conn.createStatement();
			String s = "select * from matchboard_tb;";  //"" �ȿ� �ִ� ������ ��Ȯ�� mysql �� �Է��ϴ� �����̴�. ; ������
			ResultSet aa = state.executeQuery(s);
	
			while(aa.next())  // �߿� !! aa.next()>> SET Ÿ���� ��� ������ ���⶧���� �ִ��� Ȯ���ϴ� ���� ! (�� �ִ�?)�ϰ� �׳� �����ƴٴϴ� �ڷḦ ã�°��̴�.
			{
				MatchlistDto mod = new MatchlistDto();
				mod.setMno(aa.getInt("M_B_NO")); //��ȣ 
				mod.setMid(aa.getString("ID")); //���̵� 
				mod.setM_b_name(aa.getString("M_B_NAME")); //��û�ڸ� Y_B_NAME
			//	mod.setYdate(aa.getDate("yDate")); // ������ ��¥
				mod.setM_b_branch(aa.getString("M_B_BRANCH")); //���弱�� Y_B_BRANCH
				mod.setM_b_ground(aa.getString("M_B_GROUND")); //�������� Y_B_GROUND
				mod.setM_b_tel1(aa.getString("M_B_TEL")); //��ȭ��ȣ1
				mod.setM_b_schedule(aa.getString("M_B_SCHEDULE")); //��ġ����
				mod.setM_b_time(aa.getString("M_B_TIME")); //�ð����� Y_B_TIME
				mod.setM_b_status(aa.getString("M_B_STATUS")); //�������� y_b_status
				mod.setM_b_level(aa.getString("M_B_LEVEL")); //�� ���� 
				mod.setM_b_contents(aa.getString("M_B_CONTENTS"));
				mod.setM_b_count(aa.getString("M_B_COUNT"));
				mod.setM_b_type(aa.getString("M_B_TYPE"));
				
				
				ml.add(mod);
			}
			aa.close();        //�׻� �� �ݾƾ��Ѵ� �ݾƾ� �� ����..		
		} catch (Exception e) {
		}
		finally {
		exit();
		}
		return ml;
	}
	

	public MatchlistDto matchselectone(int mNo, String mid) {	//�α���
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

