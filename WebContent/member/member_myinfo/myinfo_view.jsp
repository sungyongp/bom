<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/final/css/member/member_myinfo_view.css">

<c:choose>
    <c:when test='${kakaoLogin != true}'>   
		 <div class="member-myinfo-content-wrap">
			<div class="member-myinfo-content-cont">
				<div class="member-view-wrapper">
				
					<div class="member-view-wrapper-item1 item-detail">
					<label class="member-view-label label-email">Email</label>
						<input name="view-email" class="nfTextField " id="view-email" type="email" autocomplete="off" placeholder="Email" value="lozxc1004@naver.com" onfocus="javascript:blur();" style="cursor: default;">
					</div>
					
					<div class="member-view-wrapper-item2 item-detail">
						<label class="member-view-label label-email">Name</label>
						<input autocomplete="off" type="text" id="view-name" class="nfTextField" name="view-name" placeholder="Name" value="김영웅" onfocus="javascript:blur();" style="cursor: default;">
					</div>
					
					<div class="member-view-wrapper-item3 item-detail">
						<label class="member-view-label label-email">Password</label>
						<input autocomplete="off" type="password" id="view-password" class="nfTextField" name="view-password" placeholder="Password" value="1234567890">
					</div>
					
					<div class="member-view-wrapper-item4 item-detail">
						<label class="member-view-label label-email">NickName</label>
						<input autocomplete="off" type="text" id="view-nickname" class="nfTextField" name="view-nickname" placeholder="NickName" value="Heros">
					</div>
					
					<div class="member-view-wrapper-item5 item-detail">
						<label class="member-view-label label-email">Re-write Password</label>
						<input autocomplete="off" type="Password" id="view-repassword" class="nfTextField" name="view-repassword" placeholder="Re-write Password" value="1234567890">
					</div>
					
					<div class="member-view-wrapper-item6 item-detail">
						<label class="member-view-label label-email">Date Of Birth</label>
						<input autocomplete="off" type="date" id="id_date" class="nfTextField" name="date" readonly="김영웅1" onfocus="javascript:blur();" style="cursor: default;" value="1993-11-18">
					</div>
					
					<div class="member-view-wrapper-item7 item-detail"></div>
					
					<div class="member-view-wrapper-item8 item-detail">
						<label class="member-view-label label-email">Phone</label>
						<input autocomplete="off" type="text" id="id_nicname" class="nfTextField" name="nickname" placeholder="NickName" value="01099997878">
					</div>
					
					<div class="member-view-wrapper-item9">
						<input value="비밀번호 변경" autocomplete="off" type="button" id="member-view-btn-modify" class="btn btn-secondary member-view-modify">
					</div>
					
					<div class="member-view-wrapper-item10">
						<input value="개인정보 수정" autocomplete="off" type="button" id="member-view-btn-delete" class="btn btn-secondary member-view-delete">
					</div>
					
					<div class="member-view-wrapper-item11 item-detail item-delete">
		    			<a href="#">회원탈퇴</a> 하기를 원하십니까?</div>
				</div>
			</div>
		</div>     
    </c:when>
    <c:otherwise>
		 <div class="member-myinfo-content-wrap">
			<div class="member-myinfo-content-cont">
				<div class="member-view-wrapper">
				
					<div class="member-view-wrapper-item1 item-detail">
					<label class="member-view-label label-email">Email</label>
						<input name="view-email" class="nfTextField " id="view-email" type="email" autocomplete="off" placeholder="Email" value="lozxc1004@naver.com" onfocus="javascript:blur();" style="cursor: default;">
					</div>
					
					<div class="member-view-wrapper-item2 item-detail">
						<label class="member-view-label label-email">Name</label>
						<input autocomplete="off" type="text" id="view-name" class="nfTextField" name="view-name" placeholder="Name" value="김영웅" onfocus="javascript:blur();" style="cursor: default;">
					</div>
					
					<div class="member-view-wrapper-item3 item-detail">	</div>
					
					<div class="member-view-wrapper-item4 item-detail">
						<label class="member-view-label label-email">NickName</label>
						<input autocomplete="off" type="text" id="view-nickname" class="nfTextField" name="view-nickname" placeholder="NickName" value="Heros">
					</div>
					
					<div class="member-view-wrapper-item5 item-detail"></div>
					
					<div class="member-view-wrapper-item6 item-detail">
						<label class="member-view-label label-email">Date Of Birth</label>
						<input autocomplete="off" type="date" id="id_date" class="nfTextField" name="date" readonly onfocus="javascript:blur();" style="cursor: default;" value="1993-11-18">
					</div>
					
					<div class="member-view-wrapper-item7 item-detail"></div>
					
					<div class="member-view-wrapper-item8 item-detail">
						<label class="member-view-label label-email">Phone</label>
						<input autocomplete="off" type="text" id="id_nicname" class="nfTextField" name="nickname" placeholder="NickName" value="01099997878">
					</div>
					
					<div class="member-view-wrapper-item9">	</div>
					
					<div class="member-view-wrapper-item10">
						<input value="개인정보 수정" autocomplete="off" type="button" id="member-view-btn-delete" class="btn btn-secondary member-view-delete">
					</div>
					
					<div class="member-view-wrapper-item11 item-detail item-delete">
		    			<a href="#">개인정보를 삭제</a> 하기를 원하십니까?</div>
				</div>
			</div>
		</div>     
    </c:otherwise>


</c:choose>