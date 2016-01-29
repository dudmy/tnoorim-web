package tnoorim;

import java.sql.*;
import java.util.*;

public class VisitorMgr {
	private DBConnectionMgr pool = null;

	public VisitorMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error: 커넥션 가져오기 실패!");
		}
	}

	/* 실시간 사용자 리스트 */
	public Vector getVisitorList(String cafe_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select v.phone from visitor v, beacon b where b.bd_address=v.bd_address and b.cafe_name=?";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, cafe_name);

			rs = pstmt.executeQuery();

			if(rs != null) {
				while(rs.next()) {
					VisitorBean visitorBean = new VisitorBean();

					visitorBean.setPhone(rs.getString("phone"));
					//visitorBean.setBd_address(rs.getString("bd_address"));

					localVector.add(visitorBean);
				}
			}

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return localVector;
	}

	/* 통계, 주문한 음료 Top */
	public Vector visitorDrink(String cafe_name, String cafe_branch, String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select menu_name, Count(date) As count from buy where cafe_name=? and cafe_branch=? and is_pay='2' and phone=? group by menu_name";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, cafe_name);
			pstmt.setString(2, cafe_branch);
			pstmt.setString(3, phone);

			rs = pstmt.executeQuery();

			ResultSetMetaData md = rs.getMetaData();

			int columnCount = md.getColumnCount();

			if(rs != null) {
				while(rs.next()) {
					for(int i=1; i<=columnCount; i++) {
						localVector.add(rs.getString(i));
					}
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