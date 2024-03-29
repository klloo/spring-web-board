<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file = "../includes/header.jsp" %>
<%@include file = "../includes/top_menu.jsp" %>
<%@include file = "../includes/page_header.jsp" %>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css_table/bootstrap.min.css">

<style>
        *{
            border-collapse: collapse;
            margin: 0%;
            padding: 0%;
            text-decoration: none;
            color: black;
            list-style: none;
        }
        a:hover {  color: black; text-decoration: none;}
        .title{
            margin: 8%;
            text-align: center;
        }
        .table_div {
            padding-left: 10%;
            padding-right: 10%;
            padding-bottom: 15%;
        }
        .table th {
            font-size: 75%;
        }
        .write_btn{
            padding-top: 2%;
            padding-bottom: 2%;
        }
        .write_btn a{
            font-size: 80%;
            font-style: italic;
        }
        .img{
            padding-left: 10%;
            padding-right: 10%;
        }
        .table > tbody > tr > td > a{
            color: black;
        }
        .table > tbody > tr > td:last-child{
            color:grey;
        }
        .views{
            color:grey;
        }
        .date{
            color:grey;
        }
		.paging {
        display: flex;
        justify-content: center;
       }
       .title {
       	width:400px;
       }
       .dateh {
       	width: 200px;
       }
       .today{
       	font-size: 150%;
       }
       .dataTime {
       		color:grey;
       		font-size: 60%;
       }
       .air_info {
       }
     </style>
 


<div class="table_div">
	<div id="air_info">
		<div class="today">
		&#x1F32B;<c:out value=" ${today} 오늘의 미세먼지"/>
		<span class="dataTime" id="dataTime"></span>
		<hr style="border:solid 0.1px grey">
		</div>
		
		<div id="cause" style="margin:5px"></div>
		<div id="overall" style="margin:5px"></div>
	</div>
	<sec:authorize access="isAuthenticated()"> 
	    <div class="write_btn" style="float:right">
	        <div>
	            <a href="/board/register" >WRITE</a>
	        </div>
	    </div>
    </sec:authorize>
    
    <br><br><br>

    <!-- 목록 출력 영역 -->
   
    
      <div class="table-responsive">

        <table class="table custom-table">
          <thead>
            <tr>
            <th>NO</th>
            <th class="title">TITLE</th>
            <th>WRITER</th>
            <th class="dateh">DATE</th>
            <th>VIEWS</th>
            <th>LIKES</th>
            </tr>
          </thead>
          <tbody>
            <c:set var="no" value="${(pageMaker.cri.pageNum-1)*10+1}"/>
        	<c:forEach var="board" items="${boardList}">
        		<tr>
					<td> <c:out value="${no}"/> </td>
					<c:set var="no" value="${no+1}"/>
					<td> <a href="/board/read?bno=${board.bno}"/>
						<c:if test="${board.replycnt == '0'}"><c:out value="${board.title}"/></c:if>
						<c:if test="${board.replycnt != '0'}"><c:out value="${board.title} [${board.replycnt}]"/></c:if>
					</td>
					<td> 
						<c:if test="${board.isanonymous eq 'true'}">익명</c:if>
						<c:if test="${board.isanonymous eq 'false'}"><c:out value="${board.writer}"/></c:if>
					</td>
					<td class="date"> <fmt:formatDate pattern="yyyy. MM. dd" value="${board.regdate}"/></td>
					<td class="views"> <c:out value="${board.viewcnt}"/> </td>
					<td> <c:out value="${board.likecnt}"/> </td>
				</tr>
			</c:forEach>
          
            
          </tbody>
        </table>

  </div>
    <br/> <br/> <br/>
    <div class="paging">
    	<ul class="pagination">
		    <c:if test="${pageMaker.prev}">
		    <li class = "paginate_button previous">
		    	<a href="${pageMaker.startPage-1}" style="color:grey"><c:out value="<"/></a>
		    </li>
		    <span>&nbsp;&nbsp;&nbsp;</span>
		    </c:if>
		    
		    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		    <li class = "paginate_button">
		    	<a href="${num}" style="color:
		    	<c:if test="${pageMaker.cri.pageNum == num}">black;</c:if>
		    	<c:if test="${pageMaker.cri.pageNum != num}">grey;</c:if>
		    	">${num}</a>
		    </li>
		    <span>&nbsp;&nbsp;&nbsp;</span>
		    </c:forEach>
		    
		    <c:if test="${pageMaker.next}">
		    <li class = "paginate_button next">
		    	<a href="${pageMaker.endPage+1}" style="color:grey"><c:out value=">"/></a>
		    </li>
		    </c:if>
    	</ul>
    </div>
    <form id='actionForm' action="/board/list" method='get'>
    	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
    	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
    </form>
</div>

<script src="/resources/js/airinfo.js"></script>
<%@include file = "../includes/footer.jsp" %>

        