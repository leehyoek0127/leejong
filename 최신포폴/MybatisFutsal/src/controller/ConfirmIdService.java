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
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String id = request.getParameter("id");
		ConfirmIdAction model = ConfirmIdAction.instance();
		ArrayList<SignDto> checkuser = (ArrayList<SignDto>) model.selectID(id);
		request.setAttribute("data", checkuser);
		String count="";
		
		if(checkuser.isEmpty()) {
			System.out.println("카운트456");
			count="456";

		} else {
			System.out.println("카운트123");
			count="123";
		}

		return count;
	}

}
