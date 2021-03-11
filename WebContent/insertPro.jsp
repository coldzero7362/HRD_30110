<%@page import="DBPKG.memberDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="DBPKG.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custName = request.getParameter("custName");
		String phone = request.getParameter("phone");
		String adress = request.getParameter("adress");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		memberDAO instance = memberDAO.getInstance();
		memberVO vo = new memberVO();
		Date date = Date.valueOf(joindate);
		
		vo.setCustno(custno);
		vo.setCustName(custName);
		vo.setPhone(phone);
		vo.setAddress(adress);
		vo.setJoindate(date);
		vo.setGrade(grade);
		vo.setCity(city);
		
		boolean rst = instance.insertMember(vo);
	%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(rst){%>
		<script type="text/javascript">
			alert('회원가입에 성공하였습니다.');
			href="index.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert('회원등록에 실패에하였습니다.');
			history.go(-1);
		</script>
	<% }%>
	
</body>
</html>