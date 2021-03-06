<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
 <style>
      .container {
         max-width: 900px;
         margin: 50px auto;

      }
      div{text-align:center;}

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
   <div class="container">
      <h2 style="text-align:center">자유게시판 글 작성</h2>
      <form action="boardWriteProc" method="post">
         <div class="contents_box">
            <div class="title" style="text-align:center;">
               <h3>
                  <input type="text" name="title" id="title" style="text-align:center; width:800px;" placeholder="제목을 입력하세요">
               </h3>
            </div>

            <div class="contents" style="text-align:center;">
               <textarea name="contents" id="contents" cols="110" rows="10" placeholder="내용을 입력하세요."></textarea>
            </div>
            
            <div class="btn_wrap text-right">
               <input type="submit" class="btn btn-success float-right" value="등록하기">
               <a href="boardMain" class="btn btn-primary float-left" >목록으로</a>
            </div>
         </div>
      </form>

   </div>


</body>
</html>