package tnoorim;

/* �ֹ� �� ��� */
public class BuyBean {
	private int buy_id;		// �ֹ� �� ��� ���̵�
	private String phone;		// ȸ�� ��ȣ
	private String cafe_name;	// ī���
	private String cafe_branch;	// ī�� ����
	private String menu_name;	// �޴���
	private int price;		// �޴� ����
	private String date;		// �ֹ� �ð�
	private String buy_option;	// �ֹ� �ɼ�
	private int is_pay;		// ���, ����, �Ϸ�

	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public void setCafe_branch(String cafe_branch) {
		this.cafe_branch = cafe_branch;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setBuy_option(String buy_option) {
		this.buy_option = buy_option;
	}
	public void setIs_pay(int is_pay) {
		this.is_pay = is_pay;
	}

	public int getBuy_id() {
		return buy_id;
	}
	public String getPhone() {
		return phone;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public String getCafe_branch() {
		return cafe_branch;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public int getPrice() {
		return price;
	}
	public String getDate() {
		return date;
	}
	public String getBuy_option() {
		return buy_option;
	}
	public int getIs_pay() {
		return is_pay;
	}
}