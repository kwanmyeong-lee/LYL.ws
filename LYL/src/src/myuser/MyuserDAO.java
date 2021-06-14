package src.myuser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import db.ConnectionPoolMgr2;

public class MyuserDAO {
	private ConnectionPoolMgr2 pool;

	MyuserDAO() {
		pool = new ConnectionPoolMgr2();
	}

	public MyuserVO selectMyuser(String userid) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = pool.getConnection();
			String sql = "select * from myuser\r\n" + "where userid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);

			MyuserVO vo = null;
			rs = ps.executeQuery();
			if (rs.next()) {
				int userNo = rs.getInt("userNo");
				String userId = rs.getString("userId");
				String userPwd = rs.getString("userPwd");
				String userName = rs.getString("userName");
				int userPhone = rs.getInt("userPhone");
				String userEmail = rs.getString("userEmail");
				Timestamp userJoin = rs.getTimestamp("userJoin");
				int userSub = rs.getInt("userSub");
				String userImg = rs.getString("userImg");

				vo = new MyuserVO(userNo, userId, userPwd, userName, userPhone, userEmail, userJoin, userSub, userImg);
			}
			System.out.println("select 결과 = " + vo + "매개변수=" + userid);
			return vo;

		} finally {
			pool.dbClose(rs, ps, conn);
		}

	}
}
