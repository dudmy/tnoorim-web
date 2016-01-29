package tnoorim;

/* 실시간 사용자 */
public class VisitorBean {
	private String phone;		// 회원 번호
	private String bd_address;	// 비콘 주소

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setBd_address(String bd_address) {
		this.bd_address = bd_address;
	}

	public String getPhone() {
		return phone;
	}
	public String getBd_address() {
		return bd_address;
	}
}