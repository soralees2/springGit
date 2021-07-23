<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <title>BoardMain</title>

    <style type="text/css">
        *{box-sizing: border-box;}
        div{border:1px solid black;}
        
        
        </style>
</head>
<body>
    <article>
        <div class="container">
        
        <div class="table-responsive">
        
        <table class="table table-striped table-sm">
          

                <colgroup>
        
                    <col style="width:5%;" />
        
                    <col style="width:auto;" />
        
                    <col style="width:15%;" />
        
                    <col style="width:10%;" />
        
                    <col style="width:10%;" />
        
                </colgroup>
        
                <thead>
        
                    <tr>
        
                        <th>NO</th>
        
                        <th>글제목</th>
        
                        <th>작성자</th>
        
                        <th>조회수</th>
        
                        <th>작성일</th>
        
                    </tr>
        
          <tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
          	
                </thead>
       
                <tbody>
        
                    <!-- <c:choose> 
        
                       <c:when test="" > 
        
                           <tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
        
                        <</c:when> 
       
                         <c:when test="$">
         
                            <c:forEach var="list" items="$">
        
                                <tr>
        
                                    <td>no</td>
        
                                    <td>title</td>
        
                                    <td>writer</td>
        
                                    <td>count</td>
        
                                    <td>date</td>
        
                                </tr>
        
                            </c:forEach> 
        
                         </c:when> 
        
                     </c:choose> -->
        
                </tbody>
        
         
             
        
        </table>
        <table>

            <tr >
                <td><input type=button id="write" value="글쓰기">
            </tr>
        </table>
        
        </div>
        
        </div>
        
        </article>
        
        <script>
            $("#write").on("click",function(){
                location.href="/board/write";



            })

        </script>
        
 


</body>
</html>