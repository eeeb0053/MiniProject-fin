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
}
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
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
  margin-bottom: 10px;
  display: block;
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
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
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
}
</style>

<button type="button" class="goHome-btn" id="go-home"><i class="fa fa-home"></i></button>
<h2>회원가입</h2>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form>
         <label for="uid"><b>아이디</b></label>
         <input type="text" placeholder="아이디를 입력하세요" id="userid" required>
     
         <label for="psw"><b>패스워드</b></label>
         <input type="password" placeholder="패스워드를 입력하세요" id="password" required>
         
         <label for="name"><b>이름</b></label>
         <input type="text" placeholder="이름을 입력하세요" id="name" required>
         
         <label for="email"><b>이메일</b></label>
         <input type="text" placeholder="이메일을 입력하세요" id="email" required>
         
         <label for="email"><b>성별</b></label>
         <input type="text" placeholder="성별을 입력하세요(M/F)" id="gender" required>
         
         <label for="birthday"><b>생년월일</b></label>
         <input type="text" placeholder="생년월일을 입력하세요(0000-00-00)" id="birthday" required>
         
         <label for="birthday"><b>전화번호</b></label>
         <input type="text" placeholder="전화번호를 입력하세요(010-0000-0000)" id="phoneNumber" required>
         
         <div class="clearfix">
           <button type="button" id="signupbtn" class="btn">가입하기</button>
         </div>
      </form>
    </div>
  </div>
</div>

<script>
  $('#signupbtn').click(function(){ uss.register(`${ctx}`)})
  $('#go-home').click(function() {uss.goHome(`${ctx}`)})
</script>  