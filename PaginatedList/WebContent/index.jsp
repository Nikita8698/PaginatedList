<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Paginated List</title>
<style>
table
{
width:100%;
}
th{
width:20%;
}
td{
width:20%;
}
button{
width:20%;
margin-left:40%;
padding:10px 12px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* $('#ptablelist').DataTable( {
        "pagingType": "full_numbers"
    } ); */
	$("#plist").click(function(){
		$.ajax({
			type:"GET",
			url:"PaginatedListServlet",
			success:function(data)
			{
				var c=JSON.parse(data);
				$("#pListBody").empty();
				for(var i=0;i<=c.length;i++)
					{
					var a=c[i];
					var tr = $("<tr>");
					$(tr).append($("<td>").text(a.userId));
					$(tr).append($("<td>").text(a.id));
					$(tr).append($("<td>").text(a.title));
					$(tr).append($("<td>").text(a.body));
					$("#pListBody").append(tr);
					
					}
			}
		});
		
	});	
});
</script>
</head>
<body>
<button id="plist">Get List</button><br><br>
<table align="center" border="1" id="ptablelist">
<thead>
<tr><th>USERID</th><th>ID</th><th>TITLE</th><th>BODY</th></tr>
</thead>
<tbody id="pListBody">

</tbody>
</table>
</body>
</html>