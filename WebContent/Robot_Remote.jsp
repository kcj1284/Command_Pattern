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
		<input type="hidden" name="cmd" value="commit"> ȸ�� ���� <br />
		�� ������ �Ʒ� ����<br /> <input type="radio" name="turn" value="UP">
		<input type="radio" name="turn" value="RIGHT"> <input
			type="radio" name="turn" value="DOWN"> <input type="radio"
			name="turn" value="LEFT"><br /> ������ ĭ : <input type="number"
			name="go"><br /> <input value="����" type="submit" name="save">
		<input value="����" type="button" onclick="start()"> ���� ��ġ :
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
		<div>
			<%
				if (history == "null")
				out.print("");
			else
				out.print(history);
			%>

		</div>
		
		<div id="container"></div>

	</form>
	<script type="text/javascript">
		function start() {
			document.getElementById("start").submit();
		}
		const $container = document.querySelector('#container');
		const array = [];
		const $table = document.createElement('table');
		for (let i = 0; i < 3; i++) {
			const $tr = document.createElement('tr');
			const cells = [];
			for (let j = 0; j < 3; j++) {
				const $td = document.createElement('td');
				$tr.append($td);
				cells.push($td);
			}
			$table.append($tr);
			array.push(cells);
		}
		$container.append($table);
		console.log(array);
	</script>
	<form id="start" action="/Command_Pattern" method="get">
		<input type="hidden" name="cmd" value="start">
	</form>
</body>
</html>