package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class SignModel {
	
	static SignModel model = new SignModel();
	public static SignModel instance(){ //instance �޼ҵ尡 �� ��ü�� �����ϴ� �� �̰��� �̱��� ���� !
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();           // Map �� �ִ� sqlSession factory ���ڴ� �Ʊ� Map.java(SqlMapConfig �� ã�ư��� ����.)

	public List<SignDto> selectMember(String arg){
		List<SignDto> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectMember", arg);       // sqlSession �� �ҷ��� DB�� ���ǵ� �ű⼭ selectList ����. mapper ���Ͽ��� �±� �̸� ! 
		
		System.out.println("ȸ�� ������ : "+list.size());
		sqlSession.close();
		return list;
	}
	
	public SignDto insertSangpum(SignDto sangpum){
	
		SignDto obb =   sangpum;
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.insert("insertSangpum",obb);       // sqlSession �� �ҷ��� DB�� ���ǵ� �ű⼭ selectList ����. mapper ���Ͽ��� �±� �̸� ! 
		sqlSession.commit();
	//	System.out.println("���� result : "+result+"�Է� �����"+obb.getGB_CONTENTS()+" "+obb.getGB_SUBJECT()+" "+obb.getGB_ID()+" "+obb.getGB_FILE());
		sqlSession.close();
		return obb;
	}
	public SignDto modifySign(SignDto member){
		System.out.println("ȸ������");
		SignDto obb =   member;
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.update("modifySign",obb);       // sqlSession �� �ҷ��� DB�� ���ǵ� �ű⼭ selectList ����. mapper ���Ͽ��� �±� �̸� ! 
		sqlSession.commit();
	//	System.out.println("���� result : "+result+"�Է� �����"+obb.getGB_CONTENTS()+" "+obb.getGB_SUBJECT()+" "+obb.getGB_ID()+" "+obb.getGB_FILE());
		sqlSession.close();
		return obb;
	}
	public SignDto modifyPw(SignDto member){
		System.out.println("�������");
		SignDto obb =   member;
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.update("modifyPw",obb);       // sqlSession �� �ҷ��� DB�� ���ǵ� �ű⼭ selectList ����. mapper ���Ͽ��� �±� �̸� ! 
		sqlSession.commit();
	//	System.out.println("���� result : "+result+"�Է� �����"+obb.getGB_CONTENTS()+" "+obb.getGB_SUBJECT()+" "+obb.getGB_ID()+" "+obb.getGB_FILE());
		sqlSession.close();
		return obb;
	}
	public SignDto delSign(SignDto member){
		System.out.println("ȸ������");
		SignDto obb =   member;
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.delete("delSign",obb);       // sqlSession �� �ҷ��� DB�� ���ǵ� �ű⼭ selectList ����. mapper ���Ͽ��� �±� �̸� ! 
		sqlSession.commit();
		
		sqlSession.close();
		return obb;
	}
	
}
