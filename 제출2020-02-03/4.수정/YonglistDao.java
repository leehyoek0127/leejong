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
		System.out.println("�Է� 1�ܰ� ���빰�� �Դϴ�.id : "+ yong.yId+" date : "+yong.yDate+"Contents : "+yong.yContents);
		String s = "insert into applyyong (yId,yMember,yBranch,yGround,yTel1,yTel2,yTel3,yMatchdate,yTime,yApply,yTeam,yContents) values ('"+yong.getyId()+"','"+yong.getyMember()+"','"+yong.getyBranch()+"','"+yong.getyGround()+"','"+yong.getyTel1()+"','"+yong.getyTel2()+"','"+yong.getyTel3()+"','"+yong.getyMatchdate()+"','"+yong.getyTime()+"','"+yong.getyApply()+"','"+yong.getyTeam()+"','"+yong.getyContents()+"');";
		
		int y=state.executeUpdate(s);//���� insert�� success�ϸ� int�� 1�� ��ȯ.
		//insert �� delete�� update �� ��Ȳ�� ���� �� esecuteUpdate ���.
		
		if(y>0)
			System.out.println("insert�� ���������� ����Ǿ����ϴ�.");
		else
			System.out.println("�Է¿� ������ �ֽ��ϴ�.");
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
		System.out.println("���� 1�ܰ� ���빰�� �Դϴ�. yNo : "+ yong.yNo+" date : "+yong.yDate+"Contents : "+yong.yContents+"yBranch : "+yong.yBranch+"yGround : "+yong.yGround);
		String up ="update applyyong set yBranch='"+yong.yBranch+"',yGround='"+yong.yGround+"',yMember='"+yong.yMember+"',yTel1='"+yong.yTel1+"',yTel2='"+yong.yTel2+"',yTel3='"+yong.yTel3+"',yMatchdate='"+yong.yMatchdate+"',yTime='"+yong.yTime+"',yApply='"+yong.yApply+"',yTeam='"+yong.yTeam+"',yContents='"+yong.yContents+"'where yNo="+yong.yNo+";";
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
		int yNo = index;
		try {
		con_db();
		state = conn.createStatement();
		System.out.println("���� 1�ܰ� ���빰�� �Դϴ�. yNo : "+ yNo);
		String del ="delete from applyyong where yNo="+yNo+";";
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
	
	
	public ArrayList<YonglistDto> select() {  //select �ϴ� �޼ҵ� kim �̶�� �⺻Ű (ID) �� �־���.
		ArrayList<YonglistDto> yl = new ArrayList<YonglistDto>();
		try { 
			con_db();
			state = conn.createStatement();
			String s = "select * from applyyong;";  //"" �ȿ� �ִ� ������ ��Ȯ�� mysql �� �Է��ϴ� �����̴�. ; ������
			ResultSet aa = state.executeQuery(s);
	
			while(aa.next())  // �߿� !! aa.next()>> SET Ÿ���� ��� ������ ���⶧���� �ִ��� Ȯ���ϴ� ���� ! (�� �ִ�?)�ϰ� �׳� �����ƴٴϴ� �ڷḦ ã�°��̴�.
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
			aa.close();        //�׻� �� �ݾƾ��Ѵ� �ݾƾ� �� ����..		
		} catch (Exception e) {
		}
		finally {
		exit();
		}
		return yl;
	}
	
	public ArrayList<YonglistDto> selectone(int index) {  //select �ϴ� �޼ҵ� 
		ArrayList<YonglistDto> ylone = new ArrayList<YonglistDto>();
		int num = index;
		try { 
			con_db();
			state = conn.createStatement();
			String s = "select * from applyyong where yNo='"+num+"';";  //"" �ȿ� �ִ� ������ ��Ȯ�� mysql �� �Է��ϴ� �����̴�. ; ������
			ResultSet aa = state.executeQuery(s);
	
			while(aa.next())  // �߿� !! aa.next()>> SET Ÿ���� ��� ������ ���⶧���� �ִ��� Ȯ���ϴ� ���� ! (�� �ִ�?)�ϰ� �׳� �����ƴٴϴ� �ڷḦ ã�°��̴�.
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
			aa.close();        //�׻� �� �ݾƾ��Ѵ� �ݾƾ� �� ����..		
		} catch (Exception e) {
		}
		finally {
		exit();
		}
		return ylone;
	}
	public YonglistDto yongselectone(int yNo, String yid) {	//�α���
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

