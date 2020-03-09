package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MemberDto;
import model.SignModel;

public class PwModify implements Cominterface {
	static PwModify impl = new PwModify();

	public static PwModify instance() { // instance �޼ҵ尡 �� ��ü�� �����ϴ� �� �̰��� �̱��� ���� ! static �� �پ������Ƿ� �ѹ� ����� ������ ����ؼ� �� ��
										// �����Ƿ� �ߺ��� �ȵ�����
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
