<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
body {
  font-family: Roboto, Arial, sans-serif;
  ont-size: 15px;
  color: #525252;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 0px;
  width: 70%;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-top: 15px;
  margin-bottom: 5px;
  display: block;
  font-weight: bold;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #467575;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 95%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 14px;
}

.btn:hover {
  background-color: #2F4F4F;
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

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
h2 {
  display: block;
  font-size: 1.5em;
  margin-top: 0.83em;
  margin-bottom: 0.83em;
  margin-left: 20px;
  margin-right: 0;
  font-weight: bold;
}
h3 {
  display: block;
  font-size: 1.17em;
  margin-top: 1em;
  margin-bottom: 1em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
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
</style>
<button type="button" class="goHome-btn" id="go-home"><i class="fa fa-home"></i></button>
<h2>상세보기</h2>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form>
      <div class="col-50">
            <h3 style="text-align:center;">예약상품 정보</h3>
            <label for="stitle">예약번호</label>
            <p style="font-size:15px; color:gray;" id="bNum"></p><hr color="#DCDCDC">
            <label for="stitle">전시명</label>
            <p style="font-size:15px; color:gray;" id="sTitle"></p><hr color="#DCDCDC">
            <label for="sdate">일시</label>
            <p style="font-size:15px; color:gray;" id="sDate"></p><hr color="#DCDCDC">
            <label for="slocation">장소</label>
            <p style="font-size:15px; color:gray;" id="sLocation"></p><hr color="#DCDCDC">
            <label for="sprice">가격</label>
            <p style="font-size:15px; color:gray;" id="sPrice"></p><hr color="#DCDCDC"><br>
          </div>      	
          <div class="col-50">
            <h3 style="text-align:center;">예약자 정보</h3>
            <label for="fname"><i class="fa fa-user"></i> 예약자ID </label>
            <p style="font-size:15px; color:gray;" id="bId"></p><hr color="#DCDCDC">
            <label for="fname"><i class="fa fa-user"></i> 예약자명 </label>
            <p style="font-size:15px; color:gray;" id="bName"></p><hr color="#DCDCDC">
            <label for="email"><i class="fa fa-envelope"></i> 이메일 </label>
            <p style="font-size:15px; color:gray;" id="bEmail"></p><hr color="#DCDCDC">
            <label for="adr"><i class="fa fa-address-card-o"></i> 전화번호 </label>
            <p style="font-size:15px; color:gray;" id="bPnumber"></p><hr color="#DCDCDC">       
        </div>
        <table style="margin-left: auto; margin-right: auto;"><tbody><tr id="multi-btn">
		
		</tr></tbody></table>

      </form>
    </div>
  </div>
</div>

<script>
	bkg.detail(`${ctx}`)
	$('#go-home').click(function() {bkg.goHome(`${ctx}`)})
</script>
