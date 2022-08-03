<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<%
	String turn = String.valueOf(request.getParameter("turn"));
String go = String.valueOf(request.getParameter("go"));
String history = String.valueOf(request.getAttribute("history"));
String position = String.valueOf(request.getAttribute("position"));
%>
<meta charset="EUC-KR">
<title>Robot Remote</title>
<style type="text/css">
div#out {
	display: flex;
	flex-direction: column;
}

#up {
	height: 30%;
	position: static;
	box-sizing: border-box;
}

#left {
	width: 30%;
	float: left;
	box-sizing: border-box;
}

#right {
	width: 70%;
	float: right;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<form action="/Command_Pattern" method="get">
		<div id="out">
			<div id="up">
				<div id="left">
					<input type="hidden" name="cmd" value="commit"> 회전 방향 <br />
					위 오른쪽 아래 왼쪽<br /> <input type="radio" name="turn" value="UP">
					<input type="radio" name="turn" value="RIGHT"> <input
						type="radio" name="turn" value="DOWN"> <input type="radio"
						name="turn" value="LEFT"><br /> 전진할 칸 : <input
						type="number" name="go"><br /> <input value="저장"
						type="submit" name="save"> <input value="실행" type="button"
						onclick="start()">
				</div>
				<div id="right">
					현재 위치 :
					<%
					if (position == "null") {
					out.print("8,4");
				%>
					<!--  <span id = "ro_y">8</span> X : <span id = "ro_x">4</span> -->
					<%
						} else {
					out.print(position);
					}
					%>
					<div id="commandlist">
						<%
							if (history == "null")
							out.print("");
						else
							out.print(history);
						%>
					</div>
				</div>
			</div>
			<div id="table" style="width: 327px; height: 500px">
				<%
					if (history == "null") {
				%>
				<div id="container">
					<script>
						const rowCnt = 9;
						const columnCnt = 9;
						document.write('<table border="1">');
						for (let i = 0; i < rowCnt; i++) {
							document.write('<tr>');
							for (let j = 0; j < columnCnt; j++) {
								if (i == 8 && j == 4) {
									document.write('<td>');
									document.write("&nbsp●");
									document.write('</td>');
								} else {
									document.write('<td>');
									document.write("&nbsp&nbsp&nbsp&nbsp");
									document.write('</td>');
								}
							}
							document.write('</tr>')
						}
						document.write('</table>');
					</script>
				</div>
				<%
					} else {
				%>
				<div id="container">
					<%
						if (position == "null") {
							%><h6 style="color:white;"><%
						out.print("8,4");
							%></h6><%
					} else {
						String[] str = position.split(",");
					%><h6 id="int_x" style="color:white;">
						<%
							out.print(str[0].charAt(0));
						%>
					</h6>
					<h6 id="int_y" style="color:white;">
						<%
							out.print(str[1].charAt(0));
						%>
					</h6>
					<%
						}
					%>
					<script>
						const x = document.getElementById("int_x").innerText;
						const y = document.getElementById("int_y").innerText;
						console.log(x);
						console.log(y);
						const rowCnt = 9;
						const columnCnt = 9;
						document.write('<table border="1">');
						for (let i = 0; i < rowCnt; i++) {
							document.write('<tr>');
							for (let j = 0; j < columnCnt; j++) {
								if (x == j && y == i) {
									document.write('<td>');
									document.write("&nbsp●");
									document.write('</td>');
								} else {
									document.write('<td>');
									document.write("&nbsp&nbsp&nbsp&nbsp");
									document.write('</td>');
								}
							}
							document.write('</tr>')
						}
						document.write('</table>');
					</script>
				</div>
				<%
					} ;
				%>
			</div>
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