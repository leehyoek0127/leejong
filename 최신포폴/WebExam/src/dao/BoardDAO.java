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
import vo.GalBoardDto;
import vo.GalRepDto;

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
			pstmt=con.prepareStatement("select count(*) from galboard_tb");
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
	public ArrayList<GalBoardDto> selectArticleList(int page,int limit){
		System.out.println("selectArticleList(int page,int limit) ");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from galboard_tb order by G_B_NO desc limit ?,9";
		ArrayList<GalBoardDto> articleList = new ArrayList<GalBoardDto>();
		GalBoardDto board = null;
		int startrow=(page-1)*9; //읽기 시작할 row 번호..	
		
		try{
			
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			
			
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			System.out.println("rs값: "+rs);

			while(rs.next()){
				System.out.println("while들어옴");
				board = new GalBoardDto();
				System.out.println("객체만들었다");
				
				
				
				
				board.setId(rs.getString("ID"));
				System.out.println("1");
				board.setG_b_subject(rs.getString("G_B_SUBJECT"));
				board.setG_b_contents(rs.getString("G_B_CONTENTS"));
				System.out.println("1");
				board.setG_b_no(rs.getInt("G_B_NO"));
				board.setG_b_date(rs.getDate("G_B_DATE"));
				board.setG_b_readcount(rs.getInt("G_B_READCOUNT"));
				System.out.println("2");
				board.setG_b_file(rs.getString("G_B_FILE"));
				
				System.out.println("3");
				articleList.add(board);
				
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	//글 내용 보기.
	public GalBoardDto selectArticle(int board_num){
		System.out.println("selectArticle(int board_num)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GalBoardDto boardBean = null;

		try{
			pstmt = con.prepareStatement(
					"select * from galboard_tb where G_B_NO = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();
			
			System.out.println("쿼리는잘돌아갔나");
			if(rs.next()){
				System.out.println("잘들어왔나");
				boardBean = new GalBoardDto();
				boardBean.setG_b_no(rs.getInt("G_B_NO"));
				boardBean.setId(rs.getString("ID"));
				boardBean.setG_b_subject(rs.getString("G_B_SUBJECT"));
				boardBean.setG_b_contents(rs.getString("G_B_CONTENTS"));
				boardBean.setG_b_file(rs.getString("G_B_FILE"));
				boardBean.setG_b_readcount(rs.getInt("G_B_READCOUNT"));
				boardBean.setG_b_date(rs.getDate("G_B_DATE"));
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
	public int updateArticle(G_BoardBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update galBoard set GB_SUBJECT=?,GB_CONTENTS=? where GB_NUM=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getGB_SUBJECT());
			pstmt.setString(2, article.getGB_CONTENTS());
			pstmt.setInt(3, article.getGB_NUM());
			System.out.println(pstmt);
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//글 삭제.
	public int deleteArticle(int GB_NUM){

		PreparedStatement pstmt = null;
		String gal_delete_sql="delete from galBoard where GB_NUM=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(gal_delete_sql);
			pstmt.setInt(1, GB_NUM);
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
	
	public int G_insertArticle(GalBoardDto article){
		System.out.println("G_insertArticle(G_BoardBean article)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;
		
		
		try{
			pstmt=con.prepareStatement("select max(G_B_NO) from galboard_tb");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into galboard_tb (G_B_SUBJECT,G_B_CONTENTS,G_B_NO,";
			sql+="G_B_READCOUNT, G_B_FILE, ID, G_B_DATE"+
					") values(?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			System.out.println(pstmt);
			pstmt.setString(1, article.getG_b_subject());
			pstmt.setString(2, article.getG_b_contents());
			pstmt.setInt(3, num);
			System.out.println("중간");
			pstmt.setInt(4, 1);
			pstmt.setString(5, article.getG_b_file());
			pstmt.setString(6, article.getId());

			insertCount=pstmt.executeUpdate();
			System.out.println(insertCount);
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
	public int G_RepinsertArticle(GalRepDto article){
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
			pstmt.setString(1, article.getG_rep_contents());
			pstmt.setInt(2, article.getG_b_no());
			System.out.println(22);
			pstmt.setInt(3, num);
			pstmt.setString(4, article.getId());
			
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
	public ArrayList<GalRepDto> selectArticleRepList(int num){
		System.out.println("selectArticleRepList(int num) ");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from galrep_tb where G_B_NO =? order by G_REP_DATE desc";
		ArrayList<GalRepDto> articleList = new ArrayList<GalRepDto>();
		GalRepDto board = null;
		
		
		try{
			
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, num);
			
			
			
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new GalRepDto();
				board.setId(rs.getString("GB_ID"));
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
