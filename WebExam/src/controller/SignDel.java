package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDto;
import model.SignModel;

public class SignDel implements Cominterface {

	static SignDel impl = new SignDel();

	public static SignDel instance() { // instance �޼ҵ尡 �� ��ü�� �����ϴ� �� �̰��� �̱��� ���� ! static �� �پ������Ƿ� �ѹ� ����� ������ ����ؼ� �� ��
										// �����Ƿ� �ߺ��� �ȵ�����
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		String id = (String) session.getAttribute("uss");
		MemberDto member = null;
		member = new MemberDto();

		SignModel model = SignModel.instance();

		ArrayList<MemberDto> list = (ArrayList<MemberDto>) model.selectMember(id);
		System.out.println(list.get(0).getPw());
		member.setId(list.get(0).getId());
		// member.setPw(request.getParameter("pw"));
		if (request.getParameter("pw").equals(list.get(0).getPw())) {

			request.setAttribute("check", 1);
			model.delSign(member);
		} else {
			request.setAttribute("check", 0);

		}

		return "signdel.jsp";
	}
}
