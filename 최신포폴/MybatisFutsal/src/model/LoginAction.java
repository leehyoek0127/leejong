package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class LoginAction {
	static LoginAction model = new LoginAction();
	public static LoginAction instance(){
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<SignDto> login(SignDto SignDto){
		List<SignDto> loginuser=null;
		SqlSession sqlSession = factory.openSession();			
		loginuser = sqlSession.selectList("Login",SignDto);
		sqlSession.close();
		return loginuser;
	}


}
