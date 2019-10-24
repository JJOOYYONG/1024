<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





<!DOCTYPE HTML>
<html>
 

<head>
<meta charset="utf-8">
<title>Welcome to Fun Web</title>
<link href="./css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="./css/subpage.css" rel="stylesheet" type="text/css"  media="all">
<link href="./css/print.css" rel="stylesheet" type="text/css"  media="print">
<link href="./css/iphone.css" rel="stylesheet" type="text/css" media="screen">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->




</head>
 
<body>
<div id="wrap">
	<!-- 헤더 영역 -->
	<jsp:include page="../include/header.jsp" />

  <div class="clear"></div>
  <div id="sub_img_center"></div>
  <div class="clear"></div>
  
  <!-- 네브센터영역 -->
  <jsp:include page="../include/nav_center.jsp"/>

<article>
    
<h1>Notice Update.</h1>
    
<form action="update.do" method="post" name="frm" onsubmit="return check();">
<%--수정할 글번호는 눈에 안보이는 hidden타입 입력 요소로 사용 --%>
<input type ="hidden" name="num" value="${board.num}">
<input type ="hidden" name="pageNum" value="${pageNum }">    
<table id="notice">

	<tr>
	  <th class="twrite">이름</th>
	  <td class="left" width="300">
	  <input type="text" name="username" value="${board.username}" readonly="readonly"></td>
	 </tr>
	
	 <tr>
	  	<th class="twrite">패스워드</th>
	  	<td class="left" >
	  	<input type="password" name="passwd" placeholder="작성자 확인을 위한 패스워드 입력하세요"></td>
  </tr>
  

     
    <tr>
  	<th class="twrite">제목</th>
	  	<td class="left" >
	  	<input type="text" name="subject" value="${baord.subject}"></td>
  </tr>
  
    <tr>
	  	<th class="twrite">내용</th>
	  	<td class="left" >
  	<textarea name="content" rows="13" cols="40">${board.content}</textarea>
  </tr>
  
  </table>
 
<div id="table_search">
 	<input type ="submit" value="글수정" class="btn" >
 	<input type="reset" value="다시작성" class="btn">
 	<input type="button" value="목록보기" class="btn" onclick="location.href='notice.do?pageNum=${pageNum}';">
</div>
</form>     
</article>
    
     <div class="clear"></div>
    
    <!-- 푸터 영역 -->
	<jsp:include page="../include/footer.jsp"/>
</div>

<script>
function check(){
	//로그인 안한 사용자일 경우 패스워드 입력여부 확인
	var strPasswd=document.frm.passwd.value.trim();
	if(strPasswd.length == 0){
		
			alert('게시글 패스워드는 필수입력사항 입니다.');
			strPasswd.focus();
			return false;
		
	}

	
	//수정 의도 확인
	return result=confirm('${board.num}번 글을 정말로 수정하시겠습니까?');
	if(result==false){
	// var result 라고 선언되었을때 사용 -> return false;
	}
}//fuction

</script>


</body>
</html>   

   