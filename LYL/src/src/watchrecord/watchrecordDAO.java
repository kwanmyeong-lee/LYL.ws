package src.watchrecord;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;

public class watchrecordDAO {
	private ConnectionPoolMgr2 pool;
	
	public watchrecordDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertWatchrecord(String userNo, String vidNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn= pool.getConnection();
			String sql = "insert into WATCHRECORD(userNo, vidNo) values(?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setString(2, vidNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("시청기록 insert 결과 = "+cnt+"매개변수 ="+userNo+vidNo);
			return cnt;
			
		}finally {
			pool.dbClose(ps, conn);
		}
	}
	public List<watchrecordVO> selectAllByUserNo(String userNo, int rowcnt) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<watchrecordVO> list =new ArrayList<watchrecordVO>();
		try {
			conn = pool.getConnection();
			
			String sql = "select * from \r\n"
					+ "(select  ad.*, rownum as rowcnt from\r\n"
					+ "(select * from WATCHRECORD where userno=? order by watchdate desc)ad)\r\n"
					+ "where rowcnt>? and rowcnt<=?";
			
			
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setInt(2, rowcnt);
			ps.setInt(3, rowcnt+5);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				watchrecordVO vo = new watchrecordVO();
				vo.setUserNo(rs.getInt(1));
				vo.setVidNo(rs.getInt(2));
				vo.setWatchDate(rs.getTimestamp(3));
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
}
