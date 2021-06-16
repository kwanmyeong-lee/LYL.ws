package vidcomment;

import java.sql.SQLException;

public class VidCommentService {
	VidCommentDAO dao;

	public VidCommentService() {
		dao=new VidCommentDAO();
	}
	
	public VidCommentVO sellectComment(int vidNo,int vidComCnt) throws SQLException {
		return dao.sellectComment(vidNo, vidComCnt);
	}
}
