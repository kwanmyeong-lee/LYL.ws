package video;

import db.ConnectionPoolMgr2;

public class VideoDAO {
	ConnectionPoolMgr2 pool;
		
	VideoDAO(){
		pool= new ConnectionPoolMgr2();
	}
	
	
}
