<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<%
// 파라미터값 search  pageNum 가져오기
String search = request.getParameter("search"); // 검색어
if (search == null) {
	search = "";
}

String strPageNum = request.getParameter("pageNum");
if (strPageNum == null) {
	strPageNum = "1";
}
// 페이지 번호
int pageNum = Integer.parseInt(strPageNum);

// DAO 객체 준비
BoardDao boardDao = BoardDao.getInstance();

// 한페이지(화면)에 보여줄 글 개수
int pageSize = 10;

// 시작행번호 구하기
int startRow = (pageNum - 1) * pageSize + 1;

// board테이블 전체글개수 가져오기 메소드 호출
int count = boardDao.getBoardCount(search);

// 글목록 가져오기 메소드 호출
List<BoardVO> boardList = boardDao.getBoards(startRow, pageSize, search);

// 날짜 포맷 준비 SimpleDateFormat
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<body>
<div id="wrap">
	<!-- 헤더 영역 -->
	<jsp:include page="../include/header.jsp" />

	<div class="clear"></div>
	<div id="sub_img_center"></div>
	
	<div class="clear"></div>
	<%-- nav 영역 --%>
	<jsp:include page="../include/nav_center.jsp" />
<article>
    
<h1>Notice [전체글개수 : ${pageInfoMap.count}]</h1>
    
<table id="notice">
  <tr>
    <th scope="col" class="tno">no.</th>
    <th scope="col" class="ttitle">title</th>
    <th scope="col" class="twrite">writer</th>
    <th scope="col" class="tdate">date</th>
    <th scope="col" class="tread">read</th>
  </tr>
  
  <c:choose>
  
  <c:when test="${pageInfoMap.count gt 0}"><%--${not empty boardList} --%>
  
  <c:forEach var ="board" items="${boardList}">
  <tr onclick="location.href='content.do?num=${board.num}&pageNum=<%=pageNum %>';">
		  	<td>${board.num }</td>
		  	<td class="left">
		  	<c:if test="${board.reLev gt 0 }"><%-- 답글일때 --%>
		  	<c:set var="level" value="${board.reLev * 10 }" />
		  	<img src="./images/center/level.gif" width=" ${level}" height="13">
		  	<img src="./images/center/icon_re.gif">
		  	
		  	</c:if>
		  	
		  		${board.subject}
		  	</td>
		  	<td>${board.username }</td>
		  	<td><fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd"/></td>
		  	<td>${board.readcount}</td>
		  </tr>  

  </c:forEach>
  
  </c:when>
  
  <c:otherwise>
  	  <tr>
	  	<td colspan="5">게시판 글이 없습니다.</td>
	  </tr>
  </c:otherwise>
  
  </c:choose>
  
  
</table>

<div id="table_search">
	<input type="button" value="글쓰기" class="btn" onclick="location.href='writeForm.do';">
</div>

<form action="notice.do" method="get">
<div id="table_search">
	<input type="text" name="search" value="${search}" class="input_box">
	<input type="submit" value="제목검색" class="btn">
</div>
</form>

<div class="clear"></div>
 
<div id="page_control">

<c:if test ="${pageInforMap.count gt 0 }">
	<%--이전블럭 --%>
	<c:if test="${pageInforMap.startPage gt pageInfoMap.pageCount }">
	<a href="notice.do?pageNum=${pageInforMap.startPage - pageInfoMap.pageBlock}&search=${search}">[이전]</a>
	</c:if>
	<%--페이지블록 페이지5개 출력 --%>
	<c:forEach var="i" begin="${ pageInforMap.startPage}" end="${pageInfoMap.pageBlock}" step="1">
	<a href="notice.do?pageNum=${i}&search=${search}"></a>
	<c:choose>
	<c:when test=" ${i eq pageNum}">
	<span style="font-weight: bold;">[${i}]</span>
	</c:when>
	<c:otherwise>
		<span>${i}</span>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<%-- [다음] 출력--%>
	<c:if test="${pageInforMap.endPage lt pageInfoMap.pageCount }">
	<a href="notice.do?pageNum=${pageInforMap.startPage + pageInfoMap.pageBlock}&search=${search}">[다음]</a>
	</c:if>


</c:if>

</div>
    
</article>
    
    
    
	<div class="clear"></div>
    
    <!-- 푸터 영역 -->
	<jsp:include page="../include/footer.jsp" />
</div>

</body>
</html>   

    