package model;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.galWriteProService;

public class galWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		GBbean GBbean = null;
		String realFolder="";
		String saveFolder="/boardUpload";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		GBbean = new GBbean();
		System.out.println("마지막"+multi.getParameter("GB_ID"));
		GBbean.setGB_ID(multi.getParameter("GB_ID"));
		GBbean.setGB_SUBJECT(multi.getParameter("GB_SUBJECT"));
		GBbean.setGB_CONTENTS(multi.getParameter("GB_CONTENTS"));
		GBbean.setGB_FILE(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		galWriteProService galWriteProService = new galWriteProService();
		System.out.println("dddddd"+GBbean.getGB_SUBJECT());
		boolean isWriteSuccess = galWriteProService.registArticle(GBbean);
		System.out.println(isWriteSuccess);
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("galList.bo");
		}

		return forward;
		
	}  	
	
}