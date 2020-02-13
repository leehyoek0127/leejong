package controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SignDto;
import model.SignModel;
public class SignDel implements Cominterface{

	static SignDel impl = new SignDel();
	public static SignDel instance() { //instance 메소드가 늘 객체를 리턴하는 것 이것이 싱글톤 패턴 !  static 이 붙어있으므로 한번 만들어 놓으면 계속해서 쓸 수 있으므로 중복이 안되지만 
		return impl;
}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		String id = (String)session.getAttribute("uss");
		SignDto member = null;
		member = new SignDto();	
		
		System.out.println("show 입");
		System.out.println(id+"여기나오면 됨");
		System.out.println(request.getParameter("pw")+"폼에서 넘어온 pw 값");
		SignModel model = SignModel.instance();
		
		ArrayList<SignDto> list = (ArrayList<SignDto>)model.selectMember(id);
		System.out.println(list.get(0).getPw());
		member.setId(list.get(0).getId());
		//member.setPw(request.getParameter("pw"));
		if(request.getParameter("pw").equals(list.get(0).getPw())) {
			System.out.println("비밀번호 일치해서 삭제 실행.");
			request.setAttribute("check",1);  
			model.delSign(member);
		}
		else {
			request.setAttribute("check",0);  
			System.out.println("삭제 안함.");
		}
		
		return "signdel.jsp";
	}
}

















