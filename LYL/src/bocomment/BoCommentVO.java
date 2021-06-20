package bocomment;

import java.sql.Timestamp;

public class BoCommentVO {
	private int bcNo; /* ��� ��ȣ */
	private String bcCom; /* ���� */
	private Timestamp bcDate; /* ��¥ */
	private int bcRe; /* ��ۼ� */
	private int bcLike; /* ���ƿ� */
	private int bcPwd; /* ��й�ȣ */
	private int bcStep; /* ��� �ܰ� */
	private int bcSort; /* ��� ���� ��ȣ */
	private int bcGroupNo; /* ��� �׷� ��ȣ */
	private int boNo; /* �Խ��ǹ�ȣ */
	private int userNo; /* ũ�������� */
	private String userId; /* �۾��� */
	
	public BoCommentVO() {
		super();
	}
	
	public BoCommentVO(int bcNo, String bcCom, Timestamp bcDate, int bcRe, int bcLike, int bcPwd, int bcStep,
			int bcSort, int bcGroupNo, int boNo, int userNo, String userId) {
		this.bcNo = bcNo;
		this.bcCom = bcCom;
		this.bcDate = bcDate;
		this.bcRe = bcRe;
		this.bcLike = bcLike;
		this.bcPwd = bcPwd;
		this.bcStep = bcStep;
		this.bcSort = bcSort;
		this.bcGroupNo = bcGroupNo;
		this.boNo = boNo;
		this.userNo = userNo;
		this.userId = userId;
	}

	public int getBcNo() {
		return bcNo;
	}

	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}

	public String getBcCom() {
		return bcCom;
	}

	public void setBcCom(String bcCom) {
		this.bcCom = bcCom;
	}

	public Timestamp getBcDate() {
		return bcDate;
	}

	public void setBcDate(Timestamp bcDate) {
		this.bcDate = bcDate;
	}

	public int getBcRe() {
		return bcRe;
	}

	public void setBcRe(int bcRe) {
		this.bcRe = bcRe;
	}

	public int getBcLike() {
		return bcLike;
	}

	public void setBcLike(int bcLike) {
		this.bcLike = bcLike;
	}

	public int getBcPwd() {
		return bcPwd;
	}

	public void setBcPwd(int bcPwd) {
		this.bcPwd = bcPwd;
	}

	public int getBcStep() {
		return bcStep;
	}

	public void setBcStep(int bcStep) {
		this.bcStep = bcStep;
	}

	public int getBcSort() {
		return bcSort;
	}

	public void setBcSort(int bcSort) {
		this.bcSort = bcSort;
	}

	public int getBcGroupNo() {
		return bcGroupNo;
	}

	public void setBcGroupNo(int bcGroupNo) {
		this.bcGroupNo = bcGroupNo;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
