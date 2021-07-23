<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>자유게시판</title>
   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
   <style>
      .container {
         max-width: 900px;
         margin:50px auto;

      }
      tfoot{position:relative;} 
      .page_nav{position:absolute;left:50%;top:calc(50% + 0.475rem);transform:translate(-50%,-50%);}
      .table{table-layout: fixed;}
      .table thead{background-color:#f2f2f2;}
      .table thead th{border-bottom:none;}
      .table td, .table th{border-color:#ddd;}
      .table td{word-wrap: break-word;}
   </style>


   <script>
      $(function () {
         $("#btn_write").on('click', function () {
            location.href = "boardWrite";
         });
      });
   </script>
</head>

<body>
   <div class="container">
      <h2 class="text-center mb-3">자유 게시판</h2>
      <table width="500" border="1" align="center" class="table">
         <colgroup>
            <col width="10%">
            <col width="45%">
            <col width="10%">
            <col width="15%">
            <col width="10%">
         </colgroup>
         <thead>
            <tr align="center">
               <th>번호</th>
               <th>제목</th>
               <th>내용</th>
               <th>작성자</th>
               <th>작성일</th>
            </tr>
         </thead>

         <tbody>
            <c:forEach var="item" items="${list}">
               <tr align="center">
                  <td width="5%">${item.seq}</td>
                  <%-- ${pageContext.request.contextPath}/view.bod?seq=${list.seq} --%>
                  <td width="30%" class="text-left"><a href="boardDetail?seq=${item.seq}">${item.title}</a></td>
                  <td width="15%">${item.contents}</td>
                  <td width="15%">${item.writer}</td>
                  <td width="10%">${item.write_date}</td>
               </tr>
            </c:forEach>
         </tbody>
         
         <tfoot>
            <tr>
               <td colspan="5">
                  <a href="index.jsp" class="btn btn-secondary float-left">메인으로</a>               
                  <input type="button" id="btn_write" class="btn btn-primary float-right" value="글 쓰기">
               </td>
            </tr>
         </tfoot>
      </table>   
   </div>
</body>

</html>