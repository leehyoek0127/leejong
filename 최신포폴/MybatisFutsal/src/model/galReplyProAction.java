package model;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.galReplyProService;

public class galReplyProAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 
		 	ActionForward forward = null;
		    String nowPage = request.getParameter("page");
		    GBbean article = new GBbean();  		
		 	article.setGB_NUM(Integer.parseInt(request.getParameter("GB_NUM")));
		 	article.setGB_ID(request.getParameter("GB_ID"));
		 	article.setGB_SUBJECT(request.getParameter("GB_SUBJECT"));
		 	article.setGB_CONTENTS(request.getParameter("GB_CONTENTS"));
		 	article.setGB_RE_REF(Integer.parseInt(request.getParameter("GB_RE_REF")));
		 	article.setGB_RE_LEV(Integer.parseInt(request.getParameter("GB_RE_LEV")));
		 	article.setGB_RE_SEQ(Integer.parseInt(request.getParameter("GB_RE_SEQ")));	  
		 	galReplyProService galReplyProService = new galReplyProService();
		 	boolean isReplySuccess = galReplyProService.replyArticle(article);
		 	
	   		if(isReplySuccess){
	   			forward = new ActionForward();
	   			forward.setRedirect(true);
	   			forward.setPath("galList.bo?page=" + nowPage);
	   		}
	   		else{
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('답장실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
	   		}
	   		
	   		return forward;
	   		
	}  	
	 
}