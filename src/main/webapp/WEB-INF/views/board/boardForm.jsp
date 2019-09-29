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
<form name="form1" action="boardSave">
        <table border="1" style="width:600px">
            <caption>게시판</caption>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
                <tr>
                    <td>작성자</td> 
            
                    <td><input type="text" name="brdwriter" size="70" maxlength="250" value="${boardInfo.brdwriter}"></td> 
                </tr>
                <tr>
                    <td>제목</td> 
                    <td><input type="text" name="brdtitle" size="70" maxlength="250" value="${boardInfo.brdtitle}"></td> 
                </tr>
                <tr>
                    <td>내용</td> 
                    <td><textarea name="brdcontent" rows="5" cols="60">${boardInfo.brdcontent}</textarea></td> 
                </tr>
            </tbody>
        </table>
        <input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>">  
        <a href="#" onclick="form1.submit()">저장</a>
    </form>    
</div>
</body>
</html>