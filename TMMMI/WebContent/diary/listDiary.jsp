<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Tmmmi</title>
<meta
   content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
   name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css"
   href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<link rel="stylesheet"   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"   integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"   crossorigin="anonymous">

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- sweetalert -->
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >

<script type="text/javascript">
   /* 툴팁 */
   $( function() {
       $( '.listDiary' ).tooltip();
     });
   
   $( function() {
       $( '.imageDiary' ).tooltip();
   });
   
   /* 리스트 */
   function fncGetList(currentPage) {
      /* document.getElementById("currentPage").value = currentPage; */
      $("#currentPage").val(currentPage);
      /* document.detailForm.submit(); */
      $('[name="detailForm"]').attr("method", "POST").attr("action",
            "/diary/getDiaryList").submit();
   }

   /* 전체 선택 */
   function fncAllchk() {
      if ($("#allCheck").is(':checked')) {
         $("input[name=deleteDiary]").prop("checked", true);
      } else {
         $("input[name=deleteDiary]").prop("checked", false);
      }
   }
   
   /* 삭제 */
   function fncDeleteDiary() {
      /* var userid = "";
      var diaryChk = document.getElementsByName("diaryNo");
      var chked = false;
      var indexid = false;
      for(i=0; i < memberChk.length; i++){
       if(diaryChk[i].checked){
        if(indexid){
          userid = userid + '-';
        }
        userid = userid + diaryChk[i].value;
        indexid = true;
       }
      }
      if(!indexid){
       alert("삭제할 다이어리 체크해 주세요");
       return; 
      document.userForm.delUserid.value = userid;       
      // 체크된 사용자 아이디를 '-'로 묶은 userid 를  document.userForm.delUserid 의 value로 저장
      var agree=confirm("삭제 하시겠습니까?");
         if (agree){
       document.userForm.execute.value = "userDel";
         document.userForm.submit();
         } 
      } */
      swal({
           title: "삭제 하시겠습니까?",
           text: "삭제하면 파일을 복구할 수 없습니다.",
           icon: "warning",
           buttons: true,
           dangerMode: true,
         })
         .then((willDelete) => {
           if (willDelete) {
             swal("삭제되었습니다.", {
               icon: "success",
             }).then((value)=>{
                $('[name="deleteForm"]').attr("method", "POST").attr("action", "/diary/deleteDiary").submit();
             });
           } else {
             swal("취소되었습니다.");
           }
         });
      
      /* var agree = confirm("삭제 하시겠습니까?");
      if (agree == true) {
         $('[name="deleteForm"]').attr("method", "POST").attr("action", "/diary/deleteDiary").submit();
      }
      if (agree == false) {
         return false;
      } */
   }
   
   function doesFileExist(urlToFile){
        var xhr = new XMLHttpRequest();
        xhr.open('HEAD', urlToFile, false);
        xhr.send();
        
        if (xhr.status == "404") {
           return false;
        } else {
           return true;
        }
     }
   
   $(function() {
      $("#addDiary").on("click", function() {
         location.replace('/diary/addDiary');
      });

      $(".getDetail td:nth-child(3)").on("click", function() {
         var diaryNo = $(this).data('param2');
         var currentPage = $(this).data('cp');
         console.log("아아아");
         self.location = "/diary/getDiary?diaryNo=" + diaryNo+"&currentPage="+currentPage;
      });

      $('#search').on("click", function() {         
         fncGetList(1);
      });
      
      $("#imageList").on("click", function(){
         var currentPage =$(this).data('param1');
         location.replace('/diary/listImageDiary?currentPage='+currentPage);
      });

   });
</script>
</head>
<body class="index-page sidebar-collapse">
   <jsp:include page="/common/toolbar2.jsp"></jsp:include>
   <div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">         
      <div class="container">
         <div class="row">
            <div class="col-md-8 ml-auto mr-auto">
               <div class="brand">
                  <h2 class="title">Diary</h2>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="main main-raised">
      <div class="section section-basic">
         <div class="container">
            <div align="center">
               <!-- Wrapper -->
               <div id="wrapper">
                  <!-- Main -->
                  <div id="main">
                     <div class="form-group" align="left">
                        <label for="userCategoryNo"
                           class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
                        <h3 class="title">My Diary</h3>
                        <div class="col-sm-4"></div>
                     </div>

                     <!-- table 위쪽 검색 Start /////////////////////////////////////-->
                     <div class="row">

                        <div class="col-md-6 text-left">
                           <p class="text-default">전체 글:${resultPage.totalCount}</p>
                        </div>
                        <div class="col-md-6 text-right">
                           <div class="col-sm-offset-4  col-sm-4 text-right" style="float: right;">
                     <%-- <button type="button" name="imageList" class="btn btn-primary"
                        id="imageList" data-param1="${search.currentPage}"> --%>                              
                              <a href='/diary/getDiaryList'><img src=/images/diaryImage/3213.PNG class="listDiary" style="width:30px; height:24px;" title="리스트 형식으로 보기"/></a>
                              <a href='/diary/getImageDiaryList'><img src=/images/diaryImage/321312.PNG class="imageDiary" style="width:30px; height:24px;" title="썸네일 형식으로 보기"/></a>
                           </div>

                        </div>
                        <div class="col-md-4"></div>

                        <div class="col-md-6 text-right"></div>
                     </div>
                     <nav class="navbar navbar-default navbar-expand-lg">
                     <div class="container">
                        <form name="detailForm" class="form-inline ml-auto">
                           <div class="form-group bmd-form-group">
                              <!-- <label class="sr-only" for="searchKeyword">검색어</label> 
                                  -->
                              <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="제목+내용" onKeyPress="if(event.keyCode=='13'){fncGetList(1)}" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
                              <input type="hidden" id="currentPage" name="currentPage" value="" />
                           </div>
                           <button type="button"
                              class="btn btn-white btn-raised btn-fab btn-round" id="search">
                              <i class="material-icons">search</i>
                           </button>
                        </form>
                     </div>
                     </nav>
                     
                     <form name="deleteForm">
                        <table class="table table-hover">         
                           <thead style="box-shadow:1px 1px 1px 1px gray;">
                              <tr>
                                 <th align="center" style="width:15%;">
                                    <div class="form-check">
                                       <label class="form-check-label"> <input id="allCheck"
                                          name="allCheck" class="form-check-input" type="checkbox"
                                          onclick="fncAllchk();" /> 전체선택 <span class="form-check-sign">
                                             <span class="check"></span>
                                       </span>
                                       </label>
                                    </div> <!-- 
                                      <input id="allCheck" name="allCheck" type="checkbox" onclick="fncAllchk();" />전체선택 -->
                                 </th>
                                 <th align="left" style="width:21%; text-align: -webkit-left">카테고리</th>
                                 <th align="left" style="width:50%; text-align: -webkit-left">제목</th>
                                 <th align="left" style="width:14%; text-align: -webkit-center">작성 날짜</th>
                              </tr>
                           </thead>
         
                           <tbody>
         
                              <c:set var="i" value="${fn:length(list)}" />
                              <c:forEach var="diary" items="${list}">
                                 <tr class="getDetail">
                                    <td align="left">
                                       <div class="form-check" >
                                          <label class="form-check-label"> <input name="deleteDiary" class="form-check-input" style="text-align: -webkit-center" type="checkbox"   value="${diary.diaryNo}" />
                                           <span class="form-check-sign">
                                                <span class="check"></span>
                                          </span>
                                          </label>
                                       </div> <%-- <input name="deleteDiary" type="checkbox"
                                    value="${diary.diaryNo}" /> --%>
                                    </td>
                                    <td align="left" style="text-align: -webkit-left">${diary.userCategoryName}</td>
                                    <td align="left" data-param2="${diary.diaryNo}" data-cp="${search.currentPage}" style="cursor:pointer; text-align: -webkit-left;">${diary.diaryTitle}</td>
                                    <td align="left" style="text-align: -webkit-center">${diary.diaryDate}</td>
                                 </tr>
                              </c:forEach>
         
                           </tbody>
         
                        </table>
               <!--  table End /////////////////////////////////////-->
                     </form>
                  </div>
                  <jsp:include page="../common/pageNavigator.jsp" />
               </div>
            </div>
            <div class="form-group"> 
               <div class="col-sm-offset-1  col-sm-1 text-left"
                  style="float: left;">
                  <button type="button" name="delete" class="btn btn-primary"
                     onclick="fncDeleteDiary();">삭제</button>
               </div>
               <div class="col-sm-offset-1  col-sm-1 text-right"
                  style="float: right;">
                  <button type="button" name="add" class="btn btn-primary"
                     id="addDiary" onclick="fncAddDiary();">글쓰기</button>
               </div>         
            </div>
         </div>
         
         <br><br>
      </div>
   </div>
   <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>