package Qna;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class QnaDao {
	
	int count=1;
	int logcount=1;
	String okid=null;

	private final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	private final String DB_URL="jdbc:mysql://localhost/footsal?useSSL=false&useUnicode=true&characterEncoding=utf8";
	
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

			
			String h = "insert into qna(qMember,qSecret,qSecretNum,qCount,qContents,qTitle,qId) values('"+qnaNew.getqMember()+"','"+qnaNew.getqSecret()+"','"+qnaNew.getqSecretNum()+"',0,'"+qnaNew.getqContents()+"','"+qnaNew.getqTitle()+"','"+qnaNew.getqId()+"');";						
			int y=state.executeUpdate(h);
			if(y>0) {
				System.out.println("�Է��� �Ϸ�Ǿ����ϴ�.");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
	}
	
	public ArrayList<QnaDto> selectAll() {	//�α���
		ArrayList<QnaDto> list = new ArrayList<QnaDto>();
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from qna;";

			
			ResultSet aa = state.executeQuery(s);
			
			while (aa.next()) {
				
				QnaDto m = new QnaDto();

				m.setqNo(aa.getInt("qNo"));
				m.setqMember(aa.getString("qMember"));
				m.setqSecret(aa.getString("qSecret"));
				m.setqSecretNum(aa.getString("qSecretNum"));
				m.setqDate(aa.getDate("qDate"));
				m.setqCount(aa.getInt("qCount"));
				m.setqContents(aa.getString("qContents"));
				m.setqTitle(aa.getString("qTitle"));
				m.setqEmail(aa.getString("qEmail"));
				
				list.add(m);
				

			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return list;
	}
	
	public QnaDto selectone(int qNo) {	//�α���
		QnaDto m = new QnaDto();
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from qna where qNo = "+qNo+";";
			String s2 = "update qna set qCount = qCount + 1 where qNo ="+qNo+";";
			state.executeUpdate(s2);
			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				

				m.setqNo(aa.getInt("qNo"));
				m.setqMember(aa.getString("qMember"));
				m.setqSecret(aa.getString("qSecret"));
				m.setqSecretNum(aa.getString("qSecretNum"));
				m.setqDate(aa.getDate("qDate"));
				m.setqCount(aa.getInt("qCount"));
				m.setqContents(aa.getString("qContents"));
				m.setqTitle(aa.getString("qTitle"));
				m.setqEmail(aa.getString("qEmail"));
				
				
				

			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return m;
	}
	public void delete(String qNo, String qSecretNum_input) {
		int qNo2 = Integer.parseInt(qNo);
		QnaDto m = new QnaDto();
		try {
			dbOpen();
			state = conn.createStatement();
			String s = "delete from qna where qNo=" + qNo2 + " and qSecretNum='" + qSecretNum_input + "';";

			int y = state.executeUpdate(s);

		} catch (Exception e) {
		} finally {
			close();
		}
	}

	public int update(String qNo, String qTitle_up, String qMember_up, String qContents_up) {
		int updatech = 0;
		int qNo2 = Integer.parseInt(qNo);
		QnaDto m = new QnaDto();
		try {
			dbOpen();
			state = conn.createStatement();
			System.out.println("���� 1�ܰ� ���빰�� �Դϴ�. qMember : " + qMember_up + " qContents : " + qContents_up + "qTitle : "
					+ qTitle_up);
			String up = "update qna set qMember='" + qMember_up + "',qContents='" + qContents_up + "',qTitle='"
					+ qTitle_up + "'where qNo=" + qNo2 + ";";
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
