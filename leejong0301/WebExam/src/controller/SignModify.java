package controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MemberDto;
import model.SignModel;
public class SignModify implements Cominterface{
	static SignModify impl = new SignModify();
	public static SignModify instance() { //instance �޼ҵ尡 �� ��ü�� �����ϴ� �� �̰��� �̱��� ���� !  static �� �پ������Ƿ� �ѹ� ����� ������ ����ؼ� �� �� �����Ƿ� �ߺ��� �ȵ����� 
		return impl;
}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDto member = null;
		System.out.println("show ��");
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("pw"));
		member = new MemberDto();
		request.setCharacterEncoding("utf-8");
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setTel(request.getParameter("tel1"+"-"+"tel2"+"-"+"tel3"));
		member.setEmail(request.getParameter("email1"+"@"+"email2"));
		member.setAddress_code(request.getParameter("address_code"));
		String address_basic = request.getParameter("address_basic");
		address_basic = new String(address_basic.getBytes("8859_1"),"utf-8");
		member.setAddress_basic(address_basic);
		String address_detail = request.getParameter("address_detail");
		address_detail = new String(address_detail.getBytes("8859_1"),"utf-8");
		member.setAddress_detail(address_detail);
		member.setBirth(request.getParameter("birth_year"+"��"+"birth_month"+"��"+"birth_day"+"��"));
		member.setPic(request.getParameter("pic"));
		member.setLevel(request.getParameter("level"));
		member.setPosition(request.getParameter("position"));
		member.setSecond_pw(request.getParameter("second_pw"));
		String second_pwc = request.getParameter("second_pwc");
		second_pwc = new String(second_pwc.getBytes("8859_1"),"utf-8");
		member.setSecond_pwc(second_pwc);
		member.setBank_code(request.getParameter("bank_code"));
		member.setAccount_code(request.getParameter("account_code"));
		member.setAccount_holder(request.getParameter("account_holder"));
		String account_holder = request.getParameter("account_holder");
		account_holder = new String(account_holder.getBytes("8859_1"),"utf-8");
		member.setAccount_holder(account_holder);
		SignModel model = SignModel.instance();
		model.modifySign(member);
		
		return "mypage.do?command=mypage&id="+member.getId();
	}
}

















