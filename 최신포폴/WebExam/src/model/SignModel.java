package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class SignModel {
	
	static SignModel model = new SignModel();
	public static SignModel instance(){ //instance 메소드가 늘 객체를 리턴하는 것 이것이 싱글톤 패턴 !
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();           // Map 에 있는 sqlSession factory 쓰겠다 아까 Map.java(SqlMapConfig 를 찾아가서 쓴다.)

	public List<SignDto> selectMember(String arg){
		List<SignDto> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectMember", arg);       // sqlSession 을 불러온 DB를 쓸건데 거기서 selectList 쓴다. mapper 파일에서 태그 이름 ! 
		
		System.out.println("회원 사이즈 : "+list.size());
		sqlSession.close();
		return list;
	}
	
	public SignDto insertSangpum(SignDto sangpum){
	
		SignDto obb =   sangpum;
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.insert("insertSangpum",obb);       // sqlSession 을 불러온 DB를 쓸건데 거기서 selectList 쓴다. mapper 파일에서 태그 이름 ! 
		sqlSession.commit();
	//	System.out.println("실행 result : "+result+"입력 결과는"+obb.getGB_CONTENTS()+" "+obb.getGB_SUBJECT()+" "+obb.getGB_ID()+" "+obb.getGB_FILE());
		sqlSession.close();
		return obb;
	}
	public SignDto modifySign(SignDto member){
		System.out.println("회원수정");
		SignDto obb =   member;
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.update("modifySign",obb);       // sqlSession 을 불러온 DB를 쓸건데 거기서 selectList 쓴다. mapper 파일에서 태그 이름 ! 
		sqlSession.commit();
	//	System.out.println("실행 result : "+result+"입력 결과는"+obb.getGB_CONTENTS()+" "+obb.getGB_SUBJECT()+" "+obb.getGB_ID()+" "+obb.getGB_FILE());
		sqlSession.close();
		return obb;
	}
	public SignDto modifyPw(SignDto member){
		System.out.println("비번수정");
		SignDto obb =   member;
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.update("modifyPw",obb);       // sqlSession 을 불러온 DB를 쓸건데 거기서 selectList 쓴다. mapper 파일에서 태그 이름 ! 
		sqlSession.commit();
	//	System.out.println("실행 result : "+result+"입력 결과는"+obb.getGB_CONTENTS()+" "+obb.getGB_SUBJECT()+" "+obb.getGB_ID()+" "+obb.getGB_FILE());
		sqlSession.close();
		return obb;
	}
	public SignDto delSign(SignDto member){
		System.out.println("회원삭제");
		SignDto obb =   member;
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.delete("delSign",obb);       // sqlSession 을 불러온 DB를 쓸건데 거기서 selectList 쓴다. mapper 파일에서 태그 이름 ! 
		sqlSession.commit();
		
		sqlSession.close();
		return obb;
	}
	
}
