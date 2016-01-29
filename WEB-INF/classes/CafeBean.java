package tnoorim;

/* 카페 등록 */
public class CafeBean {
	private String cafe_name;	// 카페명
	private String cafe_branch;	// 카페 지점
	private String address;		// 카페 주소
	private String time;		// 카페 영업시간
	private String cafe_tel;	// 카페 전화번호
	private String passwd;		// 패스워드
	private String cafe_img;	// 카페 로고

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public void setCafe_branch(String cafe_branch) {
		this.cafe_branch = cafe_branch;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setCafe_tel(String cafe_tel) {
		this.cafe_tel = cafe_tel;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setCafe_img(String cafe_img) {
		this.cafe_img = cafe_img;
	}

	public String getCafe_name() {
		return cafe_name;
	}
	public String getCafe_branch() {
		return cafe_branch;
	}
	public String getAddress() {
		return address;
	}
	public String getTime() {
		return time;
	}
	public String getCafe_tel() {
		return cafe_tel;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getCafe_img() {
		return cafe_img;
	}
}