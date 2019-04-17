window.onload = function(){
	const { fromEvent } = rxjs;
	const { ajax } = rxjs.ajax;
	
	var video = document.getElementById('main-video');
	// 스크롤 이벤트
	window.addEventListener('scroll', addBackground);
	// 배경영상 자동재생
	video.addEventListener('canplaythrough', playVideo(video));
	// 메뉴 클릭 시 메뉴바 보이기
	$('.header-item').on('click', handleClick);
}
function setVideo(){
	const arr = [
		'ironman3.mp4',
		'avengers2.mp4',
		'guardians_of_the_galaxy2.mp4',
	]
	const arr2 = [
		'아이언맨3',
		'어벤져스2',
		'가디언즈 오브 갤럭시2'
	]
	const arr3 = [
		'28',
		'35',
		'33'
	]
	var video = document.getElementById('main-video');
	var header = document.querySelector('.intro-introduce');
	var desc = document.querySelector('.intro-introduce-detail');
	var random = Math.floor(Math.random() * arr.length);
	var bomMemberSerial = document.getElementById('bomMemberSerial').value;
	
	var btn = `<button 
	type='button' 
	onclick="goPlayer('${arr3[random]}','${arr2[random]}', ${bomMemberSerial})" 
	style="padding:10px;font-family: 'Do Hyeon', sans-serif;" style="cursor:pointer;">보러가기
	</button>`;
	
	header.innerHTML = arr2[random];
	header.style.fontFamily = 'Do Hyeon, sans-serif';
	desc.innerHTML = btn;
	video.src = '/final/movie/'+ arr[random];
	video.style.position = 'fixed';
	video.style.top = 0;
	video.style.left = 0;
	video.style.width = '100%';
	video.style.height = '600px';
	video.canplaythrough = function(){
		video.play();
	}
}
function goDetail(serial){
	location.href='view.category?serial='+serial;
}

function handleClick(){
	var count = $('#btnCount').val();
	if($(this).text().trim() === '카테고리'){
		if(count === '0'){
			$('#main-category').slideDown(200);
			$('#btnCount').val('1');
		} else {
			$('#main-category').slideUp(200);
			$('#btnCount').val('0');
		}
	}
}
function playVideo(obj){
	obj.play();
}
function addBackground() {
	if(window.pageYOffset > 0){
		$('#main-header').hide();
	} else {
		$('#main-header').show();
	}
}
