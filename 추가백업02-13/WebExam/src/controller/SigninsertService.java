package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SigninsertAction;
import model.MemberDto;

public class SigninsertService implements Cominterface {

	static SigninsertService impl = new SigninsertService();

	public static SigninsertService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(111);
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		name = new String(name.getBytes("8859_1"), "utf-8");
		String pw = request.getParameter("pw");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String gender = request.getParameter("gender");
		String address_code = request.getParameter("address_code");
		String address_basic = request.getParameter("address_basic");
		address_basic = new String(address_basic.getBytes("8859_1"), "utf-8");
		String address_detail = request.getParameter("address_detail");
		address_detail = new String(address_detail.getBytes("8859_1"), "utf-8");
		String birth_year = request.getParameter("birth_year");
		String birth_month = request.getParameter("birth_month");
		String birth_day = request.getParameter("birth_day");
		String pic = request.getParameter("pic");
		pic = new String(pic.getBytes("8859_1"), "utf-8");
		String level = request.getParameter("level");
		String[] positionarr = request.getParameterValues("position");
		String position = "";
		if (positionarr != null) {
			for (int i = 0; i < positionarr.length; i++) {
				position += positionarr[i] + " ";
			}
		}
		String second_pw = request.getParameter("second_pw");
		String second_pwc = request.getParameter("second_pwc");
		second_pwc = new String(second_pwc.getBytes("8859_1"), "utf-8");
		String bank_code = request.getParameter("bank_code");
		String account_code = request.getParameter("account_code");
		String account_holder = request.getParameter("account_holder");
		account_holder = new String(account_holder.getBytes("8859_1"), "utf-8");

		MemberDto MemberDto = new MemberDto();
		MemberDto.setId(id);
		MemberDto.setName(name);
		MemberDto.setPw(pw);
		MemberDto.setTel(tel1 + "-" + tel2 + "-" + tel3);
		MemberDto.setEmail(email1 + "@" + email2);
		MemberDto.setGender(gender);
		MemberDto.setAddress_code(address_code);
		MemberDto.setAddress_basic(address_basic);
		MemberDto.setAddress_detail(address_detail);
		MemberDto.setBirth(birth_year + "³â " + birth_month + "¿ù " + birth_day + "ÀÏ");
		MemberDto.setPic(pic);
		MemberDto.setLevel(level);
		MemberDto.setPosition(position);
		MemberDto.setSecond_pw(second_pw);
		MemberDto.setSecond_pwc(second_pwc);
		MemberDto.setBank_code(bank_code);
		MemberDto.setAccount_code(account_code);
		MemberDto.setAccount_holder(account_holder);

		SigninsertAction model = SigninsertAction.instance();
		model.insertinform(MemberDto);
		return "insertResult.jsp";
	}

}
