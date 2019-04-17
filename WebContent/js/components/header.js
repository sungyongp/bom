/**
 * 
 */
const { fromEvent } = rxjs;
const { ajax } = rxjs.ajax;
const { map, switchMap, debounceTime, filter, distinctUntilChanged, tap, retry, partition, finalize, share} = rxjs.operators;

const layer = document.getElementById('header-suggestLayer');
const loading = document.getElementById('header-loading');

const keyup$ = fromEvent(document.getElementById('header-search'), 'keyup')
.pipe(
	debounceTime(1000),
	map(function(e){
		return e.target.value;
	}),
	distinctUntilChanged(),
	share()
);

let [user$, reset$] = keyup$
.pipe(
	partition(function(query){
		return query.trim().length > 0
	})
);


user$ = user$
.pipe(
	tap(showLoading),
	switchMap(function(query){
		return ajax.getJSON("list.category?search="+query);
	}),
	tap(hideLoading),
	retry(2),
	finalize(hideLoading)
);

user$.subscribe({
	next: function(value){
		document.getElementById('header-suggestLayer').innerHTML = drawLayer(value);
	},
	error: function(err){
		alert("해당 결과가 없습니다.");
	}
});

reset$
.pipe(
	tap(function(value){
		offLayer();
	})
).subscribe();


window.addEventListener('click', offLayer)
window.addEventListener('unload', function(){
	window.removeEventListener('click', offLayer);
});

function goDetail(serial){
	var bomMemberSerial = document.getElementById('bomMemberSerial').value;
	var detail = $('#detail-load');
	var offset = $("#detail").offset();
	if(detail.css('display') == 'none'){
		detail.slideDown(700);
	    $('html, body').animate({scrollTop : offset.top}, 400);
	    var desc = document.getElementById("detailDescription");
	    var video = document.getElementById("detailVideoZone");
	    $.get(`get.category?serial=${serial}`, function(data){
	    	var obj = JSON.parse(data);
	    	video.innerHTML = `
	    	<video class="detail-video" muted autoplay width="100%" height="100%" loop="loop" style="object-fit:fill">
	    		<source src="/final/movie/${obj.subjectEng}.mp4" type="video/mp4">
	    	</video>
	    	`
	    	desc.innerHTML = `
		    	<img src="/final/img/intro/${obj.subjectEng}.jpg" style="width:150px;height:150px;margin-top:55px;border-radius:1rem;"/>
		    	<div style="font-family: 'Do Hyeon', sans-serif;">
		    		<h1>${obj.movieSubject}</h1>
		    		<h4>개봉일: ${obj.opendate.substring(0,10)}</h4>
		    		<h4>플레이 타임: ${obj.playtime} 분</h4>
		    		<h5>줄거리: ${obj.description}</h5>
		    		<input type='button' value="보러가기" onclick="goPlayer(${obj.serial}, '${obj.movieSubject}', ${bomMemberSerial})" style="padding:4px;cursor:pointer"/>
		    	</div>
	    	    `
	    });
	} else {
		detail.slideUp(700);
	}
}
function goAnotherPlayer(search, mSerial){
	//추천영화의 시리얼과 영화 제목을 가져온다.
	$.get(`getSerial.category?search=${search}`, function(data){
		var data = JSON.parse(data);
		addViewingActivity(data.serial, mSerial, data.movieSubject);
	});
}
function goPlayer(serial, search, mSerial){
	if(mSerial === undefined) {
		alert("먼저 로그인 해야 합니다.");
		return;
	}
	addViewingActivity(serial, mSerial, search);
}

function addViewingActivity(serial, mSerial, search, playtime = 0 ){
	$.post('addViewingActivity.mem',{
		serial: serial,
		mSerial: mSerial,
		playtime: playtime
	}, function(data){
		location.href="player.category?serial=" + serial + "&search=" + search + "&playtime="+data;
	});
}
function offLayer(){
	layer.innerHTML = "";
}
function showLoading(){
	loading.style.display = 'block';
}
function hideLoading(){
	loading.style.display = 'none';
}

function loaderror(obj){
	obj.src = "/final/img/header/notice.jpg";
}
function drawLayer(items){
	if(!items){
		return `
			<li style="padding:5px;font-family: 'Do Hyeon', sans-serif;">
				<img src="/final/img/intro/notice.jpg" width="40px" height="40px"/>
				<p style="display:inline-block;"><a href="#" style="color:white;">검색 결과 없음</a></p>
			</li>
		`
	}
	var str = '';
	for(var i=0;i<items.movie.length;i++){
		str += `
			<li style="padding:5px;font-family: 'Do Hyeon', sans-serif;">
				<img src="/final/img/intro/${items.movie[i].subjectEng}.jpg" width="40px" height="40px"/>
				<p style="display:inline-block;"><a href="search.category?search=${items.movie[i].movieSubject}" style="color:white;">${items.movie[i].movieSubject}</a></p>
			</li>
		`
	}
	return str;
}