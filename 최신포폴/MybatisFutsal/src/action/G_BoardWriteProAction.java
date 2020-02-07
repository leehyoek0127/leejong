package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardWriteProService;
import svc.G_BoardWriteProService;
import vo.ActionForward;
import vo.BoardBean;
import vo.G_BoardBean;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class G_BoardWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("Q_BoardWriteProAction.java");
		request.setCharacterEncoding("UTF-8");
		ActionForward forward=null;
		G_BoardBean boardBean = null;
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
		
		boardBean = new G_BoardBean();
		boardBean.setGB_SUBJECT(multi.getParameter("GB_SUBJECT"));
		boardBean.setGB_ID(multi.getParameter("GB_ID"));
		
		boardBean.setGB_CONTENTS(multi.getParameter("GB_CONTENTS"));
		boardBean.setGB_FILE(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		System.out.println("보드라이트프로들어옴");
		G_BoardWriteProService boardWriteProService = new G_BoardWriteProService();
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
		
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
			forward.setPath("boardList.bo");
		}

		return forward;
		
	}  	
	
}