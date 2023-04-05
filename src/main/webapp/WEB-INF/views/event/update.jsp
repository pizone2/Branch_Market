<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
    <%-- <input type="button" id="fileAddBtn" value="파일 추가">
    
    <form action="./update" method="post" enctype="multipart/form-data">
        <div id="fileAddList">
            <c:forEach items="${eventDTOs}" var="dto" varStatus="i">
                <div id="file${i.count}">
                    ${dto.oriName}<button class="fileDbDel" data-fileIndex="${i.count}" data-eventNum="${dto.eventNum}">X</button>
                </div>
            </c:forEach>
        </div>
        <input type="submit" value="등록하기">
    </form> --%>
    
    <c:forEach items="${eventDTOs}" var="dto" varStatus="i">
                <div id="file${i.count}">
                    ${dto.oriName}<button class="fileDbDel" data-fileIndex="${i.count}" data-eventNum="${dto.eventNum}">X</button>
                </div>
    </c:forEach>
    
   
    <script src="/resources/js/event/fileManager.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
    <script>
        setFileIndex(${eventDTOs.size()});
    </script>
</body>
</html>