/* Login.jsp */
function loginCheck() {
	if(document.login.password.value == "") {
		alert("��й�ȣ�� �Է��ϼ���.");
		document.login.passwd.focus();

		return;
	}

	document.login.submit();
}


/* window open */
function winOpen() {
	cw = screen.availWidth; // ȭ�� ����
	ch = screen.availHeight; // ȭ�� ����

	sw = 300; // ��� â�� ����
	sh = 150; // ��� â�� ����

	ml = (cw-sw)/2; // ��� ���� ���� â�� x��ġ
	mt = (ch-sh)/2; // ��� ���� ���� â�� y��ġ

	window.open("url", "_blank", "width="+sw+", height="+sh+", top="+mt+", left="+ml+", resizable=no, scrollbars=yes");
}


/* Event.jsp */
function eventCheck() {
	if(document.event.event_name.value == "") {
		alert("������ �Է��ϼ���.");
		document.post.subject.focus();

		return;
	}

	if(document.event.event_info.value == "") {
		alert("������ �Է��ϼ���.");
		document.post.content.focus();

		return;
	}

	document.event.submit();
}


/* window close */
function winClose() {
	self.close();
}