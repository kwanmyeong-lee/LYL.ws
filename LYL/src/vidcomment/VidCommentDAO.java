package vidcomment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionPoolMgr2;

public class VidCommentDAO {
	ConnectionPoolMgr2 pool;
	
	public VidCommentDAO() {
		pool= new ConnectionPoolMgr2();
	}
	
	public VidCommentVO sellectComment(int vidNo,int vidComCnt) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = pool.getConnection();
			
			String sql = "select * from mycomment where vidno=? and comgroup is null";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vidNo);

			

			rs=ps.executeQuery();
			VidCommentVO vcvo=new VidCommentVO();
			while(rs.next()) {
				vcvo.setComNo(rs.getInt(1));
				vcvo.setComCon(rs.getString(2));
				vcvo.setComDate(rs.getTimestamp(3));
				vcvo.setComRe(rs.getInt(4));
				vcvo.setComRe(rs.getInt(5));
				vcvo.setComRe(rs.getInt(6));
				vcvo.setComRe(rs.getInt(7));
				vcvo.setComRe(rs.getInt(8));
				vcvo.setComRe(rs.getInt(9));
				vcvo.setComRe(rs.getInt(10));
			}
			return vcvo;
		
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
}
