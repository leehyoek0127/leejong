package mybatis;

import static model.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import model.NoticeDto;

public class NoticeDAO {
	
	DataSource ds;
	Connection con;
	private static NoticeDAO Noticedao;

	private NoticeDAO() {
		// TODO Auto-generated constructor stub
	}

	public static NoticeDAO getInstance(){
		if(Noticedao == null){
			Noticedao = new NoticeDAO();
		}
		return Noticedao;
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
			pstmt=con.prepareStatement("select count(*) from noticeboard");
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
	public ArrayList<NoticeDto> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String gal_list_sql="select * from noticeboard order by nref desc,nseq asc limit ?,9";
		ArrayList<NoticeDto> articleList = new ArrayList<NoticeDto>();
		NoticeDto gal = null;
		int startrow=(page-1)*9; //읽기 시작할 row 번호..	

		try{
			pstmt = con.prepareStatement(gal_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				gal = new NoticeDto();
				gal.setNnum(rs.getInt("nnum"));
				gal.setNtitle(rs.getString("ntitle"));
				gal.setNcontents(rs.getString("ncontents"));
				gal.setNfile(rs.getString("nfile"));
				gal.setNref(rs.getInt("nref"));
				gal.setNlev(rs.getInt("nlev"));
				gal.setNseq(rs.getInt("nseq"));
				gal.setNreadcount(rs.getInt("nreadcount"));
				gal.setNdate(rs.getDate("ndate"));
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
	public NoticeDto selectArticle(int nnum){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeDto NoticeDto = null;

		try{
			pstmt = con.prepareStatement(
					"select * from noticeboard where nnum = ?");
			pstmt.setInt(1, nnum);
			rs= pstmt.executeQuery();

			if(rs.next()){
				NoticeDto = new NoticeDto();
				NoticeDto.setNnum(rs.getInt("nnum"));
				NoticeDto.setNtitle(rs.getString("ntitle"));
				NoticeDto.setNcontents(rs.getString("ncontents"));
				NoticeDto.setNfile(rs.getString("nfile"));
				NoticeDto.setNref(rs.getInt("nref"));
				NoticeDto.setNlev(rs.getInt("nlev"));
				NoticeDto.setNseq(rs.getInt("nseq"));
				NoticeDto.setNreadcount(rs.getInt("nreadcount"));
				NoticeDto.setNdate(rs.getDate("ndate"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return NoticeDto;

	}

	//글 등록.
	public int insertArticle(NoticeDto article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(nnum) from noticeboard");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into noticeboard (nnum,ntitle,";
			sql+="ncontents, nfile, nref,"+
					"nlev,nseq,nreadcount,"+
					"ndate) values(?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getNtitle());
			pstmt.setString(3, article.getNcontents());
			pstmt.setString(4, article.getNfile());
			pstmt.setInt(5, num);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 수정.
	public int updateArticle(NoticeDto article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update galBoard set GB_SUBJECT=?,GB_CONTENTS=? where GB_NUM=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getNtitle());
			pstmt.setString(2, article.getNcontents());
			pstmt.setInt(3, article.getNnum());
			System.out.println(pstmt);
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//글 삭제.
	public int deleteArticle(int nnum){

		PreparedStatement pstmt = null;
		String gal_delete_sql="delete from galBoard where GB_NUM=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(gal_delete_sql);
			pstmt.setInt(1, nnum);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}

	//조회수 업데이트.
	public int updateReadCount(int nnum){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update galBoard set GB_READCOUNT = "+
				"GB_READCOUNT+1 where nnum = "+nnum;

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
	public boolean isArticleBoardWriter(int nnum,String GB_ID){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String gal_sql="select * from galBoard where GB_NUM=?";
		boolean isWriter = false;

		try{
			pstmt=con.prepareStatement(gal_sql);
			pstmt.setInt(1, nnum);
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
