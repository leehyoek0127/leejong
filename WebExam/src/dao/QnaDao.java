package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

import vo.QnaDto;

public class QnaDao {
	
	int count=1;
	int logcount=1;
	String okid=null;

	private final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	private final String DB_URL="jdbc:mysql://localhost/futsal?useSSL=false&useUnicode=true&characterEncoding=utf8";
	
	private final String USER_NAME="root";
	private final String PASSWORD="0000";
	
	Connection conn=null;
	Statement state=null;
	
	Scanner sc=new Scanner(System.in);
	
	
	
	public QnaDao(){
		try {
			Class.forName(JDBC_DRIVER);	
		}catch(Exception e){
			
		}
	}
	
	void dbOpen() {
		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		
		}catch(Exception e) {
			
		}
	}
	
	void close() {
		if(state!=null) {
			try {
				conn.close();
			}catch(Exception e) {
				
			}
		}
		
	}

	public void insert(QnaDto qnaNew){	//�۾���
		
		try {
			dbOpen();
			state=conn.createStatement();

			System.out.println(qnaNew.getQ_b_name()+""+qnaNew.getQ_b_secret()+""+qnaNew.getQ_b_secretcode()+""+qnaNew.getQ_b_contents()+""+qnaNew.getQ_b_title()+""+qnaNew.getId());
			String h = "insert into qnaboard_tb(Q_B_NAME,Q_B_SECRET,Q_B_SECRETCODE,Q_B_READCOUNT,Q_B_CONTENTS,Q_B_TITLE) values('"+qnaNew.getQ_b_name()+"','"+qnaNew.getQ_b_secret()+"','"+qnaNew.getQ_b_secretcode()+"',0,'"+qnaNew.getQ_b_contents()+"','"+qnaNew.getQ_b_title()+"');";						
			System.out.println("�Ѿ���°�?"+h);
			int y=state.executeUpdate(h);
			
			if(y>0) {
				System.out.println("�Է��� �Ϸ�Ǿ����ϴ�.");
			}
			else
				System.out.println("�Է� XX");
		} catch (Exception e) {
			System.out.println("����:"+e);
		} finally {
			close();
		}
	}
	
	public ArrayList<QnaDto> selectAll() {	//�α���
		ArrayList<QnaDto> list = new ArrayList<QnaDto>();
		try {
			dbOpen();
			state = conn.createStatement();
			System.out.println("����");
			String s = "select * from qnaboard_tb;";

			
			ResultSet aa = state.executeQuery(s);
			System.out.println("����2");
			while (aa.next()) {
				
				QnaDto m = new QnaDto();

				m.setQ_b_no(aa.getInt("Q_b_no"));
				m.setQ_b_name(aa.getString("Q_b_name"));
				m.setQ_b_secret(aa.getString("Q_b_secret"));
				m.setQ_b_secretcode(aa.getString("Q_b_secretcode"));
				m.setQ_b_date(aa.getDate("Q_b_date"));
				m.setQ_b_readcount(aa.getInt("Q_b_readcount"));
				m.setQ_b_contents(aa.getString("Q_b_contents"));
				m.setQ_b_title(aa.getString("Q_b_title"));
			
				list.add(m);
				

			}
			;

		} catch (Exception e) {
		} finally {
			close();
		}
		return list;
	}
	
	public QnaDto selectone(int Q_b_no) {	//�α���
		QnaDto m = new QnaDto();
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from qnaboard_tb where Q_b_no = "+Q_b_no+";";
			String s2 = "update qnaboard_tb set Q_b_readcount = Q_b_readcount + 1 where Q_b_no ="+Q_b_no+";";
			state.executeUpdate(s2);
			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				

				m.setQ_b_no(aa.getInt("Q_b_no"));
				m.setQ_b_name(aa.getString("Q_b_name"));
				m.setQ_b_secret(aa.getString("Q_b_secret"));
				m.setQ_b_secretcode(aa.getString("Q_b_secretcode"));
				m.setQ_b_date(aa.getDate("Q_b_date"));
				m.setQ_b_readcount(aa.getInt("Q_b_readcount"));
				m.setQ_b_contents(aa.getString("Q_b_contents"));
				m.setQ_b_title(aa.getString("Q_b_title"));
				
				
				

			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return m;
	}
	public QnaDto selectsearchtitle(String  Q_b_title) {	//�α���
		QnaDto m = new QnaDto();
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from qnaboard_tb where Q_b_title = "+Q_b_title+";";
			String s2 = "update qnaboard_tb set Q_b_readcount = Q_b_readcount + 1 where Q_b_title ="+Q_b_title+";";
			state.executeUpdate(s2);
			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				

				m.setQ_b_no(aa.getInt("Q_b_no"));
				m.setQ_b_name(aa.getString("Q_b_name"));
				m.setQ_b_secret(aa.getString("Q_b_secret"));
				m.setQ_b_secretcode(aa.getString("Q_b_secretcode"));
				m.setQ_b_date(aa.getDate("Q_b_date"));
				m.setQ_b_readcount(aa.getInt("Q_b_readcount"));
				m.setQ_b_contents(aa.getString("Q_b_contents"));
				m.setQ_b_title(aa.getString("Q_b_title"));
				
				
				

			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return m;
	}
	
	public QnaDto selectsearchcontents(String  Q_b_contents) {	//�α���
		QnaDto m = new QnaDto();
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from qna where Q_b_contents = "+Q_b_contents+";";
			String s2 = "update qnaboard_tb set Q_b_readcount = Q_b_readcount + 1 where Q_b_contents ="+Q_b_contents+";";
			state.executeUpdate(s2);
			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				

				m.setQ_b_no(aa.getInt("Q_b_no"));
				m.setQ_b_name(aa.getString("Q_b_name"));
				m.setQ_b_secret(aa.getString("Q_b_secret"));
				m.setQ_b_secretcode(aa.getString("Q_b_secretcode"));
				m.setQ_b_date(aa.getDate("Q_b_date"));
				m.setQ_b_readcount(aa.getInt("Q_b_readcount"));
				m.setQ_b_contents(aa.getString("Q_b_contents"));
				m.setQ_b_title(aa.getString("Q_b_title"));
				
				
				

			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return m;
	}
	
	
	public void delete(String Q_b_no, String qSecretNum_input) {
		int qNo2 = Integer.parseInt(Q_b_no);
		QnaDto m = new QnaDto();
		try {
			dbOpen();
			state = conn.createStatement();
			String s = "delete from qnaboard_tb where Q_b_no=" + qNo2 + " and Q_b_secretcode='" + qSecretNum_input + "';";

			int y = state.executeUpdate(s);

		} catch (Exception e) {
		} finally {
			close();
		}
	}

	public int update(String qNo, String qTitle_up,String qContents_up) {
		int updatech = 0;
		int qNo2 = Integer.parseInt(qNo);
		QnaDto m = new QnaDto();
		try {
			dbOpen();	
			state = conn.createStatement();
			System.out.println("���� 1�ܰ� ���빰�� �Դϴ�." + " Q_b_contents : " + qContents_up + "Q_b_title : "
					+ qTitle_up);
			String up = "update qnaboard_tb set Q_b_Contents='" + qContents_up + "',Q_b_title='" + qTitle_up + "'where Q_b_no=" + qNo2 + ";";
			int y = state.executeUpdate(up);// ���� insert�� success�ϸ� int�� 1�� ��ȯ.
			// insert �� delete�� update �� ��Ȳ�� ���� �� esecuteUpdate ���.
			System.out.println("y�� ��: " + y);
			if (y > 0) {
				System.out.println("update�� ���������� ����Ǿ����ϴ�.");
				updatech = 1;
			} else
				System.out.println("�Է¿� ������ �ֽ��ϴ�.");
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return updatech;
	}

}
