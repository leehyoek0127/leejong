package model;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Cominterface;
import controller.galDeleteProService;

public class galDeleteProAction implements Cominterface {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
		String nowPage = request.getParameter("page");
		galDeleteProService galDeleteProService = new galDeleteProService();
		boolean isArticleWriter =galDeleteProService.isArticleWriter(GB_NUM, request.getParameter("GB_ID"));

		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('������ ������ �����ϴ�');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{
			
			boolean isDeleteSuccess = galDeleteProService.removeArticle(GB_NUM);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('��������');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("galList.bo?page=" + nowPage);
			}
			
		}


		return forward;
	}

}