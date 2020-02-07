package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;
import vo.G_BoardBean;

public class BoardModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 System.out.println("BoardModifyFormAction.java");
		 	ActionForward forward = new ActionForward();
			int board_num=Integer.parseInt(request.getParameter("GB_NUM"));
			BoardDetailService boardDetailService
			= new BoardDetailService();	
		   	G_BoardBean article =boardDetailService.getArticle(board_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("/gal_board_modify.jsp");
	   		return forward;
	   		
	 }
	 
}