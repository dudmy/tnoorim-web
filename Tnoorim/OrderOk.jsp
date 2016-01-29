<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="tnoorim.*, java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.google.android.gcm.server.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="buyMgr" class="tnoorim.BuyMgr" />
<jsp:useBean id="memberBean" class="tnoorim.MemberBean" />
<jsp:useBean id="memberMgr" class="tnoorim.MemberMgr" />

<%
	String buy_id = request.getParameter("buyId");
	String buy_phone = request.getParameter("buyPhone");
	String buy_date = request.getParameter("buyDate");

	boolean is_push = true;

	ArrayList<String> regid = new ArrayList<String>();

	Vector memberList;
	int memberSize;
%>

<%
	buyMgr.isPayOk(Integer.parseInt(buy_id));

	is_push = buyMgr.isPush(buy_phone, buy_date);

	if(!is_push) {
		memberList = memberMgr.getRegid(buy_phone);
		memberSize = memberList.size();

		for(int i=0; i<memberSize; i++) {
			memberBean = (MemberBean)memberList.elementAt(i);

			regid.add(memberBean.getRegid());
		}
	}
%>

<%
	/* 푸시 */
	boolean SHOW_ON_IDLE = false;	// 기기가 활성화 상태일 때 보여줄 것인지
	int LIVE_TIME = 1;		// 기기가 비활성화 상태일 때 GCM가 메시지를 유효화하는 시간
	int RETRY = 2;			// 메시지 전송 실패 시 재시도 횟수

	String simpleApiKey = "AIzaSyAHQZV5x5Z9q_Eqt5xj6Yi2FZHTb3NjGBA"; // 개발자 콘솔에서 가져온 서버 키
	String gcmURL = "https://android.googleapis.com/gcm/send";

	String t1 = "메뉴 제작완료";
	String m1 = "주문하신 메뉴가 제작되었습니다.\n카운터에서 픽업하세요!";

	try {
		String title = URLEncoder.encode(t1, "EUC-KR");
		String msg = URLEncoder.encode(m1, "EUC-KR");

		Sender sender = new Sender(simpleApiKey);

		Message message = new Message.Builder()
		.collapseKey("demo")
		.delayWhileIdle(SHOW_ON_IDLE)
		.timeToLive(LIVE_TIME)
		.addData("message", msg)
		.addData("title", title)
		.build();

		MulticastResult result1 = sender.send(message, regid, RETRY);

		if(result1 != null) {
			List<Result> resultList = result1.getResults();

			for(Result result : resultList) {
				System.out.println(result.getErrorCodeName());
			}
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

<script>
	parent.opener.location.reload();

	self.close();
</script>