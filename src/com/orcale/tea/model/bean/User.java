package com.orcale.tea.model.bean;

	
	public class User {
		
		private int userid;
		private String username;
		private String password;
		private String nickname;
		private String xingmiang;
		private String email;
		private int sex;
		private String image;
		private String phonenumber;
		private String userlevel;
		
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		public String getXingmiang() {
			return xingmiang;
		}
		public void setXingmiang(String xingmiang) {
			this.xingmiang = xingmiang;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getSex() {
			return sex;
		}
		public void setSex(int sex) {
			this.sex = sex;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public String getPhonenumber() {
			return phonenumber;
		}
		public void setPhonenumber(String phonenumber) {
			this.phonenumber = phonenumber;
		}
		public String getUserlevel() {
			return userlevel;
		}
		public void setUserlevel(String userlevel) {
			this.userlevel = userlevel;
		}
		public User(int userid, String username, String password, String nickname,String xingmiang, String email, int sex,
				String image, String phonenumber,String userlevel) {
			super();
			this.userid = userid;
			this.username = username;
			this.password = password;
			this.nickname = nickname;
			this.xingmiang = xingmiang;
			this.email = email;
			this.sex = sex;
			this.image = image;
			this.phonenumber = phonenumber;
			this.userlevel = userlevel;
			
		}
		public User() {
			super();
		}
		@Override
		public String toString() {
			return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", nickname="
					+ nickname + ", xingmiang=" + xingmiang + ", email=" + email + ", sex=" + sex + ", image=" + image
					+ ", phonenumber=" + phonenumber + ", userlevel=" + userlevel + "]";
		}
		
		

	}



