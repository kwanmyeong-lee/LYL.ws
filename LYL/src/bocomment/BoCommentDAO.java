package bocomment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;

public class BoCommentDAO {
	private ConnectionPoolMgr2 pool;
	
	public BoCommentDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	//조회
	public List<BoCommentVO> selectByBoComment(int boNo) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<BoCommentVO> list = new ArrayList<BoCommentVO>();
		try {
			conn=pool.getConnection();

			String sql="select * from BOARDCOMMENT where boNo=? order by bcDate";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, boNo);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int bcNo=rs.getInt("bcNo");
				String bcCom=rs.getString("bcCom");
				Timestamp bcDate=rs.getTimestamp("bcDate");
				int bcStep=rs.getInt("bcStep");
				int bcSort=rs.getInt("bcSort");
				int bcGroupNo=rs.getInt("bcGroupNo");
				int boNo1=rs.getInt("boNo");
				int userNo=rs.getInt("userNo");
				String userId=rs.getString("userId");
				
				BoCommentVO vo = new BoCommentVO(bcNo, bcCom, bcDate, bcStep, bcSort, bcGroupNo, boNo1, userNo, userId);
				list.add(vo);
			}
			System.out.println("게시글의 댓글 전체조회 list.size="+list.size()+", 매개변수 boNo"+boNo);
			
			return list;
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	//입력
	public int insertBoComment(BoCommentVO vo) throws SQLException {
		Connection conn= null;
		PreparedStatement ps=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="insert into BOARDCOMMENT(bcNo, bcCom, bcDate, bcStep, bcSort, bcGroupNo, boNo, userNo, userId)"
					+ " values(boardcomment_seq.nextval, ?, default, default, default, 1, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getBcCom());
			ps.setInt(2, vo.getBoNo());
			ps.setInt(3, vo.getUserNo());
			ps.setString(4, vo.getUserId());
			
			int cnt = ps.executeUpdate();
			System.out.println("댓글입력조회 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
	}
	
	//삭제
	public int deleteBoComment(String userId, int bcNo, int boNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="delete from BOARDCOMMENT"
					+ " where boNo=? and bcNo=? and userId like '%' || ? || '%'";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, boNo);
			ps.setInt(2, bcNo);
			ps.setString(3, userId);
			
			int cnt = ps.executeUpdate();
			System.out.println("댓글 삭제 결과 cnt="+cnt+", 매개변수 userId="+userId+", bcNo="+bcNo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
	}
}
