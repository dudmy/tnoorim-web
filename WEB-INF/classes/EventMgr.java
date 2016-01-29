package tnoorim;

import java.sql.*;
import java.util.*;

public class EventMgr {
	private DBConnectionMgr pool = null;

	public EventMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error: Ŀ�ؼ� �������� ����!");
		}
	}

	/* �̺�Ʈ ����Ʈ, ������ �� */ /* ��¥�� ���� ���� ���� ȸ������ ó���� �� */
	public Vector getEventList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector localVector = new Vector();

		try {
			con = pool.getConnection();
			String strQuery = "select * from event order by endday asc";
			pstmt = con.prepareStatement(strQuery);

			rs = pstmt.executeQuery();

			if(rs != null) {
				while(rs.next()) {
					EventBean eventBean = new EventBean();

					eventBean.setEvent_id(rs.getInt("event_id"));
					eventBean.setEvent_name(rs.getString("event_name"));
					eventBean.setCafe_name(rs.getString("cafe_name")); 
					eventBean.setEvent_info(rs.getString("event_info"));
					eventBean.setMenu_name(rs.getString("menu_name"));
					eventBean.setPrice(rs.getInt("price"));
					eventBean.setStartday(rs.getString("startday"));
					eventBean.setEndday(rs.getString("endday"));

					localVector.add(eventBean);
				}
			}

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return localVector;
	}

	/* �̺�Ʈ ���, id �ڵ� �Է� */
	public boolean eventInsert(EventBean eventBean, String cafe_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		boolean flag = false;

		try {
			con = pool.getConnection();
			String strQuery = "insert into event"
					+ "(event_name, cafe_name, event_info, menu_name, price, startday, endday) "
					+ "values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(strQuery);

			pstmt.setString(1, eventBean.getEvent_name());
			pstmt.setString(2, cafe_name);
			pstmt.setString(3, eventBean.getEvent_info());
			pstmt.setString(4, eventBean.getMenu_name());
			pstmt.setInt(5, eventBean.getPrice());
			pstmt.setString(6, eventBean.getStartday());
			pstmt.setString(7, eventBean.getEndday());

			int count = pstmt.executeUpdate();

			if(count > 0) {
				flag = true;
			}

		} catch(Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return flag;
	}
}