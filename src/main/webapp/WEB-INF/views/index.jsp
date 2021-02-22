<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
  font-family: Roboto, Arial, sans-serif;
  ont-size: 15px;
  color: #525252;
  padding: 8px;
  line-height: 160%;
}
a {
  color: #598585;
}

a:link {
  text-decoration: none;
}

a:visited {
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
  color: #2f4f4f;
}

a:active {
  text-decoration: underline;
}
button {
    width:50px;
    background-color: #467575;
    border: none;
    color:#fff;
    padding: 2px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;
}
button:hover {
  background-color: #2b4d4d;
}
input[type=text] {
  width: 13%;
  margin-bottom: 20px;
  padding: 7px;
  border: 1px solid #ccc;
  border-radius: 3px;
}
</style>
</head>
<body>
	<h1>전시회 정보</h1>
    <div class="container">
	<form>
		<div class="row">
        	<div class="col-20">
				<div id="menu-group">
			        <a href="#" id="user-page">유저페이지</a><br>
				    <a href="#" id="exhbn-page">전시페이지</a><br>
				    <a href="#" id="booking-page">예약페이지</a><br>
				    <a href="#" id="review-page">리뷰페이지</a><br>
				</div>
			</div>
		</div>
	</form>
	</div>

        
<script src="<%=application.getContextPath() %>/resources/cmm/js/cmm.js"></script>
<script>
    	cmm.init(`<%=application.getContextPath() %>`)
</script>
</body>
</html>