package src.subscribe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.ConnectionPoolMgr2;

public class subscribeDAO {
	private ConnectionPoolMgr2 pool;
	
	public subscribeDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int subscribe(String userNo2, String userNo ) throws SQLException {
		//userNo2 크리에이터
		Connection conn =null;
		PreparedStatement ps = null;
		
		try {
			conn= pool.getConnection();
			String sql = "insert into SUBSCRIB(userNo2, userNo) values(?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo2);
			ps.setString(2, userNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("구독 결과 = "+cnt+"매개변수="+userNo2+userNo);
			return cnt;
		}finally{
			pool.dbClose(ps, conn);
		}
	}
}
