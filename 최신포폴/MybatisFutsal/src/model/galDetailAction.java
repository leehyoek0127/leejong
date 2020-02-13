package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.galDetailService;

 public class galDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
		String page = request.getParameter("page");
		galDetailService galDetailService = new galDetailService();
		GBbean article = galDetailService.getArticle(GB_NUM);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/gal_board_view.jsp");
   		return forward;

	 }
	 
}