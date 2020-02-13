package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConfirmIdAction;
import model.SignDto;

public class ConfirmIdService implements Cominterface {

	static ConfirmIdService impl = new ConfirmIdService();

	public static ConfirmIdService instance() {
		System.out.println("���߾��̵𼭺� �ν��Ͻ����鷯��"+impl);
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String id = request.getParameter("id");
		 System.out.println("���Ÿ���̵�"+id);
		ConfirmIdAction model = ConfirmIdAction.instance();
		ArrayList<SignDto> checkuser = (ArrayList<SignDto>) model.selectID(id);
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
