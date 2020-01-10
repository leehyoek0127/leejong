package qnaPack;

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

	public void insert(QnaDto qnaNew){	//글쓰기
		
		try {
			dbOpen();
			state=conn.createStatement();

			
			String h = "insert into qna(qMember,qSecret,qSecretNum,qContents,qTitle,qId) values('"+qnaNew.getqMember()+"','"+qnaNew.getqSecret()+"','"+qnaNew.getqSecretNum()+"','"+qnaNew.getqContents()+"','"+qnaNew.getqTitle()+"','"+qnaNew.getqId()+"');";// **자료입력
						
			int y=state.executeUpdate(h);
			if(y>0) {
				System.out.println("dfasdf");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
	}
	
	public ArrayList<QnaDto> selectAll() {	//로그인
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
				m.setqDate(aa.getTimestamp("qDate"));
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
	
	public QnaDto selectone(int qNo) {	//로그인
		QnaDto m = new QnaDto();
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from qna where qNo = '"+qNo+"';";

			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				

				m.setqNo(aa.getInt("qNo"));
				m.setqMember(aa.getString("qMember"));
				m.setqSecret(aa.getString("qSecret"));
				m.setqSecretNum(aa.getString("qSecretNum"));
				m.setqDate(aa.getTimestamp("qDate"));
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

}
