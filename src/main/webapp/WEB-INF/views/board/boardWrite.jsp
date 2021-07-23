<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>

<body>
   <div class="container">
      <h2>자유게시판 글 작성</h2>
      <form action="boardWriteProc" method="post">
         <div class="contents_box">
            <div class="title">
               <h3>
                  <input type="text" name="title" id="title" placeholder="제목을 입력하세요">
               </h3>
            </div>

            <div class="contents">
               <textarea name="contents" id="contents" cols="60" rows="10" placeholder="내용을 입력하세요."></textarea>
            </div>
            
            <div class="btn_wrap text-right">
               <input type="submit"  value="등록하기">
               <a href="boardMain" >목록으로</a>
            </div>
         </div>
      </form>

   </div>


</body>
</html>