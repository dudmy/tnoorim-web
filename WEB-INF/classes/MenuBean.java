package tnoorim;

/* 카페별 메뉴 */
public class MenuBean {
	private String cafe_name;	// 카페명
	private String menu_name;	// 메뉴명
	private String category;	// 메뉴 분류
	private int price;		// 메뉴 가격
	private String info;		// 메뉴 설명
	private String menu_img;	// 메뉴 사진

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