package com.orcale.tea.model.bean;

import java.io.Serializable;

public class product implements Serializable{
	 
		public product(int teaid) {
			super();
			this.teaid = teaid;
		}
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + teaid;
			return result;
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			product other = (product) obj;
			if (teaid != other.teaid)
				return false;
			return true;
		}
	private int teaid;
	private String teaname;
	private float shangchengjia;
	private float yuanjia;
	private float zhongliang;
	private String guige;
	private int youxiaoqi;
	private String chandi;
	private String pinpai;
	private String productdate;
	private String mainimag;
	
	public int getTeaid() {
		return teaid;
	}
	

	public void setTeaid(int teaid) {
		this.teaid = teaid;
	}
	public String getTeaname() {
		return teaname;
	}
	public void setTeaname(String teaname) {
		this.teaname = teaname;
	}
	public float getShangchengjia() {
		return shangchengjia;
	}
	public void setShangchengjia(float shangchengjia) {
		this.shangchengjia = shangchengjia;
	}
	public float getYuanjia() {
		return yuanjia;
	}
	public void setYuanjia(float yuanjia) {
		this.yuanjia = yuanjia;
	}
	public float getZhongliang() {
		return zhongliang;
	}
	public void setZhongliang(float zhongliang) {
		this.zhongliang = zhongliang;
	}
	public String getGuige() {
		return guige;
	}
	public void setGuige(String guige) {
		this.guige = guige;
	}
	public int getYouxiaoqi() {
		return youxiaoqi;
	}
	public void setYouxiaoqi(int youxiaoqi) {
		this.youxiaoqi = youxiaoqi;
	}
	public String getChandi() {
		return chandi;
	}
	public void setChandi(String chandi) {
		this.chandi = chandi;
	}
	public String getPinpai() {
		return pinpai;
	}
	public void setPinpai(String pinpai) {
		this.pinpai = pinpai;
	}
	public String getProductdate() {
		return productdate;
	}
	public void setProductdate(String productdate) {
		this.productdate = productdate;
	}
	public String getMainimag() {
		return mainimag;
	}
	public void setMainimag(String mainimag) {
		this.mainimag = mainimag;
	}
	public product(int teaid, String teaname, float shangchengjia, float yuanjia, float zhongliang, String guige,
			int youxiaoqi, String chandi, String pinpai, String productdate, String mainimag) {
		super();
		this.teaid = teaid;
		this.teaname = teaname;
		this.shangchengjia = shangchengjia;
		this.yuanjia = yuanjia;
		this.zhongliang = zhongliang;
		this.guige = guige;
		this.youxiaoqi = youxiaoqi;
		this.chandi = chandi;
		this.pinpai = pinpai;
		this.productdate = productdate;
		this.mainimag = mainimag;
	}
	
	
	public product() {
		super();
	}


	@Override
	public String toString() {
		return "product [teaid=" + teaid + ", teaname=" + teaname + ", shangchengjia=" + shangchengjia + ", yuanjia="
				+ yuanjia + ", zhongliang=" + zhongliang + ", guige=" + guige + ", youxiaoqi=" + youxiaoqi + ", chandi="
				+ chandi + ", pinpai=" + pinpai + ", productdate=" + productdate + ", mainimag=" + mainimag + "]";
	}
	
	
}
