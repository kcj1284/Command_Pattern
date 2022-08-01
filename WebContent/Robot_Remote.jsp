<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<%
	String turn = String.valueOf(request.getParameter("turn"));
	String go = String.valueOf(request.getParameter("go"));
	String history = String.valueOf(request.getAttribute("history"));
	String position = String.valueOf(request.getAttribute("position"));
%>
<head>
<meta charset="EUC-KR">
<title>Robot Remote</title>
</head>
<body>
<form action="/Command_Pattern" method="get">
<input type="hidden" name="cmd" value="commit">
	회전 방향 <br/>
	위 오른쪽 아래 왼쪽<br/>
	<input type="radio" name="turn" value="UP">
	<input type="radio" name="turn" value="RIGHT">
	<input type="radio" name="turn" value="DOWN">
	<input type="radio" name="turn" value="LEFT"><br/>
	전진할 칸 : 
	<input type="number" name="go"><br/>
	<input value="저장" type="submit" name="save">
	<input value="실행" type="button" onclick="start()">
	현재 위치 : 
	<% if (position == "null") { 
	out.print("8,4");%>
	<!--  <span id = "ro_y">8</span> X : <span id = "ro_x">4</span> -->
	<%} else {out.print(position);}%>
	<div>
	<%if(history=="null") out.print("");
	else out.print(history); %>
	</div>
	
</form>
<script type="text/javascript">
function start() {
	document.getElementById("start").submit();
}
</script>
<form id="start" action="/Command_Pattern" method="get">
<input type="hidden" name="cmd" value="start">
</form>
</body>
</html>