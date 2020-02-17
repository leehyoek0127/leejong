package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConfirmIdAction;
import model.MemberDto;

public class ConfirmIdService implements Cominterface {

	static ConfirmIdService impl = new ConfirmIdService();

	public static ConfirmIdService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String id = request.getParameter("id");
		ConfirmIdAction model = ConfirmIdAction.instance();
		ArrayList<MemberDto> checkuser = (ArrayList<MemberDto>) model.selectID(id);
		request.setAttribute("data", checkuser);
		String count="";
		
		if(checkuser.isEmpty()) {
			System.out.println("����� �� �ִ�  ID�Դϴ�");
			count="456";

		} else {
			System.out.println("�̹� ������� ID�Դϴ�");
			count="123";
		}

		return count;
	}

}
