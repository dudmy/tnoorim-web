package tnoorim;

import java.sql.*;
import java.util.*;

public class MenuMgr {
	private DBConnectionMgr pool = null;

	public MenuMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error: Ŀ�ؼ� �������� ����!");
		}
	}

	/* �޴� ��ϰ� ���õ� ���� ���߿� �߰��ϰ� �Ǹ� ��� */

	/* �޴� ��������, �ش� ī�信 �´� */
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