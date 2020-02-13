package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;
import vo.G_BoardBean;

public class BoardReplyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 System.out.println("BoardReplyFormAction.java");
		 	ActionForward forward = new ActionForward();
	   		String nowPage = request.getParameter("page");
	   		int board_num=Integer.parseInt(request.getParameter("board_num"));
	   		BoardDetailService boardDetailService = new BoardDetailService();
	   		G_BoardBean article=boardDetailService.getArticle(board_num);	
	   		request.setAttribute("article", article);
	   		request.setAttribute("page", nowPage);
	   		forward.setPath("/qna_board_reply.jsp");
	   		return forward;
	   		
	}
	 
}