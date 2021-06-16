package vidcomment;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
				vcvo.setComLike(rs.getInt(4));
				vcvo.setComSec(rs.getInt(5));
				vcvo.setVidNo(rs.getInt(6));
				vcvo.setUserNo(rs.getInt(7));
				vcvo.setComStep(rs.getInt(8));
				vcvo.setComSort(rs.getInt(9));
				vcvo.setComGroup(rs.getInt(10));
			}
			return vcvo;
		
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	
	
}
