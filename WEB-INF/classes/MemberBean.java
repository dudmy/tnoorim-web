package tnoorim;

/* 회원 */
public class MemberBean {
	private String phone; // 회원 번호
	private String regid; // 기기 ID

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setRegid(String regid) {
		this.regid = regid;
	}

	public String getPhone() {
		return phone;
	}
	public String getRegid() {
		return regid;
	}
}