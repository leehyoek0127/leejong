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

	public void insert(YonglistDto yong) {
		try {
		con_db();
		state = conn.createStatement();
	//	System.out.println("���̵�� : >>"+yong.getY_b_name());
	//	System.out.println("�Է� 1�ܰ� ���빰�� �Դϴ�.ID : "+ yong.getY_b_name()+" date : "+yong.getYdate()+"Contents : "+yong.getY_b_contents());
		String s = "insert into yongboard_tb(ID,Y_B_NAME,  Y_B_BRANCH,  Y_B_GROUND,  Y_B_TEL,  Y_B_SCHEDULE,  Y_B_TIME,  Y_B_STATUS,  Y_B_LEVEL,  Y_B_CONTENTS) values ('"+yong.getYid()+"','"+yong.getY_b_name()+"','"+yong.getY_b_branch()+"','"+yong.getY_b_ground()+"','"+yong.getY_b_tel1()+yong.getY_b_tel2()+yong.getY_b_tel3()+"','"+yong.getY_b_schedule()+"','"+yong.getY_b_time()+"','"+yong.getY_b_status()+"','"+yong.getY_b_level()+"','"+yong.getY_b_contents()+"');";
	//	System.out.println(s);
		int y=state.executeUpdate(s);//���� insert�� success�ϸ� int�� 1�� ��ȯ.
		//insert �� delete�� update �� ��Ȳ�� ���� �� esecuteUpdate ���.
		
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
	public void update(YonglistDto yong) {
		try {
		con_db();
		state = conn.createStatement();
	//	System.out.println("���� 1�ܰ� ���빰�� �Դϴ�. yNo : "+ yong.getYno()+" date : "+yong.getYdate()+"Contents : "+yong.getY_b_contents()+"yBranch : "+yong.getY_b_branch()+"yGround : "+yong.getY_b_ground());
		String up ="update yongboard_tb set Y_B_BRANCH='"+yong.getY_b_branch()+"',Y_B_GROUND='"+yong.getY_b_ground()+"',Y_B_NAME='"+yong.getY_b_name()+"',Y_B_TEL='"+yong.getY_b_tel1()+yong.getY_b_tel2()+yong.getY_b_tel3()+"',Y_B_SCHEDULE='"+yong.getY_b_schedule()+"',Y_B_TIME='"+yong.getY_b_time()+"',Y_B_STATUS='"+yong.getY_b_status()+"',Y_B_LEVEL='"+yong.getY_b_level()+"',Y_B_CONTENTS='"+yong.getY_b_contents()+"'where Y_B_NO="+yong.getYno()+";";
		
		int y=state.executeUpdate(up);//���� insert�� success�ϸ� int�� 1�� ��ȯ.
		//insert �� delete�� update �� ��Ȳ�� ���� �� esecuteUpdate ���.
		
		if(y>0)
			System.out.println("update�� ���������� ����Ǿ����ϴ�.");
		else
			System.out.println("�Է¿� ������ �ֽ��ϴ�.");
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
		int y=state.executeUpdate(del);//���� insert�� success�ϸ� int�� 1�� ��ȯ.
		//insert �� delete�� update �� ��Ȳ�� ���� �� esecuteUpdate ���.
//		System.out.println("y�� ��: "+y);
		if(y>0)
			System.out.println("delete�� ���������� ����Ǿ����ϴ�.");
		else
			System.out.println("�Է¿� ������ �ֽ��ϴ�.");
		}
		catch (Exception e) {

		}
		finally{
			exit();
		}
	}
	
	
	public ArrayList<YonglistDto> select() {  //select �ϴ� �޼ҵ� kim �̶�� �⺻Ű (ID) �� �־���.
		ArrayList<YonglistDto> yl = new ArrayList<YonglistDto>();
		try { 
			con_db();
			state = conn.createStatement();
			String s = "select * from yongboard_tb;";  //"" �ȿ� �ִ� ������ ��Ȯ�� mysql �� �Է��ϴ� �����̴�. ; ������
			ResultSet aa = state.executeQuery(s);
	
			while(aa.next())  // �߿� !! aa.next()>> SET Ÿ���� ��� ������ ���⶧���� �ִ��� Ȯ���ϴ� ���� ! (�� �ִ�?)�ϰ� �׳� �����ƴٴϴ� �ڷḦ ã�°��̴�.
			{
				YonglistDto mod = new YonglistDto();
				mod.setYno(aa.getInt("Y_B_NO")); //��ȣ 
				mod.setYid(aa.getString("ID")); //���̵� 
				mod.setY_b_name(aa.getString("Y_B_NAME")); //��û�ڸ� Y_B_NAME
			//	mod.setYdate(aa.getDate("yDate")); // ������ ��¥
				mod.setY_b_branch(aa.getString("Y_B_BRANCH")); //���弱�� Y_B_BRANCH
				mod.setY_b_ground(aa.getString("Y_B_GROUND")); //�������� Y_B_GROUND
				mod.setY_b_tel1(aa.getString("Y_B_TEL")); //��ȭ��ȣ1
				mod.setY_b_schedule(aa.getString("Y_B_SCHEDULE")); //��ġ����
				mod.setY_b_time(aa.getString("Y_B_TIME")); //�ð����� Y_B_TIME
				mod.setY_b_status(aa.getString("Y_B_STATUS")); //�������� y_b_status
				mod.setY_b_level(aa.getString("Y_B_LEVEL")); //�� ���� 
				mod.setY_b_contents(aa.getString("Y_B_CONTENTS"));
				
				
				yl.add(mod);
			}
			aa.close();        //�׻� �� �ݾƾ��Ѵ� �ݾƾ� �� ����..		
		} catch (Exception e) {

		}
		finally {
		exit();
		}
		return yl;
	}
	
//	public ArrayList<YonglistDto> selectone(int index) {  //select �ϴ� �޼ҵ� 
//		ArrayList<YonglistDto> ylone = new ArrayList<YonglistDto>();
//		int num = index;
//		try { 
//			con_db();
//			state = conn.createStatement();
//			String s = "select * from applyyong where yNo='"+num+"';";  //"" �ȿ� �ִ� ������ ��Ȯ�� mysql �� �Է��ϴ� �����̴�. ; ������
//			ResultSet aa = state.executeQuery(s);
//	
//			while(aa.next())  // �߿� !! aa.next()>> SET Ÿ���� ��� ������ ���⶧���� �ִ��� Ȯ���ϴ� ���� ! (�� �ִ�?)�ϰ� �׳� �����ƴٴϴ� �ڷḦ ã�°��̴�.
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
//			aa.close();        //�׻� �� �ݾƾ��Ѵ� �ݾƾ� �� ����..		
//		} catch (Exception e) {
//		}
//		finally {
//		exit();
//		}
//		return ylone;
//	}
	public YonglistDto yongselectone(int yNo, String yid) {	//�α���
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

