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
		System.out.println("컨펌아이디서비스 인스턴스만들러옴"+impl);
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String id = request.getParameter("id");
		 System.out.println("쇼데이타아이디"+id);
		ConfirmIdAction model = ConfirmIdAction.instance();
		ArrayList<SignDto> checkuser = (ArrayList<SignDto>) model.selectID(id);
		request.setAttribute("data", checkuser);
		String count="";
		
		if(checkuser.isEmpty()) {
			System.out.println("사용할 수 있는  ID입니다");
			count="456";

		} else {
			System.out.println("이미 사용중인 ID입니다");
			count="123";
		}

		return count;
	}

}
