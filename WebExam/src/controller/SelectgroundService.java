package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConfirmIdAction;
import model.GroundDto;
import model.SelectgroundAction;

public class SelectgroundService implements Cominterface{
	
	static SelectgroundService impl = new SelectgroundService();

	public static SelectgroundService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String ground_name = request.getParameter("ground_name");
		 String dayOfweek = request.getParameter("dayOfweek");
		 ground_name = new String(ground_name.getBytes("8859_1"), "utf-8");
			SelectgroundAction model = SelectgroundAction.instance();
			ArrayList<GroundDto> GroundList = (ArrayList<GroundDto>) model.selectGroundname(ground_name);
			request.setAttribute("data", GroundList);
			String count="";
			
			if(GroundList.isEmpty()) {
				System.out.println("이 선택되었습니다");
				count="456";

			} else {
				System.out.println("이미 사용중인 ID입니다");
				count="123";
			}

			return count;
		}
}
