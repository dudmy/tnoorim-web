package tnoorim;

/* ī�亰 �޴� */
public class MenuBean {
	private String cafe_name;	// ī���
	private String menu_name;	// �޴���
	private String category;	// �޴� �з�
	private int price;		// �޴� ����
	private String info;		// �޴� ����
	private String menu_img;	// �޴� ����

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}

	public String getCafe_name() {
		return cafe_name;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public String getCategory() {
		return category;
	}
	public int getPrice() {
		return price;
	}
	public String getInfo() {
		return info;
	}
	public String getMenu_img() {
		return menu_img;
	}
}