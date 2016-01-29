package tnoorim;

import java.sql.*;
import java.util.*;

public class MemberMgr {
	private DBConnectionMgr pool = null;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error: 커넥션 가져오기 실패!");
		}
	}

	/* 기기 ID, 해당 휴대폰에 맞는 */
	public Vector getRegid(String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select regid from member where phone=?";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, phone);

			rs = pstmt.executeQuery();

			if(rs != null) {
				while(rs.next()) {
					MemberBean memberBean = new MemberBean();

					memberBean.setRegid(rs.getString("regid"));

					localVector.addElement(memberBean);
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