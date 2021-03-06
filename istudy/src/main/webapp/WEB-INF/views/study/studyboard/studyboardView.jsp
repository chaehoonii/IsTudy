<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/studyboard/studyboardView.css" type="text/css">
<script>
      //댓글 리스트
      function studyboardReplyList(){
         var pathname = decodeURIComponent(location.href);
         var board_num = pathname.substring( pathname.indexOf('=')+1);
         var param = {"board_num" : board_num};
         var url = '/board/replyList';
         $.ajax({
            data:param,
            url:url,
            type:'GET',
            dataType:'json',
            success:function(data){
               var tag = "";
               for(var i=0; i<data.length; i++){
                  tag += "<div class='studyboard_back03_reply'>";
                  //reply top
                  //프로필, 날짜
                  tag += "<div class='reply_top'>";
                  tag += "<div class='studyboard_profile_reply' style='display:inline-block;'><img src='/upload/user/"+data[i].profile_img+"' id='studyboard_profile'/>&emsp;";
                  tag += data[i].user_nick;
                  if('${logPermission}'=='mentor'){
                     tag += "&nbsp;<img src='"+data[i].level_icon+"'style='width:20px; margin-right:10px;'/>"
                  }
                  tag += "</div>"; //studyboard_profile_reply
                  //채택버튼
                  if(data[i].selected == 1){ //답변채택된 글일때
                     if('${logId}'== data[i].writer_id){   //로그인아이디가 작성자일때 > 채택취소
                        tag += "<div class='reply_date' style='display:inline-block;'><span class='is_selected_01'><span class='is_selected_02' onclick='SelectReplyDel("+data[i].reply_num+")'>&nbsp;✔&nbsp;</span>채택됨</span>&emsp;&emsp;";
                     }else{ //로그인아이디가 작성자 아닐때
                        tag += "<div class='reply_date' style='display:inline-block;'><span class='is_selected_01'><span class='is_selected_02'>&nbsp;✔&nbsp;</span>채택됨</span>&emsp;&emsp;";
                     }
                  }else{ //답변채택되지 않은 글일때
                     if('${logId}'== data[i].writer_id && data[i].solved == 0){ //로그인아이디가 작성자일때 > 채택
                        tag += "<div class='reply_date' style='display:inline-block;'><span id='select_btn' onclick='SelectReply("+data[i].reply_num+")'>채택하기</span>&emsp;&emsp;";
                     }else{
                        tag += "<div class='reply_date' style='display:inline-block;'><span>&nbsp;&nbsp;&nbsp;</span>&emsp;&emsp;";
                     }
                  }
                  tag += ""+data[i].reply_date+"</div></div><hr/>";   //reply_top
                  
                  //reply bottom
                  //댓글 내용, 좋아요
                  tag += "<div class='reply_bottom'>";
                  if(data[i].like_type == 0){
                     tag += "&emsp;&emsp;<span class='like_span' onclick='LikeUp("+data[i].reply_num+")'><img src='/images/like_0_sky.png' class='studyboard_like' />&nbsp;"+data[i].like_num+"</span>";
                  }else{
                     tag += "&emsp;&emsp;<span class='like_span' onclick='LikeDown("+data[i].reply_num+")'><img src='/images/like_1_sky.png' class='studyboard_like' />&nbsp;"+data[i].like_num+"</span>";
                  }
                  tag += "&emsp;&emsp;<div class='reply_content'>"+data[i].reply_coment;
                  
                  //수정삭제
                  if('${logId}'== data[i].user_id){
                     tag += "<div id='reply_btns'><input type='hidden' value='"+data[i].reply_num+"'/><span class='reply_edit edit_btns'>수정</span>&nbsp;&nbsp;<span class='reply_del del_btns' onclick='ReplyDel("+data[i].reply_num+")'>삭제</span></div>";
                  }
                  tag += "</div></div>";   
               }
               $("#reply_div").html(tag);
               
               //댓글 등록=========================================================================================
               $("#addReplybtn").off("click").on("click",function(){
                  
                  if($("#reply_coment").val().trim() ==''){
                     alert("댓글 내용을 입력해주세요.");
                     $("#reply_coment").focus();
                     return false;
                  }else{
                     if(confirm('댓글을 등록하시겠습니까?')){
                        var param = $('#replyWriteForm').serialize();
                        var url = '/board/replyWrite';
                        console.log(param);
                        $.ajax({
                           data:param,
                           url:url,
                           type:'POST',
                           success:function(r){
                              console.log(r);
                              studyboardReplyList();
                              $("#reply_coment").val("");
                           },
                           error:function(error){
                                alert("error:"+error);
                            }
                        })
                     }
                     return false;
                  }
               })
               //댓글 수정폼=========================================================================================
               $(".reply_edit").click(function(){
                  var reply_num = $(this).prev().val();
                  var param = {"reply_num":reply_num};
                  console.log("reply_num="+reply_num);
                  $.ajax({
                     url:'/board/replyEdit',
                     data:param,
                     type:'GET',
                     context: this,
                     success:function(r){
                        console.log("success");
                        var tag01 = "";
                        tag01 += "<form method='post' id='replyEditForm'>";
                        tag01 += "<input type='hidden' name='reply_num' value='"+r.reply_num+"'/>";
                        tag01 += "<input type='hidden' name='board_num' value='"+r.board_num+"'/>";
                        tag01 += "<ul class='reply_write_ul'>";
                        tag01 += "<li><textarea name='reply_coment' class='graySquare' id='reply_coment'>"+r.reply_coment+"</textarea></li>";
                        tag01 += "<li><input type='button' value='댓글 수정' id='replyEditbtn' /></li>";
                        tag01 += "</ul></form>";
                        
                        $(this).parent().parent().parent().html(tag01);
                        
                        //댓글 수정=========================================================================================
                        $("#replyEditbtn").click(function(){
                           var param = $("#replyEditForm").serialize();
                           $.ajax({
                              url:'/board/replyEditOk',
                              data:param,
                              type:'POST',
                              success:function(){
                                 studyboardReplyList();
                              }
                           })
                        })
                     },
                     error:function(error){
                          alert("error:"+error);
                      }
                  })
               })
               
            }
         })//ajax
      }//studyboardReplyList
      
   // 게시글 삭제===================================================================================================
   function BoardDel(){
      if(confirm("글을 삭제하시겠습니까?")){
            location.href = "/board/boardDelete?board_num="+${vo.board_num};     
       }
       return false;
   }
   // 게시글 수정폼으로 이동================================================================================================
   function BoardEdit(){
      if(confirm("글을 수정하시겠습니까?")){
            location.href = "/study/studyboard/studyboardEdit?board_num="+${vo.board_num};     
       }
       return false;
   }
   //댓글 좋아요===================================================================================================
   function LikeUp(reply_num){
      var param02 = {"reply_num":reply_num};
      console.log(reply_num);
      $.ajax({
         url:'/study/studyboard/likeUp',
         data:param02,
         type:'POST',
         success:function(){
            studyboardReplyList();
         }
      });
   }
   //댓글 좋아요 취소===================================================================================================
   function LikeDown(reply_num){
      var param03 = {"reply_num":reply_num};
      console.log(reply_num);
      $.ajax({
         url:'/studyboard/likeDown',
         data:param03,
         type:'GET',
         success:function(){
            studyboardReplyList();
         }
      })
   }
   //댓글 삭제===================================================================================================
   function ReplyDel(reply_num){
      if(confirm('댓글을 삭제하시겠습니까?')){
         var param04 = {"reply_num":reply_num};
         $.ajax({
            url:'/board/replyDel',
            data:param04,
            type:'GET',
            success:function(){
               studyboardReplyList();
            }
         })
      }
   }
   function reportsubmit() {
      return true;
   }
$(function() {
      
   $(".modalbutton").click(function() {
      $(".modal").fadeIn();
   })
   $(".report_cancel").click(function() {
      $(".modal").fadeOut();
   })   
   
});
</script>
<div class="modal">
   <div class="modal_content">
   <form method="post" action="/study/reportJoin?board_num=${vo.board_num}" onsubmit='return reportsubmit()' enctype="multipart/form-data">
      <div style="width:100%;height:110px;display:inline-block;">
      <label style="float:left;margin-left:70px;margin-top:40px;">신고 분류</label>
      <select style="margin-top:40px;width:300px;border: 1px solid rgba(118, 118, 118, 0.5);" type="hidden" name="report_type_num" id="report_type_num" width="100%">
                                 <option value="1">광고</option>
                                 <option value="2">타인 사칭</option>
                                 <option value="3">경력 위조</option>
                                 <option value="4">욕설/비방</option>
                                 <option value="5">불건전한 컨텐츠</option>
                                 <option value="6">기타</option>
                              </select>
                              </div>   
                              <div style="width:100%;height:140px;display:inline-block;">
         <label style="float:left;margin-left:70px;">신고 내용</label>
         <textarea style="width:300px;height:100px;border: 1px solid rgba(118, 118, 118, 0.5);" name="report_content" id="report_content"></textarea>
         </div>
         <div style="width:100%;height:50px;display:block;">
      <input style="cursor:pointer;margin-right:40px" type="submit" value="신고하기" class="report_submit"/>
      <input style="cursor:pointer;margin-left:40px" type="button" value="취소" class="report_cancel"/>
      </div>
   </form>
   </div>
</div>
<div class='studyboard_back00'>
   <img src='/images/back02.png' id="back_btn" onclick="location.href='/study/studyRoom?study_num=${vo.study_num}'"/>
   <div class='studyboard_back01'>
      <div class='studyboard_back02'>
               <div id="studyboard_title">
                  <div class="titleSection">${vo.title}</div>
                  <div class="tagBox">
                     <span class="tag_title"></span>
                     <c:forEach var="lang_list" items="${vo.lang_list}">
                        <span class="lang_list">${lang_list}</span>&nbsp;&nbsp;
                     </c:forEach> 
                     <c:forEach var="tag_list" items="${vo.tag_list}">
                        <span class="tag_list">${tag_list}</span>&nbsp;&nbsp;
                     </c:forEach>
                     <br/>
                     <div class="titleSection_child">
                        <span id='studyboard_profile_span'><img src='/upload/user/${vo.profile_img}' id='studyboard_profile' />&nbsp;&nbsp;&nbsp;${vo.user_nick}</span>&emsp;&emsp;
                        <span style="cursor:pointer; color:red;" class="modalbutton">신고하기</span>
                        <span>조회수&nbsp;: &nbsp;${vo.hit}</span>&emsp;&emsp;
                        <span>${vo.write_date}</span>&emsp;&emsp;
                     </div>
                  </div>
               </div>
                  <hr/>
               <div id="studyboard_content">
                  <div id='content_box'>${vo.content}</div>
                  
               </div>                  
                  <div id="studyboard_content_btn">
                     <c:if test="${logId == vo.user_id}">
                        <div><span class='content_edit_btns' onclick="BoardEdit()">글 수정</span>&emsp;<span class='content_del_btns' onclick="BoardDel()">글 삭제</span></div>
                     </c:if>
                  </div>
      </div>
      <c:if test="${logStatus=='Y'}">
         <div class='studyboard_back04'>
            <form method='post' id='replyWriteForm'>
               <input type='hidden' name='board_num' id='board_num_box' value='${vo.board_num}'/>
                  <span><input type="text" name="reply_coment" class="graySquare" id="reply_coment"/></span>&emsp;
                  <span><input type='button' value='댓글 등록' id="addReplybtn" /></span>
            </form>
         </div>
      </c:if>   
      <div id='reply_div'>
      </div>
      <c:if test="${logStatus!='Y'}">
         <div class='studyboard_back03'>
               <ul class='reply_ul02'>
                  <li>로그인 후 댓글 등록이 가능합니다.</li>
               </ul>
         </div>
      </c:if>
   </div>
</div>