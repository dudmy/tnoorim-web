package tnoorim;

import java.sql.*;
import java.util.*;

public class MenuMgr {
	private DBConnectionMgr pool = null;

	public MenuMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error: 커넥션 가져오기 실패!");
		}
	}

	/* 메뉴 등록과 관련된 것은 나중에 추가하게 되면 고려 */

	/* 메뉴 가져오기, 해당 카페에 맞는 */
	public Vector getMenuList(String cafe_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select distinct menu_name from menu where cafe_name=? order by menu_name asc";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, cafe_name);

			rs = pstmt.executeQuery();

			if(rs != null) {
				while(rs.next()) {
					MenuBean menuBean = new MenuBean();

					menuBean.setMenu_name(rs.getString("menu_name"));

					localVector.addElement(menuBean);
				}
			}

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return localVector;
	}
}