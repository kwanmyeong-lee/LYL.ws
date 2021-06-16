package board;

import java.sql.Timestamp;

public class BoardVO {
	private int boNo; /* ��ȣ */
	private String boTitle; /* ���� */
	private String boCon; /* ���� */
	private int boHits;  /* ��ȸ�� */
	private int boCom; /* ��ۼ� */
	private Timestamp boDate; /* �ۼ��� */
	private int boSec; /* ��б� ���� */
	private int userNo; /* ũ�������� */
	private int userNo2; /* �۾��� */
	private int boMyNo; /* ������������ �۹�ȣ */
	private int boStep; /* �Խñ� �ܰ� */
	private int boSort;/* �Խñ� ���� ��ȣ */
	private int boGroupNo; /* �Խñ� �׷��ȣ */
	
	
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int boNo, String boTitle, String boCon, int boHits, int boCom, Timestamp boDate, int boSec,
			int userNo, int userNo2, int boMyNo, int boStep, int boSort, int boGroupNo) {
		super();
		this.boNo = boNo;
		this.boTitle = boTitle;
		this.boCon = boCon;
		this.boHits = boHits;
		this.boCom = boCom;
		this.boDate = boDate;
		this.boSec = boSec;
		this.userNo = userNo;
		this.userNo2 = userNo2;
		this.boMyNo = boMyNo;
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

	public int getBoSec() {
		return boSec;
	}

	public void setBoSec(int boSec) {
		this.boSec = boSec;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}

	public int getBoMyNo() {
		return boMyNo;
	}

	public void setBoMyNo(int boMyNo) {
		this.boMyNo = boMyNo;
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
