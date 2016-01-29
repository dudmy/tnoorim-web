package tnoorim;

import java.sql.*;
import java.util.*;

public class BuyMgr {
	private DBConnectionMgr pool = null;

	public BuyMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error: Ŀ�ؼ� �������� ����!");
		}
	}

	/* �ֹ� ����Ʈ, ������ �͸� �ֹ��ð� �� */
	public Vector getBuyList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select * from buy where is_pay='1' order by date asc";
			pstmt = con.prepareStatement(strQuery);

			rs = pstmt.executeQuery();

			if(rs != null) {
				while(rs.next()) {
					BuyBean buyBean = new BuyBean();

					buyBean.setBuy_id(rs.getInt("buy_id"));
					buyBean.setPhone(rs.getString("phone"));
					buyBean.setCafe_name(rs.getString("cafe_name"));
					buyBean.setPrice(rs.getInt("price"));
					buyBean.setCafe_branch(rs.getString("cafe_branch"));
					buyBean.setMenu_name(rs.getString("menu_name"));
					buyBean.setDate(rs.getString("date"));
					buyBean.setBuy_option(rs.getString("buy_option"));
					buyBean.setIs_pay(rs.getInt("is_pay"));

					localVector.add(buyBean);
				}
			}

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return localVector;
	}

	/* �ֹ� �Ϸ�, is_pay �ʵ� ���� �Ϸ�(2)�� */ /* �ð��� �ȴٸ� üũ�ڽ��� ����Ͽ� �������� �Ϸ��� �� �ֵ��� */
	public void isPayOk(int buy_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			String strQuery = "update buy set is_pay='2' where buy_id=?";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setInt(1, buy_id);

			pstmt.executeUpdate();

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	/* Ǫ�� ������, �� ���� �ֹ��� ��� ���ᰡ ���۵��� ��� */
	public boolean isPush(String phone, String date) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		boolean flag = false;

		try {
			con = pool.getConnection();
			String strQuery = "select * from buy where is_pay='1' and phone=? and date=?";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, phone);
			pstmt.setString(2, date);

			rs = pstmt.executeQuery();

			flag = rs.next();

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return flag;
	}

	/* ���, �Ǹ� ���� */
	public Vector bestDrink(String cafe_name, String cafe_branch) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select DATE_FORMAT(date, '%Y.%m.%d') date, Count(date) As count from buy where cafe_name=? and cafe_branch=? and is_pay=2 group by DATE_FORMAT(date, '%Y.%m.%d')";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, cafe_name);
			pstmt.setString(2, cafe_branch);

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

	/* ���, �Ǹž� */
	public Vector priceDrink(String cafe_name, String cafe_branch) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select DATE_FORMAT(date, '%Y.%m.%d') date, Sum(price)/1000 As price from buy where cafe_name=? and cafe_branch=? and is_pay='2' group by DATE_FORMAT(date, '%Y.%m.%d')";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, cafe_name);
			pstmt.setString(2, cafe_branch);

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