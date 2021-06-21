package commentlike;

import db.ConnectionPoolMgr2;

public class CommentLikeDAO {
	ConnectionPoolMgr2 pool;

	public CommentLikeDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int comLikeCheck() {
		return 0;
	}
}
