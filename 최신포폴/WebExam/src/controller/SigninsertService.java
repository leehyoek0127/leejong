package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SigninsertAction;

import model.SignDto;

public class SigninsertService implements Cominterface {

	static SigninsertService impl = new SigninsertService();

	public static SigninsertService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("사인인서트서비스 쇼데이타들어옴");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		System.out.println("아이디깨지나"+id);
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String hp1 = request.getParameter("hp1");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");
		String em1 = request.getParameter("em1");
		String em2 = request.getParameter("em2");
		String gender = request.getParameter("gender");
		String hp = request.getParameter("hp");
		String adr1 = request.getParameter("adr1");
		String adr2 = request.getParameter("adr2");
		String yy = request.getParameter("yy");
		String mm = request.getParameter("mm");
		String dd = request.getParameter("dd");
		String pic = request.getParameter("pic");
		String lv = request.getParameter("lv");
		String team = request.getParameter("team");
		String[] hobbyarr = request.getParameterValues("hobby");
		String hobby = "";
		if (hobbyarr != null) {
			for (int i = 0; i < hobbyarr.length; i++) {
				hobby += hobbyarr[i] + " ";
			}
		}
		String passwd2 = request.getParameter("passwd2");
		String passwd2ans = request.getParameter("passwd2ans");
		String bank = request.getParameter("bank");
		String accountnumber = request.getParameter("accountnumber");
		String accountholder = request.getParameter("accountholder");

		SignDto SignDto = new SignDto();
		SignDto.setId(id);
		System.out.println("가져온건깨지나"+SignDto.getId());
		SignDto.setName(name);
		SignDto.setPw(pw);
		SignDto.setHp1(hp1);
		SignDto.setHp2(hp2);
		SignDto.setHp3(hp3);
		SignDto.setEm1(em1);
		SignDto.setEm2(em2);
		SignDto.setGender(gender);
		SignDto.setHp(hp);
		SignDto.setAdr1(adr1);
		SignDto.setAdr2(adr2);
		SignDto.setYy(yy);
		SignDto.setMm(mm);
		SignDto.setDd(dd);
		SignDto.setPic(pic);
		SignDto.setLv(lv);
		SignDto.setTeam(team);
		SignDto.setHobby(hobby);
		SignDto.setPasswd2(passwd2ans);
		SignDto.setPasswd2ans(passwd2ans);
		SignDto.setBank(bank);
		SignDto.setAccountnumber(accountnumber);
		SignDto.setAccountholder(accountholder);

		SigninsertAction model = SigninsertAction.instance();
		model.insertinform(SignDto);
		return "insertResult.jsp";
	}

}
