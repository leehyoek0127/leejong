package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDto;
import model.SignModel;


public class SignImpl implements Cominterface{
	
	static SignImpl impl = new SignImpl();
	public static SignImpl instance() { //instance 메소드가 늘 객체를 리턴하는 것 이것이 싱글톤 패턴 !  static 이 붙어있으므로 한번 만들어 놓으면 계속해서 쓸 수 있으므로 중복이 안되지만 
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		
		SignModel model = SignModel.instance();
		ArrayList<MemberDto> list = (ArrayList<MemberDto>)model.selectMember(id);
	
		request.setAttribute("data", list);
		
		System.out.println("bb"+list.size());
		return "logincom.jsp";
		//return "mypage.do?command=mypage&id="+id; 
		//Mypage에서 수정후에 제대로된 페이지로 안잘리고 들어가도록
	}
}

