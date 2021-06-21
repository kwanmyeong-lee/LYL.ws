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
	
	//��ȸ
	public List<BoCommentVO> selectByBoComment(int boNo) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<BoCommentVO> list = new ArrayList<BoCommentVO>();
		try {
			conn=pool.getConnection();

			String sql="select * from BOARDCOMMENT where boNo=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, boNo);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int bcNo=rs.getInt("bcNo");
				String bcCom=rs.getString("bcCom");
				Timestamp bcDate=rs.getTimestamp("bcDate");
				int bcRe=rs.getInt("bcRe");
				int bcLike=rs.getInt("bcLike");
				int bcPwd=rs.getInt("bcPwd");
				int bcStep=rs.getInt("bcStep");
				int bcSort=rs.getInt("bcSort");
				int bcGroupNo=rs.getInt("bcGroupNo");
				int boNo1=rs.getInt("boNo");
				int userNo=rs.getInt("userNo");
				String userId=rs.getString("userId");
				
				BoCommentVO vo = new BoCommentVO(bcNo, bcCom, bcDate, bcRe, bcLike, bcPwd, bcStep, bcSort, bcGroupNo, boNo1, userNo, userId);
				list.add(vo);
			}
			System.out.println("�Խñ��� ��� ��ü��ȸ list.size="+list.size()+", �Ű����� boNo"+boNo);
			
			return list;
		} finally {
			pool.dbClose(rs, ps, conn);
		}
		
	}
	
	//�Է�
	public int insertBoComment(BoCommentVO vo) throws SQLException {
		Connection conn= null;
		PreparedStatement ps=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="insert into BOARDCOMMENT(bcNo, bcCom, bcDate, bcRe, bcLike, bcStep, bcSort, bcGroupNo, boNo, userNo, userId)"
					+ " values(boardcomment_seq.nextval, ?, default, default, default, default, default, ?, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getBcCom());
			ps.setInt(2, vo.getBcGroupNo());
			ps.setInt(3, vo.getBoNo());
			ps.setInt(4, vo.getUserNo());
			ps.setString(5, vo.getUserId());
			
			int cnt = ps.executeUpdate();
			System.out.println("����Է���ȸ cnt="+cnt+", �Ű����� vo="+vo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
		
		
	}
	
	//����
	public int deleteBoComment(String userId, int bcNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="delete from BOARDCOMMENT"
					+ " where bcNo=? and userId like '%' || ? || '%'";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bcNo);
			ps.setString(2, userId);
			
			int cnt = ps.executeUpdate();
			System.out.println("��� ���� ��� cnt="+cnt+", �Ű����� userId="+userId+", bcNo="+bcNo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
		
	}
}
