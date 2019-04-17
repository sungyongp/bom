//함수명 접두사를 helpdesk로 시작하세요.
//ex) function helpdeskMoviePage()

	$(document).ready(function() {
		
		$(".notice-menu > a").click(function() {
			var submenu = $(this).next("ul");

			if (submenu.is(":visible")) {
				submenu.slideUp();		
			} else {	
				submenu.slideDown();
			}
		});
		
		$(".faq-menu > a").click(function() {
			var submenu = $(this).next("ul");
			
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
		
		var frm = document.frm;
		frm.photo.onchange = imageView;
		
		$("#image-zone").hide();
		
	});
	
	function imageView(e) {

		var frm = document.frm;
		var url = e.srcElement;
		var file = url.files[0];
		var reader = new FileReader();

		reader.readAsDataURL(file);	

		reader.onload = function(e2) {
	
		var img = new Image();
		img.src = e2.target.result;
		frm.image.src = img.src;
		}
 	}
	
	function check() {
	      var frm = document.frm;
	      var obj = inputData(frm);
	      if (obj != null) {     
	         obj.focus();
	         
	         swal({
	            text : "제목과 내용은 꼭 입력하세요.",
	            icon : "warning",
	         });         
	      } else {
	         swal({
	              title: "문의글 등록",
	              text: "OK를 누르면 문의글이 등록됩니다.",
	              buttons: true,
	              dangerMode: true,
	              icon : "success",
	            })
	            .then((willDelete) => {
	              if (willDelete) {
	                 	frm.action = "insert.help";
	                    frm.submit();
	              } else {                 
	                   swal("문의하기가 취소되었습니다.",{
	                   icon: "warning",	                   
	                });
	              }
	          });
	      }
	   }
	
	function inputData(ff){
		var obj = null;		      
			if(ff.helpdeskSubject.value == '') obj = ff.helpdeskSubject;
			else if(ff.helpdeskContent.value == '') obj = ff.helpdeskContent;  
		return obj;
	}
	
	function imageChange(t, value){
		
		 if($(t).data("no",value).is(":checked")){
				
	            $("#image-zone-" + value).show()    
			}
			else{
	        	
	            $("#image-zone-"+ value).hide()     
	         
			} 
	} 
	 
	function imageMyView(t, value){
		
		if(t.files && t.files[0]){
			
			console.log(t);
			console.log(value);
			console.log($(t).data("no",value) );
				
			var reader = new FileReader();
			reader.onload = function(e){
					
				$("#img-"+value).attr('src', e.target.result);
			
			}
			reader.readAsDataURL(t.files[0]);
		}

	}

	function myListDel(serial, photo){
		
		$.ajax({
			url : "delete.help",
			type : "POST",
			data : {serial: serial, photo: photo},
		
			success : function(data){
			
				if(data == 0){
					alert("삭제 중 오류발생");
					
				}else{
					alert("정상적으로 삭제되었습니다.");
					location.href = "view.help";
				}
			},
			error : function(error){
				alert(error);
			}
		});
	} 
	
	