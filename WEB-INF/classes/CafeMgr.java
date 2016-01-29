package tnoorim;

import java.sql.*;
import java.util.*;

public class CafeMgr {
	private DBConnectionMgr pool = null;

	public CafeMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error: Ŀ�ؼ� �������� ����!");
		}
	}

	/* ī�� ��ϰ� ���õ� ���� ���߿� �߰��ϰ� �Ǹ� ��� */

	/* ī��� �������� */
	public Vector getCafeList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select distinct cafe_name from cafe order by cafe_name asc";
			pstmt = con.prepareStatement(strQuery);

			rs = pstmt.executeQuery();

			if(rs != null) {
				while(rs.next()) {
					CafeBean cafeBean = new CafeBean();

					cafeBean.setCafe_name(rs.getString("cafe_name"));

					localVector.add(cafeBean);
				}
			}

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return localVector;
	}

	/* ���� �������� */
	public Vector getBranchList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select distinct cafe_branch from cafe order by cafe_branch asc";
			pstmt = con.prepareStatement(strQuery);

			rs = pstmt.executeQuery();

			if(rs != null) {
				while(rs.next()) {
					CafeBean cafeBean = new CafeBean();

					cafeBean.setCafe_branch(rs.getString("cafe_branch"));

					localVector.add(cafeBean);
				}
			}

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return localVector;
	}

	/* �н����� Ȯ�� */
	public boolean loginCheck(String cafe_name, String cafe_branch, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		boolean loginCon = false;

		try {
			con = pool.getConnection();
			String strQuery = "select cafe_name, cafe_branch, passwd from cafe where cafe_name=? and cafe_branch=? and passwd=?";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, cafe_name);
			pstmt.setString(2, cafe_branch);
			pstmt.setString(3, passwd);

			rs = pstmt.executeQuery();

			loginCon = rs.next();

		} catch(Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return loginCon;
	}
}