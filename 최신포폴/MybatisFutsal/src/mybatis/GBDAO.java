package mybatis;

import static model.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import model.GBbean;
import model.G_BoardRepBean;

public class GBDAO {

	DataSource ds;
	Connection con;
	private static GBDAO GBdao;

	private GBDAO() {
		// TODO Auto-generated constructor stub
	}

	public static GBDAO getInstance(){
		if(GBdao == null){
			GBdao = new GBDAO();
		}
		return GBdao;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//글의 개수 구하기.
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from galBoard");
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
	public ArrayList<GBbean> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String gal_list_sql="select * from galBoard order by GB_RE_REF desc,GB_RE_SEQ asc limit ?,9";
		ArrayList<GBbean> articleList = new ArrayList<GBbean>();
		GBbean gal = null;
		int startrow=(page-1)*9; //읽기 시작할 row 번호..	

		try{
			pstmt = con.prepareStatement(gal_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				gal = new GBbean();
				gal.setGB_NUM(rs.getInt("GB_NUM"));
				gal.setGB_ID(rs.getString("GB_ID"));
				gal.setGB_SUBJECT(rs.getString("GB_SUBJECT"));
				gal.setGB_CONTENTS(rs.getString("GB_CONTENTS"));
				gal.setGB_FILE(rs.getString("GB_FILE"));
				gal.setGB_RE_REF(rs.getInt("GB_RE_REF"));
				gal.setGB_RE_LEV(rs.getInt("GB_RE_LEV"));
				gal.setGB_RE_SEQ(rs.getInt("GB_RE_SEQ"));
				gal.setGB_READCOUNT(rs.getInt("GB_READCOUNT"));
				gal.setGB_DATE(rs.getDate("GB_DATE"));
				articleList.add(gal);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	//글 내용 보기.
	public GBbean selectArticle(int GB_NUM){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GBbean GBbean = null;

		try{
			pstmt = con.prepareStatement(
					"select * from galBoard where GB_NUM = ?");
			pstmt.setInt(1, GB_NUM);
			rs= pstmt.executeQuery();

			if(rs.next()){
				GBbean = new GBbean();
				GBbean.setGB_NUM(rs.getInt("GB_NUM"));
				GBbean.setGB_ID(rs.getString("GB_ID"));
				GBbean.setGB_SUBJECT(rs.getString("GB_SUBJECT"));
				GBbean.setGB_CONTENTS(rs.getString("GB_CONTENTS"));
				GBbean.setGB_FILE(rs.getString("GB_FILE"));
				GBbean.setGB_RE_REF(rs.getInt("GB_RE_REF"));
				GBbean.setGB_RE_LEV(rs.getInt("GB_RE_LEV"));
				GBbean.setGB_RE_SEQ(rs.getInt("GB_RE_SEQ"));
				GBbean.setGB_READCOUNT(rs.getInt("GB_READCOUNT"));
				GBbean.setGB_DATE(rs.getDate("GB_DATE"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return GBbean;

	}

	//글 등록.
	public int insertArticle(GBbean article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(GB_NUM) from galBoard");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into galBoard (GB_NUM,GB_ID,GB_SUBJECT,";
			sql+="GB_CONTENTS, GB_FILE, GB_RE_REF,"+
					"GB_RE_LEV,GB_RE_SEQ,GB_READCOUNT,"+
					"GB_DATE) values(?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getGB_ID());
			pstmt.setString(3, article.getGB_SUBJECT());
			pstmt.setString(4, article.getGB_CONTENTS());
			pstmt.setString(5, article.getGB_FILE());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 답변.
	public int insertReplyArticle(GBbean article){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String gal_max_sql="select max(GB_NUM) from galBoard";
		String sql="";
		int num=0;
		int insertCount=0;
		int re_ref=article.getGB_RE_REF();
		int re_lev=article.getGB_RE_LEV();
		int re_seq=article.getGB_RE_SEQ();

		try{
			pstmt=con.prepareStatement(gal_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num =rs.getInt(1)+1;
			else num=1;
			sql="update galBoard set GB_RE_SEQ=GB_RE_SEQ+1 where GB_RE_REF=? ";
			sql+="and GB_RE_SEQ>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,re_ref);
			pstmt.setInt(2,re_seq);
			int updateCount=pstmt.executeUpdate();
			
			if(updateCount > 0){
				commit(con);
			}

			re_seq = re_seq + 1;
			re_lev = re_lev+1;
			sql="insert into galBoard (GB_NUM,GB_ID,GB_SUBJECT,";
			sql+="GB_CONTENTS, GB_FILE,GB_RE_REF,GB_RE_LEV,GB_RE_SEQ,";
			sql+="GB_READCOUNT,GB_DATE) values(?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getGB_ID());
			pstmt.setString(3, article.getGB_SUBJECT());
			pstmt.setString(4, article.getGB_CONTENTS());
			pstmt.setString(5, ""); //답장에는 파일을 업로드하지 않음.
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			pstmt.setInt(9, 0);
			
			insertCount = pstmt.executeUpdate();
			System.out.println("오류확인합니다"+insertCount);
		}catch(SQLException ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 수정.
	public int updateArticle(GBbean article){

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
	public int updateReadCount(int GB_NUM){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update galBoard set GB_READCOUNT = "+
				"GB_READCOUNT+1 where GB_NUM = "+GB_NUM;

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
	public boolean isArticleBoardWriter(int GB_NUM,String GB_ID){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String gal_sql="select * from galBoard where GB_NUM=?";
		boolean isWriter = false;

		try{
			pstmt=con.prepareStatement(gal_sql);
			pstmt.setInt(1, GB_NUM);
			rs=pstmt.executeQuery();
			rs.next();

			if(GB_ID.equals(rs.getString("GB_ID"))){
				isWriter = true;
			}
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);
		}

		return isWriter;

	}
	

}
