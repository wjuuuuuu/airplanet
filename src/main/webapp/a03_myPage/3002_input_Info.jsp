<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*"
    import="dao.C_insertPassengerInfo"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탑승객 정보 입력</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<style>
img.user{
	width:70%;
}
.astyle{
	color:black;
	text-decoration-line: none;
}
.btnOut{
	margin-top:30px;
	width:70%;
	height:70px;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
}
.btnSave{
	margin-top:30px;
	margin-left:200px;
	width:50%;
	height:50px;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
}
.field input {
    font-size: 16px;
    line-height: 28px;
    padding: 8px 16px;
    width: 100%;
    min-height: 44px;
    border: unset;
    border-radius: 4px;
    outline-color: rgb(84 105 212 / 0.5);
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px;
}
</style>
<body>
<%@ include file="/header.jsp" %>
<br><br>
	<div class="container-fluid">
	  <div class="row no-gutters">
	  	<div class="col-1"></div>
	    <div class="col-3" style="text-align:center;font-size:25px;">
	     <div class="p-3 border-0 bg-white">
	     	<img src="../b01_img/user.PNG" class="user"><br>
	     	<h1><b>안녕하세요!</b></h1>
	     	<p>${reg2.email}<p>
	     </div>
	     <div class="border-0 bg-white" style="margin-top:30px;"><a href="3002_input_Info.jsp" class="astyle">여행객 정보 입력</a></div><hr>
	     <div class="border-0 bg-white"><a href="3009_cardInfo_input.jsp" class="astyle">결제 정보 입력</a></div><hr>
	     <div class="border-0 bg-white"><a href="3004_show_Info.jsp" class="astyle">내 예약</a></div><hr>
	     <div class="border-0 bg-white"><a href="#" class="astyle">가격 변동 알림</a></div><hr>
	     <div class="border-0 bg-white">계정</div><hr>
	     <input class="btnOut" type="button" value="로그아웃" onclick="logout()"/>
	    </div>
	    <div class="col-2"></div>
	    <div class="col-5" style="font-size:25px;">
	    <form action="3002_input_Info_check.jsp" method="post">
	    	<div class="p-3 border-0 bg-white" style="text-align:center;"><h1><b>상세 개인 정보</b></h1></div><br>
	     	<div class="field p-3 border-0 bg-white">
	     		<label for="exampleFormControlInput1" class="form-label">이메일</label>
  				<input type="text" name="email">	
  			</div>
  			<div class="field p-3 border-0 bg-white">
	     		<label for="exampleFormControlInput1" class="form-label">한글이름</label>
  				<input type="text" name="korname">	
  				<div style="width:60%">
					<div class="namecontainer" style="font-size:15px;"></div>
				</div>
  			</div>
  			<div class="field p-3 border-0 bg-white">
	     		<label for="exampleFormControlInput1" class="form-label">영문 성</label>
  				<input type="text" name="engsur">	
  				<p style="font-size:15px">여행 증명서와 일치해야 합니다.</p>
  				<div style="width:60%">
					<div class="engsurcontainer" style="font-size:15px;"></div>
				</div>
  			</div>
  			<div class="field p-3 border-0 bg-white">
	     		<label for="exampleFormControlInput1" class="form-label">영문 이름</label>
  				<input type="text" name="engname">	
  				<p style="font-size:15px">여행 증명서와 일치해야 합니다.</p>
  				<div style="width:60%">
					<div class="engNamecontainer" style="font-size:15px;"></div>
				</div>
  			</div>
  			<div class="field p-3 border-0 bg-white">
  				<label for="exampleFormControlInput1" class="form-label">성별</label>
	     		<select name="mf" class="form-select" aria-label="Default select example">
					<option selected>응답안함</option>
				  	<option value="1">남자</option>
				  	<option value="2">여자</option>
				</select>
  			</div>
  			<div class="p-3 border-0 bg-white">
  				<label for="exampleFormControlInput1" class="form-label">국적</label>
	     		<select name="nation" class="form-select" aria-label="Default select example">
					<option>대한민국</option>
					<option>일본</option>
					<option>스페인</option>
					<option>필리핀</option>
					<option>프랑스</option>
					<option>태국</option>
					<option>포르투갈</option>
				</select>
  			</div>
  			<div class="p-3 border-0 bg-white">
	     		<label for="exampleFormControlInput1" class="form-label">생년월일</label>
  				<input name="birthday" type="date" class="form-control" id="exampleFormControlInput1">	
  			</div>
			<div class="field p-3 border-0 bg-white">
	     		<label for="exampleFormControlInput1" class="form-label">여권번호</label>
  				<input type="text" name="ppnumber">	
  				<div style="width:60%">
					<div class="ppnumbercontainer" style="font-size:15px;"></div>
				</div>
  			</div>
  			<div class="p-3 border-0 bg-white">
	     		<label for="exampleFormControlInput1" class="form-label">여권만료일</label>
  				<input name="ppexpire" type="date" class="form-control" id="exampleFormControlInput1">	
  			</div>
  			<div class="p-3 border-0 bg-white">
  				<label for="exampleFormControlInput1" class="form-label">여권발행국</label>
	     		<select name="ppnation" class="form-select" aria-label="Default select example">
					<option>대한민국</option>
					<option>일본</option>
					<option>스페인</option>
					<option>필리핀</option>
					<option>프랑스</option>
					<option>태국</option>
					<option>포르투갈</option>
				</select>
  			</div>
  			<input id="save" type="submit" value="승객 저장" class="btnSave"/>
  			</form>
	    <div class="col-1"></div>
	  </div>
	</div>
	</div>
	<br><br>
<%@ include file="/0000_footer.html" %>

</body>
<script>
// 로그아웃
var regId ='${reg2.email}';
function logout(){
	if(confirm("로그아웃하시겠습니까?")){
		location.href="/a01_member/1400_signout.jsp"
     }
}

// 유효성 검사
var nameOb = document.querySelector("[name=korname]")
var engsurOb = document.querySelector("[name=engsur]")
var engnameOb = document.querySelector("[name=engname]")
var ppnumberOb = document.querySelector("[name=ppnumber]")
var saveOb = document.querySelector("#save")

nameOb.onblur=function(){
	if(nameOb.value==""){
		document.querySelector(".namecontainer").innerText = "이름을 반드시 입력해야 합니다"
		document.querySelector(".namecontainer").style.color="red"
	}else{
		document.querySelector(".namecontainer").innerText = ""
	}
}
engsurOb.onblur=function(){
	if(engsurOb.value==""){
		document.querySelector(".engsurcontainer").innerText = "영문 성을 반드시 입력해야 합니다"
		document.querySelector(".engsurcontainer").style.color="red"
	}else{
		document.querySelector(".engsurcontainer").innerText = ""
	}
}
engnameOb.onblur=function(){
	if(engsurOb.value==""){
		document.querySelector(".engNamecontainer").innerText = "영문 이름을 반드시 입력해야 합니다"
		document.querySelector(".engNamecontainer").style.color="red"
	}else{
		document.querySelector(".engNamecontainer").innerText = ""
	}
}
ppnumberOb.onblur=function(){
	if(ppnumberOb.value==""){
		document.querySelector(".ppnumbercontainer").innerText = "여권번호를 반드시 입력해야 합니다"
		document.querySelector(".ppnumbercontainer").style.color="red"
	}else{
		document.querySelector(".ppnumbercontainer").innerText = ""
	}
}

// 버튼 활성화
saveOb.disabled = true;
nameOb.addEventListener("change", stateHandle);
engsurOb.addEventListener("change", stateHandle);
engnameOb.addEventListener("change", stateHandle);
ppnumberOb.addEventListener("change", stateHandle);

function stateHandle() {
  if (nameOb.value == "" || engsurOb.value=="" || engnameOb.value=="" || ppnumberOb.value=="") {
	 saveOb.disabled = true; 
  } else {
	 saveOb.disabled = false;
  }
}

</script>
</html>