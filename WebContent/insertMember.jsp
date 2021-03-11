<%@page import="DBPKG.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
	<%
		memberDAO instance = memberDAO.getInstance();
	    int custnoMAX = instance.getMaxNum();
	%>
	<script>
function inputdayNumber(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var day = "";
       
    if(number.length < 4) {
        return number;
    } else if(number.length < 6) {
       day += number.substr(0, 4);
       day += "-";
       day += number.substr(4);
    }else{
       day += number.substr(0, 4);
       day += "-";
       day += number.substr(4, 2);
      day += "-";
      day += number.substr(6);
    }
    
    obj.value = day;
}
	function inputPhoneNumber(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phoneNum = "";
		if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	    	phoneNum += number.substr(0, 3);
	    	phoneNum += "-";
	    	phoneNum += number.substr(3);
	    }else if(number.length < 11) {
	    	phoneNum += number.substr(0, 3);
	    	phoneNum += "-";
	    	phoneNum += number.substr(3, 3);
	    	phoneNum += "-";
	    	phoneNum += number.substr(6);
	    }else{
	    	phoneNum += number.substr(0, 3);
	    	phoneNum += "-";
	    	phoneNum += number.substr(3, 4);
	    	phoneNum += "-";
	    	phoneNum += number.substr(7);
	    }
		obj.value = phoneNum;
	}
</script>
	<div class="index">
		<h1>홈쇼핑 회원등록</h1>
		<div class="table">
		<form action="insertPro.jsp">
			<table border="1" class = "put">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=custnoMAX%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custName" value=""></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="" onkeyup="inputPhoneNumber(this)" maxlength='13'></td>
				</tr>
				<tr>
					<td>통신사[SK,KT,LG]</td>
					<td class="radio">
						<input type="radio" name="adress" value="SK">SK
						<input type="radio" name="adress" value="KT">KT
						<input type="radio" name="adress" value="LG">LG
					</td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" onkeyup="inputdayNumber(this)" maxlength='10'></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td>
						<select name="grade">
    						<option value="A">A</option>
    						<option value="B">B</option>
    						<option value="C">C</option>
  						</select>
					</td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2" class="end">
						<input type="submit" class="submit" value="등록">
						<input type="button" value="조회" onClick="location.href='index.jsp'">
					</td>
				</tr>
			</table>
		</form>
		</div>
		
	</div>
<jsp:include page="footer.jsp"/>