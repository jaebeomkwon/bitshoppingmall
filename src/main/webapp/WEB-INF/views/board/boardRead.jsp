<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div align="center">
        <table border="1" style="width:600px">
            <caption>게시판</caption>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
                <tr>
                    <td>작성자</td> 
                    <td><c:out value="${boardInfo.brdwriter}"/></td> 
                </tr>
                <tr>
                    <td>제목</td> 
                    <td><c:out value="${boardInfo.brdtitle}"/></td> 
                </tr>
                <tr>
                    <td>내용</td> 
                    <td><c:out value="${boardInfo.brdcontent}"/></td> 
                </tr>
            </tbody>
        </table> 
  
        <a href="boardList.do">돌아가기</a>
        <a href="board1Delete?brdno=<c:out value="${boardInfo.brdno}"/>">삭제</a>
        <a href="boardForm?brdno=<c:out value="${boardInfo.brdno}"/>">수정</a>
 </div>       
        <a href=""></a>
        
</body>
</html>