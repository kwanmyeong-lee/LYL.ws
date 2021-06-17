package board;

import java.sql.Timestamp;

public class BoardVO {
	private int boNo; /* �Խ��ǹ�ȣ */
	private String boTitle; /* ���� */
	private String boCon; /* ���� */
	private int boHits; /* ��ȸ�� */
	private int boCom; /* ��ۼ� */
	private Timestamp boDate; /* �ۼ��� */
	private int boPwd; /* ��й�ȣ */
	private int userNo; /* ũ�������� */
	private String userId; /* �۾��� */
	private int boStep; /* �Խñ� �ܰ� */
	private int boSort; /* �Խñ� ���� ��ȣ */
	private int boGroupNo; /* �Խñ� �׷��ȣ */
	
	public BoardVO() {
		super();
	}

	public BoardVO(int boNo, String boTitle, String boCon, int boHits, int boCom, Timestamp boDate, int boPwd,
			int userNo, String userId, int boStep, int boSort, int boGroupNo) {
		super();
		this.boNo = boNo;
		this.boTitle = boTitle;
		this.boCon = boCon;
		this.boHits = boHits;
		this.boCom = boCom;
		this.boDate = boDate;
		this.boPwd = boPwd;
		this.userNo = userNo;
		this.userId = userId;
		this.boStep = boStep;
		this.boSort = boSort;
		this.boGroupNo = boGroupNo;
	}


	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public String getBoTitle() {
		return boTitle;
	}

	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}

	public String getBoCon() {
		return boCon;
	}

	public void setBoCon(String boCon) {
		this.boCon = boCon;
	}

	public int getBoHits() {
		return boHits;
	}

	public void setBoHits(int boHits) {
		this.boHits = boHits;
	}

	public int getBoCom() {
		return boCom;
	}

	public void setBoCom(int boCom) {
		this.boCom = boCom;
	}

	public Timestamp getBoDate() {
		return boDate;
	}

	public void setBoDate(Timestamp boDate) {
		this.boDate = boDate;
	}

	public int getBoPwd() {
		return boPwd;
	}

	public void setBoPwd(int boPwd) {
		this.boPwd = boPwd;
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

	public int getBoStep() {
		return boStep;
	}

	public void setBoStep(int boStep) {
		this.boStep = boStep;
	}

	public int getBoSort() {
		return boSort;
	}

	public void setBoSort(int boSort) {
		this.boSort = boSort;
	}

	public int getBoGroupNo() {
		return boGroupNo;
	}

	public void setBoGroupNo(int boGroupNo) {
		this.boGroupNo = boGroupNo;
	}
	
	
}
