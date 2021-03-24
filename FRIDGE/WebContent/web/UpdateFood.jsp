<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>食品資料</title>
	<style>
		*{
		    margin:0;
		    padding:0;
		}
		
		fieldset{
		    border-radius:10px;
		    border-color: #990000;
		    background-color: #F0F0F0;
		    width:40%;
		    height:65%;
		    margin:10% auto;
		    padding:10px;
	    }
	</style>
</head>
<body>
	<fieldset>
		<div align="center"></div>
		<h2>Storage Update</h2>
		<jsp:useBean id="food" scope="request" class="com.team2.bean.FoodBean" />
		<form  method="post" action="UpdateFood2">
			<table>
				<tr><td>Food No<td><input type="text" value="<%= food.getFoodno()%>" name="foodno" readonly >
				<tr><td>Name<td><input type="text" value="<%= food.getName()%>" name="name" >
				<tr><td>Category<td><input type="text" value="<%= food.getCategory()%>" name="category" >
				<tr><td>Expire Date<td><input type="text" value="<%= food.getExpiredate()%>" name="expiredate" >				<tr><td>Preservation<td><input type="text" value="<%= food.getPreservation()%>" name="preservation" >				<tr><td>Cal<td><input type="text" value="<%= food.getCal()%>" name="cal" >
			</table>
			<input type="submit" value="送出" >
		</form>
	</fieldset>

</body>
</html>