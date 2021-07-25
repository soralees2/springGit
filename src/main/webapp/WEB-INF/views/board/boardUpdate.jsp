<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>게시판 상세</title>
   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
   <style>
      .container {
         max-width: 900px;
         margin: 50px auto;

      }

      .title {
         overflow: hidden;
         padding-bottom: 10px;
         border-bottom: 1px solid #ddd;
      }

      .title .seq {
         display: inline-block;
         padding: 8px 10px;
         font-size: 15px;
      }

      .title h3 {
         display:inline-block;
         width: calc(100% - 100px);
         font-size: 2rem;
      }

      ul {
         overflow:hidden;
         float:right;
         padding: 0;
         margin: 0;
      }

      ul li {
         list-style: none;
         font-size: 13px;
         float: left;
         position: relative;
         margin-right: 11px;
         color: #666;
      }

      ul li:last-child {
         margin-right: 0;
      }

      ul li:after {
         display: block;
         width: 1px;
         height: 12px;
         background-color: #ddd;
         content: '';
         position: absolute;
         top: 50%;
         margin-top: -6px;
         margin-left: -5px;
      }

      .contents {
         padding: 20px;
         min-height: 300px;
      }

      .btn_wrap {
         padding-top: 10px;
         border-top: 1px solid #ddd;
      }
   </style>
</head>

<body>
    <form action="boardEditProc" method="get" id="frm">
   <div class="container">
      <h2 class="text-center mb-3">자유게시판 글 보기</h2>
      <div class="contents_box">
          <c:forEach var="view" items="${view}">
         <div class="title">
             <span class="seq">${view.seq}<input type="hidden" name="seq" value="${view.seq}"></span> 
            <h3>${view.title}<input type="text" size="30" name="title" value="${view.title}"></h3>
            
            <ul>
               <li class="writer">${view.writer}</li>
               <li class="write_date">${view.write_date}</li>
               
            </ul>
                  
         </div>
         
         <div class="contents">
            <p>${view.contents}</p><br>
            <input type="text" style="width:800px; height:300px;" name="contents" value="${view.contents}">
         </div>
         <div class="btn_wrap text-right">
            <a href="/board/boardMain" class="btn btn-secondary float-left">목록으로</a>
            <input type="submit" class="btn btn-success float-right" value="수정하기">
         </div>
         </c:forEach>
      </div>
   </div>
    </form>
<script>


</script>
</body>

</html>


</body>
</html>