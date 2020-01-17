<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="Yonglist.YonglistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Yonglist.YonglistDto"%>
<%@ page import="java.util.Date"%>

<!doctype html>
<html lang="en">
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/signbutton.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/signformrelocation.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles2.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>
<title>용병 게시판</title>

<script>
	function del1() {
		var con_test = confirm("삭제하시겠습니까?");
		if (con_test == true) {
			document.action.submit();
		
		} else if (con_test == false) {
			self.close();
			
		}
	}
</script>
</head>
<body>
	<h2>용병 상세게시판</h2>

	<jsp:useBean id="yl" class="Yonglist.YonglistDao" />
	<div class="container" id="formInnerWrapper">
		<table class="table table-striped">
			<thead>
				<tr id="tabletitle">
					<th scope="col" class="thno"><span>글번호</span></th>
					<th scope="col" class="thtitle" style="text-align: center;"><span>ID</span></th>
					<th scope="col" class="thtitle" style="text-align: center;"><span>이름</span></th>
					<th scope="col" class="thname"><span>지점</span></th>
					<th scope="col" class="thview"><span>매치일자</span></th>
					<th scope="col" class="thname"><span>구장</span></th>
					<th scope="col" class="thview"><span>내용</span></th>
				</tr>
			</thead>


			<tbody>

				<%
					String yid = (String) session.getAttribute("id");
					int index = Integer.parseInt(request.getParameter("index"));

					ArrayList<YonglistDto> yongone = yl.selectone(index);
				%>
				<tr>
					<td class="thgongji">
						<!--No--> <%
 	out.println(yongone.get(0).getyNo());
 %>
					</td>
					<td class="thdate2">
						<!--ID--> <%
 	out.println(yongone.get(0).getyId());
 %>
					</td>

					<td class="thdate2">
						<!--작성자--> <%
 	out.println(yongone.get(0).getyMember());
 %>
					</td>
					<td class="thname">
						<!--지점--> <%
 	out.println(yongone.get(0).getyBranch());
 %>
					</td>


					<td class="thview">
						<!--매치일자--> <%
 	out.println(yongone.get(0).getyMatchdate());
 %>
					</td>
					<td class="thname">
						<!--구장--> <%
 	out.println(yongone.get(0).getyGround());
 %>
					</td>


					<td class="thview">
						<!--내용--> <%
 	out.println(yongone.get(0).getyContents());
 %>
					</td>


				</tr>
			</tbody>




		</table>
		<%
			out.println(request.getParameter("index"));
		%>
	<form name="action" method="post" action="yongedit.jsp?index=<%=index%>&id=<%=yid%>"> 
		<input class="signbutton signbutton5" type="submit" value="용병수정" id="edit" name="edit"
			style="font-size: 18px; width: 140px; float: left; margin: 50px 150px;"
			/>
		<input class="signbutton signbutton5" type="button" value="용병삭제" id="delete" name="delete"
			style="font-size: 18px; width: 140px; float: right; margin: 50px 150px;"
			onClick="location.href='yongedit.jsp?index=<%=index%>&id=<%=yid%>&delete=1'" />
			</form>
	</div>
</body>
</html>
