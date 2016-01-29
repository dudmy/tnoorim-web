package tnoorim;

/* 이벤트 */
public class EventBean {
	private int event_id;		// 이벤트 아이디
	private String event_name;	// 이벤트명
	private String cafe_name;	// 카페명
	private String event_info;	// 이벤트 설명
	private String menu_name;	// 메뉴명
	private int price;		// 메뉴 가격
	private String startday;	// 시작일
	private String endday;		// 종료일

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public void setEvent_info(String event_info) {
		this.event_info = event_info;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}

	public int getEvent_id() {
		return event_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public String getEvent_info() {
		return event_info;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public int getPrice() {
		return price;
	}
	public String getStartday() {
		return startday;
	}
	public String getEndday() {
		return endday;
	}
}