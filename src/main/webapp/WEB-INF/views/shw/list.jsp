<%@ page language="java" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #f7f7f7;
  color: black;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

.goHome-btn {
  background-color: #467575;
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
}
.goHome-btn:hover {
  background-color: #2F4F4F;
}
#btn-group button{
	border: 2px solid #467575;
	background-color: rgba(0,0,0,0);
	color: #467575;
	padding: 10px 20px;
 		font-size: 15px;
 		cursor: pointer;
 		border-radius: 8px;
}
#btn-group button:hover{
	color: white;
	background-color: #2F4F4F;
}

table, th, tr, td{
  border: 1px solid #999;
  border-collapse: collapse;
  padding:8px; 
 }
table tr:nth-child(even){background-color: #FFFAFA}
 .goHome-btn {
  background-color: #467575;
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
}
</style>
<button type="button" class="goHome-btn" id="go-home"><i class="fa fa-home"></i></button>
<div class="about-section">
	<form>
	  <h2>전시회 목록</h2> 
	  <p>현재 진행 중인 전시회 목록입니다.</p>
    <div class="row">
      <div class="col-25">
      	  <br>
		  <div id="shw-data"></div>
      </div>
    </div>
    </form>
</div>

<script>
	shw.list(`${ctx}`)
	$('#go-home').click(function() {shw.goHome(`${ctx}`)})
</script>

    