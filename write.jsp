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
    
<h1>Notice Write</h1>
    
<form action="write.do" method="post" name="frm">  
<table id="notice">



	<tr>
	  <th class="twrite">이름</th>
	  <td class="left" width="300">
	  <input type="text" name="username"></td>
	 </tr>
	
	 <tr>
	  	<th class="twrite">패스워드</th>
	  	<td class="left" >
	  	<input type="password" name="passwd"></td>
  </tr>
  
	
 
    <tr>
  	<th class="twrite">제목</th>
	  	<td class="left" >
	  	<input type="text" name="subject"></td>
  </tr>
  
    <tr>
	  	<th class="twrite">내용</th>
	  	<td class="left" >
  	<textarea name="content" rows="13" cols="40"></textarea>
  </tr>
  
  </table>
 
<div id="table_search">
 	<input type ="submit" value="글쓰기" class="btn" >
 	<input type="reset" value="다시작성" class="btn">
 	<input type="button" value="목록보기" class="btn" onclick="location.href='notice.do';">
</div>
</form>     
</article>
    
     <div class="clear"></div>
    
    <!-- 푸터 영역 -->
	<jsp:include page="../include/footer.jsp" />
</div>


</body>
</html>   

    