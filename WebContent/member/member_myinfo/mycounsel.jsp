<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="/final/css/member/member_mycounsel.css">

<div class="member-myinfo-counsel">
	<div class="member-myinfo-counsel-list-wrap">	
		<div class="member-myinfo-counsel-list">
			<div class="member-myinfo-counsel-list-title">
				<span class="counsel-text-sub">번호</span>
				<span class="counsel-text-sub">내용</span>
				<span class="counsel-text-sub">문의일자</span>
				<span class="counsel-text-sub">처리일자</span>
				<span class="counsel-text-sub">처리상태</span>
			</div>
			<div class="member-myinfo-counsel-items">
				<div class="member-myinfo-counsel-item">
					<span class="counsel-text-item">1</span>
					<span class="counsel-text-item">하와 수</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">답변완료</span>
				</div>
				<div class="member-myinfo-counsel-item">
					<span class="counsel-text-item">1</span>
					<span class="counsel-text-item">하와 수</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">답변완료</span>
				</div>
				<div class="member-myinfo-counsel-item">
					<span class="counsel-text-item">1</span>
					<span class="counsel-text-item">하와 수</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">답변완료</span>
				</div>
				<div class="member-myinfo-counsel-item">
					<span class="counsel-text-item">1</span>
					<span class="counsel-text-item">하와 수</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">답변완료</span>
				</div>				
				<div class="member-myinfo-counsel-item">
					<span class="counsel-text-item">1</span>
					<span class="counsel-text-item">하와 수</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">2019.04.03</span>
					<span class="counsel-text-item">답변완료</span>
				</div>
			</div>
			<div class="member-myinfo-counsel-pagination-box">
				<div class="counsel-page-buttons">
					<a href="#" class="counsel-page-btn-dpre">&lt;&lt;</a>
					<a href="#" class="counsel-page-btn-pre">&lt;</a>
					<a href="#" class="counsel-page-btn counsel-page-btn-activity">1</a>
					<a href="#" class="counsel-page-btn">2</a>
					<a href="#" class="counsel-page-btn">3</a>
					<a href="#" class="counsel-page-btn">4</a>
					<a href="#" class="counsel-page-btn">5</a>
					<a href="#" class="counsel-page-btn-ne">&gt;</a>
					<a href="#" class="counsel-page-btn-dne">&gt;&gt;</a>
				</div>
				<div class="counsel-page-number">
					 0 / 0 페이지
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$('.counsel-page-btn').click(function(){
	  $(this).parent().children('.counsel-page-btn').removeClass('counsel-page-btn-activity');
	  $(this).addClass('counsel-page-btn-activity');
});
</script>
