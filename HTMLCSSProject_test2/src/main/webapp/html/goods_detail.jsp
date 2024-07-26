<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.manager.*"%>
<%
	String type = request.getParameter("type");
	    if(type == null) type = "1";
	    
  		goodsDAO dao = goodsDAO.newInstance();
		String no = request.getParameter("no");
		goodsVO vo = dao.goodsDetailData(Integer.parseInt(no),Integer.parseInt(type));
		
	    
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<style>
		.container {
			margin-top: 50px;
		}

		.row {
			width: 960px;
			margin: 0px auto;
		}
		.b{
		  background-image: linear-gradient(90deg, red, orange, yellow, green, blue, navy, purple);
  -webkit-background-clip: text;
			color: transparent;
			text-align:center;
		}
		.dis{
			color:red;
		}
		.pri{
			color:blue;
		}
		.del{
			color:gray;
		}
		</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table table-striped">
				<tr>
					<td width="30%" class="text-center" rowspan="7">
						<img src="<%=vo.getPoster() %>" style="width:100%" class="img-rounded">
					</td>
					<td colspan="2"><h3><%=vo.getName() %></h3></td>
				</tr>
				<tr class="dis">
					<th >할인율</th>
					<td><%=vo.getDiscount() %></td>
				</tr>
				<tr class="pri">
					<th>할인가</th>
					<td><%=vo.getFirstprice() %></td>
				</tr>
				<tr >
					<th>원가</th>
					<td><%=vo.getPrice() %></td>
				</tr>
				<tr>
					<th>배송</th>
					<td class="del"><%=vo.getDelivery() %></td>
				</tr>
				<tr>
					<td colspan="2" class="text-right">
						<input type=button value="찜하기" class="btn-xs btn-primary">
						<input type=button value="좋아요" class="btn-xs btn-success">
						<input type=button value="예약" class="btn-xs btn-info">
						<input type=button value="목록" class="btn-xs btn-warning" onclick="javascript:history.back()">
						
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<pre style="white-space: pre-wrap; border:none; background-color: white;" class="b" ><h3><%=vo.getSub() %><h3></h3></pre>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>