/* Login.jsp */
function loginCheck() {
	if(document.login.password.value == "") {
		alert("비밀번호를 입력하세요.");
		document.login.passwd.focus();

		return;
	}

	document.login.submit();
}


/* window open */
function winOpen() {
	cw = screen.availWidth; // 화면 넓이
	ch = screen.availHeight; // 화면 높이

	sw = 300; // 띄울 창의 넓이
	sh = 150; // 띄울 창의 높이

	ml = (cw-sw)/2; // 가운데 띄우기 위한 창의 x위치
	mt = (ch-sh)/2; // 가운데 띄우기 위한 창의 y위치

	window.open("url", "_blank", "width="+sw+", height="+sh+", top="+mt+", left="+ml+", resizable=no, scrollbars=yes");
}


/* Event.jsp */
function eventCheck() {
	if(document.event.event_name.value == "") {
		alert("제목을 입력하세요.");
		document.post.subject.focus();

		return;
	}

	if(document.event.event_info.value == "") {
		alert("설명을 입력하세요.");
		document.post.content.focus();

		return;
	}

	document.event.submit();
}


/* window close */
function winClose() {
	self.close();
}