package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;

public class BoardDAO {
	private ConnectionPoolMgr2 pool;
	
	public BoardDAO() {
		pool=new ConnectionPoolMgr2();
	}	
	
	public List<BoardVO> selectBoard(int userNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			conn=pool.getConnection();
			
			String sql="select * from myboard where userNo=? order by boNo desc";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, userNo);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int boNo=rs.getInt("boNo");
				String boTitle=rs.getString("boTitle");
				String boCon=rs.getString("boCon");
				int boHits=rs.getInt("boHits");
				int boCom=rs.getInt("boCom");
				Timestamp boDate=rs.getTimestamp("boDate");
				int boPwd=rs.getInt("boPwd");
				int userNo1=rs.getInt("userNo");
				String userId=rs.getString("userId");
				int boStep=rs.getInt("boStep");
				int boSort=rs.getInt("boSort");
				int boGroupNo=rs.getInt("boGroupNo");
				
				BoardVO vo = new BoardVO(boNo, boTitle, boCon, boHits, boCom, boDate, boPwd, userNo1, userId, boStep, boSort, boGroupNo);
				list.add(vo);
			}
			
			return list;
		} finally {
			pool.dbClose(rs, ps, conn);
		}
		
	}
	
	public int insertBoard(BoardVO vo, int userNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;

		try {
			//1,2 conn
			conn=pool.getConnection();
			//3 ps
			//insert into myboard(boNo, boTitle, boCon, boPwd, boDate, boHits, boCom, boStep, boSort, boGroupno, UserId, userNo)
			//values(myboard_seq.nextval, '�����Դϴ�', '�����Դϴ�.', '0', default, default, default, default, default,1 ,'yooh' ,1)
			String sql="insert into myboard(boNo, boTitle, boCon, boPwd, boDate, boHits, boCom, boStep, boSort, boGroupno, UserId, userNo)"
					+ "values(myboard_seq.nextval, ?, ?, ?, default, default, default, default, default, 1 ,? ,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getBoTitle());
			ps.setString(2, vo.getBoCon());
			ps.setInt(3, vo.getBoPwd());
			ps.setString(4, vo.getUserId());
			ps.setInt(5, userNo);
			
			//4 exec
			int cnt=ps.executeUpdate();
			System.out.println("�۾��� ���, cnt="+cnt+", �Ű����� vo="+vo+", userNo="+userNo);

			return cnt;
		}finally {
			pool.dbClose(ps, conn);
		}
	}
	
	public BoardVO selectByNo(int boNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		BoardVO vo = new BoardVO();
		try {
		 conn=pool.getConnection();
		 
		 String sql="select * from myboard where boNo=?";
		 ps=conn.prepareStatement(sql);
		 ps.setInt(1, boNo);
		 
		 rs=ps.executeQuery();
		 if(rs.next()) {
			 vo.setBoNo(boNo);
			 vo.setBoCon(rs.getString("boCon"));
			 vo.setBoTitle(rs.getString("boTitle"));
			 vo.setUserId(rs.getString("userId"));
			 vo.setBoDate(rs.getTimestamp("boDate"));
		 }
		 System.out.println("�ۻ���ȸ ���, vo="+vo+", �Ű����� no="+boNo);
		 return vo;
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	public int updateReadCount(int boNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;

		try {
			conn=pool.getConnection();

			String sql="update myboard"
					+ " set boHits=boHits+1"
					+ " where boNo=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, boNo);

			int cnt=ps.executeUpdate();
			System.out.println("��ȸ�� ���� ��� cnt="+cnt+", �Ű����� boNo="+boNo);

			return cnt;
		}finally {
			pool.dbClose(ps, conn);
		}
	}
	
	public int deleteBoard(int boNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="delete from myboard"
					+ " where boNo=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, boNo);
			
			int cnt=ps.executeUpdate();
			System.out.println("���� ��� ��ȸ cnt="+cnt+", �Ű����� boNo="+boNo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
	}
	
	//�۾�
	public int editBoard(BoardVO vo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="update myboard"
					+ " set boTitle=?, boCon=?"
					+ " where boNo=? and userId like '%' || ? || '%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getBoTitle());
			ps.setString(2, vo.getBoCon());
			ps.setInt(3, vo.getBoNo());
			ps.setString(4, vo.getUserId());
			
			int cnt=ps.executeUpdate();
			System.out.println("======�ۼ��� ��� cnt="+cnt+", �Ű����� vo="+vo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
		
	}
}
