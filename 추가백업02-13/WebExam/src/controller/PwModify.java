package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MemberDto;
import model.SignModel;

public class PwModify implements Cominterface {
	static PwModify impl = new PwModify();

	public static PwModify instance() { // instance 메소드가 늘 객체를 리턴하는 것 이것이 싱글톤 패턴 ! static 이 붙어있으므로 한번 만들어 놓으면 계속해서 쓸 수
										// 있으므로 중복이 안되지만
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDto member = null;

		member = new MemberDto();

		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));

		SignModel model = SignModel.instance();
		model.modifyPw(member);

		return "logincom.jsp";
	}
}
