package controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SignDto;
import model.SignModel;
public class SignModify implements Cominterface{
	static SignModify impl = new SignModify();
	public static SignModify instance() { //instance �޼ҵ尡 �� ��ü�� �����ϴ� �� �̰��� �̱��� ���� !  static �� �پ������Ƿ� �ѹ� ����� ������ ����ؼ� �� �� �����Ƿ� �ߺ��� �ȵ����� 
		return impl;
}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SignDto member = null;
		System.out.println("show ��");
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("pw"));
		member = new SignDto();
		request.setCharacterEncoding("utf-8");
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setHp1(request.getParameter("hp1"));
		member.setHp2(request.getParameter("hp2"));
		member.setHp3(request.getParameter("hp3"));
		member.setEm1(request.getParameter("em1"));
		member.setEm2(request.getParameter("em2"));
		member.setHp(request.getParameter("hp"));
		String adr1 = request.getParameter("adr1");
		adr1 = new String(adr1.getBytes("8859_1"),"utf-8");
		member.setAdr1(adr1);
		String adr2 = request.getParameter("adr2");
		adr2 = new String(adr2.getBytes("8859_1"),"utf-8");
		member.setAdr2(adr2);
		
		member.setYy(request.getParameter("yy"));
		member.setMm(request.getParameter("mm"));
		member.setDd(request.getParameter("dd"));
		member.setPic(request.getParameter("pic"));
		member.setLv(request.getParameter("lv"));
		member.setTeam(request.getParameter("team"));
		member.setHobby(request.getParameter("hobby"));
		member.setPasswd2(request.getParameter("passwd2"));
		String passwd2ans = request.getParameter("passwd2ans");
		passwd2ans = new String(passwd2ans.getBytes("8859_1"),"utf-8");
		member.setPasswd2ans(passwd2ans);
		
		member.setBank(request.getParameter("bank"));
		member.setAccountnumber(request.getParameter("accountnumber"));
		member.setAccountholder(request.getParameter("accountholder"));
		String accountholder = request.getParameter("accountholder");
		accountholder = new String(accountholder.getBytes("8859_1"),"utf-8");
		member.setAccountholder(accountholder);
		SignModel model = SignModel.instance();
		model.modifySign(member);
		
		return "mypage.do?command=mypage&id="+member.getId();
	}
}

















