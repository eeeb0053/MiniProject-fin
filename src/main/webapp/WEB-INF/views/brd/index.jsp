<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
</style>
	<button type="button" class="goHome-btn" id="goHome" onclick="location.href='${ctx}/'"><i class="fa fa-home"></i></button>
    <h2>리뷰 페이지</h2>
    	<a id="write" href="#">글 쓰기</a><br>
		<a id="board-list" href="#">글 목록</a><br>
<script>
	brd.init(`${ctx}`)
</script>