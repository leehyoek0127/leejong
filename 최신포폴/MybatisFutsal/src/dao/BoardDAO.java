package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.BoardBean;
import vo.G_BoardBean;
import vo.G_BoardRepBean;

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {
		// TODO Auto-generated constructor stub
	}

	public static BoardDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//글의 개수 구하기.
	public int selectListCount() {
		System.out.println("selectListCount()");
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from galboard");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);	
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	//글 목록 보기.	
	public ArrayList<G_BoardBean> selectArticleList(int page,int limit){
		System.out.println("selectArticleList(int page,int limit) ");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from galboard order by GB_NUM desc limit ?,9";
		ArrayList<G_BoardBean> articleList = new ArrayList<G_BoardBean>();
		G_BoardBean board = null;
		int startrow=(page-1)*9; //읽기 시작할 row 번호..	
		
		try{
			
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			
			
			System.out.println(pstmt);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new G_BoardBean();
				board.setGB_ID(rs.getString("GB_ID"));
				board.setGB_SUBJECT(rs.getString("GB_SUBJECT"));
				board.setGB_CONTENTS(rs.getString("GB_CONTENTS"));
				board.setGB_NUM(rs.getInt("GB_NUM"));
				board.setGB_DATE(rs.getDate("GB_DATE"));
				board.setGB_READCOUNT(rs.getInt("GB_READCOUNT"));
				board.setGB_FILE(rs.getString("GB_FILE"));

				articleList.add(board);
				
			}
			System.out.println("다오속의 리스트"+articleList);

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	//글 내용 보기.
	public G_BoardBean selectArticle(int board_num){
		System.out.println("selectArticle(int board_num)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		G_BoardBean boardBean = null;

		try{
			pstmt = con.prepareStatement(
					"select * from galboard where GB_NUM = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();
			
			System.out.println("쿼리는잘돌아갔나");
			if(rs.next()){
				System.out.println("잘들어왔나");
				boardBean = new G_BoardBean();
				boardBean.setGB_NUM(rs.getInt("GB_NUM"));
				boardBean.setGB_ID(rs.getString("GB_ID"));
				boardBean.setGB_SUBJECT(rs.getString("GB_SUBJECT"));
				boardBean.setGB_CONTENTS(rs.getString("GB_CONTENTS"));
				boardBean.setGB_FILE(rs.getString("GB_FILE"));
				boardBean.setGB_READCOUNT(rs.getInt("GB_READCOUNT"));
				boardBean.setGB_DATE(rs.getDate("GB_DATE"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}

	//글 등록.
	public int insertArticle(BoardBean article){
		System.out.println("insertArticle(BoardBean article)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(board_num) from board");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"+
					"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+
					"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setString(6, article.getBOARD_FILE());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 답변.
	public int insertReplyArticle(BoardBean article){
		System.out.println("insertReplyArticle(BoardBean article)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql="select max(board_num) from board";
		String sql="";
		int num=0;
		int insertCount=0;
		int re_ref=article.getBOARD_RE_REF();
		int re_lev=article.getBOARD_RE_LEV();
		int re_seq=article.getBOARD_RE_SEQ();

		try{
			pstmt=con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num =rs.getInt(1)+1;
			else num=1;
			sql="update board set BOARD_RE_SEQ=BOARD_RE_SEQ+1 where BOARD_RE_REF=? ";
			sql+="and BOARD_RE_SEQ>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,re_ref);
			pstmt.setInt(2,re_seq);
			int updateCount=pstmt.executeUpdate();

			if(updateCount > 0){
				commit(con);
			}

			re_seq = re_seq + 1;
			re_lev = re_lev+1;
			sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT, BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,";
			sql+="BOARD_READCOUNT,BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setString(6, ""); //답장에는 파일을 업로드하지 않음.
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.setInt(10, 0);
			insertCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 수정.
	public int updateArticle(BoardBean article){
		System.out.println("updateArticle(BoardBean article)");
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_SUBJECT());
			pstmt.setString(2, article.getBOARD_CONTENT());
			pstmt.setInt(3, article.getBOARD_NUM());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//글 삭제.
	public int deleteArticle(int board_num){
		System.out.println("deleteArticle(int board_num)");
		PreparedStatement pstmt = null;
		String board_delete_sql="delete from galboard where GB_NUM=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}

	//조회수 업데이트.
	public int updateReadCount(int board_num){
		System.out.println("updateReadCount(int board_num)");
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update board set BOARD_READCOUNT = "+
				"BOARD_READCOUNT+1 where BOARD_NUM = "+board_num;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

	//글쓴이인지 확인.
	public boolean isArticleBoardWriter(int board_num,String pass){
		System.out.println("isArticleBoardWriter(int board_num,String pass)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql="select * from board where BOARD_NUM=?";
		boolean isWriter = false;

		try{
			pstmt=con.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			rs.next();

			if(pass.equals(rs.getString("BOARD_PASS"))){
				isWriter = true;
			}
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);
		}

		return isWriter;

	}
	
	public int G_insertArticle(G_BoardBean article){
		System.out.println("G_insertArticle(G_BoardBean article)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;
		
		
		try{
			pstmt=con.prepareStatement("select max(GB_num) from galboard");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into galboard (GB_SUBJECT,GB_CONTENTS,GB_NUM,";
			sql+="GB_READCOUNT, GB_FILE, GB_ID, GB_DATE"+
					") values(?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getGB_SUBJECT());
			pstmt.setString(2, article.getGB_CONTENTS());
			pstmt.setInt(3, num);
			pstmt.setInt(4, 1);
			pstmt.setString(5, article.getGB_FILE());
			pstmt.setString(6, article.getGB_ID());

			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
	public int G_RepinsertArticle(G_BoardRepBean article){
		System.out.println("G_RepinsertArticle(G_BoardRepBean article)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;
		
		
		try{
			pstmt=con.prepareStatement("select max(GB_Rep_NUM) from galrep");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into galrep (GB_REP_CONTENTS,GB_NUM,";
			sql+="GB_REP_NUM, GB_ID, GB_REP_DATE"+
					") values(?,?,?,?,now())";
			System.out.println(11);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getGB_REP_CONTENTS());
			pstmt.setInt(2, article.getGB_NUM());
			System.out.println(22);
			pstmt.setInt(3, num);
			pstmt.setString(4, article.getGB_ID());
			
			System.out.println(pstmt);
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	public ArrayList<G_BoardRepBean> selectArticleRepList(int num){
		System.out.println("selectArticleRepList(int num) ");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from galrep where GB_NUM =? order by GB_REP_DATE desc";
		ArrayList<G_BoardRepBean> articleList = new ArrayList<G_BoardRepBean>();
		G_BoardRepBean board = null;
		
		
		try{
			
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, num);
			
			
			
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new G_BoardRepBean();
				board.setGB_ID(rs.getString("GB_ID"));
				board.setGB_NUM(num);
				board.setGB_REP_CONTENTS(rs.getString("GB_REP_CONTENTS"));
				board.setGB_REP_DATE(rs.getDate("GB_REP_DATE"));
				board.setGB_REP_NUM(rs.getInt("GB_REP_NUM"));
				

				articleList.add(board);
				
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

}
