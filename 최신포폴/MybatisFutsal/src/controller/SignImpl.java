package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SignDto;
import model.SignModel;


public class SignImpl implements Cominterface{
	
	static SignImpl impl = new SignImpl();
	public static SignImpl instance() { //instance �޼ҵ尡 �� ��ü�� �����ϴ� �� �̰��� �̱��� ���� !  static �� �پ������Ƿ� �ѹ� ����� ������ ����ؼ� �� �� �����Ƿ� �ߺ��� �ȵ����� 
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		
		SignModel model = SignModel.instance();
		ArrayList<SignDto> list = (ArrayList<SignDto>)model.selectMember(id);
	
		request.setAttribute("data", list);
		
		System.out.println("bb"+list.size());
		return "logincom.jsp";
	}
}

