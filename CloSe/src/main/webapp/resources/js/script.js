script.js
/**
 * script.js
 */
 
var isCheck = false;
var use;
var pwuse;

function go() {
	alert(1);
}

$(function(){
	$("input[name=id]").keydown(function(){
		$("#idmessage").css('display','none');
		isCheck = false;
		use = "";
	});
});

function searchAddress(){
	new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById("address1").value = data.address;
        }
    }).open();
}

function repassword_keyup(){
	//alert(1);
	if($("input[name=password]").val() == $("input[name=passwordcheck]").val()){
		$("#pwmessage").html("<font color = blue>비밀번호 일치</font>");
		pwuse = "same";
	} else {
		$("#pwmessage").html("<font color = red>비밀번호 불일치</font>");
		pwuse = "nosame";
	}
}

function pwcheck(){ // 영문 소문자/숫자 조합 8~16자
	pvalue = $("input[name=password").val();
	
	var regexp = /^[a-z0-9]{8,16}$/;
	
	if(pvalue.search(regexp) == -1){
		alert("길이는 8~16 사이어야 합니다.");
		pwerror = "error";
		setTimeout(function(){               
			f.password.select();             
		}, 10);
		return false;
	}
	
	var chk_eng = pvalue.search(/[a-z]/i); // i는 대소문자 구분하지 않는다 즉, [a-z]/i = [a-zA-Z]
	var chk_num = pvalue.search(/[0-9]/);
	if(chk_eng<0 || chk_num<0){
		alert("영문 대/소문자, 숫자 조합이 아닙니다.");
		pwerror = "error";
		setTimeout(function(){               
			f.password.select();             
		}, 10);
		return false;
	} else {
		pwerror = "";
	}
	
}

function hp2check(){
	//alert(f.hp2.value);
	if(isNaN(f.hp2.value)){
		alert("휴대폰 번호는 숫자로 입력해 주세요.");
		setTimeout(function(){               
			f.hp2.select();             
		}, 10);
	}
}

function hp3check(){
	//alert(f.hp3.value);
	if(isNaN(f.hp3.value)){
		alert("휴대폰 번호는 숫자로 입력해 주세요.");
		setTimeout(function(){               
			f.hp3.select();             
		}, 10);
	}
}

function hpcheck(){
	//alert(f.hp.value);
	if(isNaN(f.hp.value)){
		alert("휴대폰 번호는 숫자로 입력해 주세요.");
		setTimeout(function(){               
			f.hp2.select();             
		}, 10);
		return;
	}
	
	if(f.hp.value.length<11){
		alert("휴대폰 번호를 전부 입력해 주세요.");
		setTimeout(function(){               
			f.hp.focus();             
		}, 10);
		return;
	}
}
