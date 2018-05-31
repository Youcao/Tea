package com.orcale.tea.model.daoImp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.orcale.tea.model.bean.User;
import com.orcale.tea.model.dao.UserDAO;





public class UserDAOImp extends BaseDAOImp implements UserDAO {

	@Override
	public boolean add(Object o) {
		User user=(User)o;
		boolean result=false;
		Statement  sta=null;
		try {
			sta=getSta();
			int count=sta.executeUpdate
					("insert into  user_table(userid,username,password,nickname,email)   values(null,'"+user.getUsername()+"','"+user.getPassword()+"','"+user.getNickname()+"','"+user.getEmail()+"')");
			result=(count>0)?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean delete(Object id) {
		
		return false;
	}

	@Override
	public boolean update(Object o) {
		User u=(User)o;
		PreparedStatement  preSta=null;
		int result=0;
		try {
			  preSta=getPreSta("update user_table set nickname=?,xingmiang=?,sex=?,email=?,image=?,phonenumber=? where userid=?");
			  //preSta.setString(1, u.getUsername());
			  preSta.setString(1, u.getNickname());
			  preSta.setString(2, u.getXingmiang());
			  preSta.setInt(3, u.getSex());
			  preSta.setString(4, u.getEmail());
			  preSta.setString(5, u.getImage());
			  preSta.setString(6, u.getPhonenumber());
			  //preSta.setString(7, u.getUserlevel());
			  preSta.setInt(7, u.getUserid());
			  result=preSta.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result>0?true:false;
	}

	@Override
	public Object list() {
		
		return null;
	}

	@Override
	public User login(String username, String password) {
		User  user=null;
		PreparedStatement  sta=null;
		ResultSet rs=null;
		try {
			  sta=getPreSta("select *  from user_table where username=? and password=?");
			sta.setString(1, username);
			sta.setString(2, password);
			rs=sta.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setNickname(rs.getString("nickname"));
				user.setXingmiang(rs.getString("xingmiang"));
				user.setSex(rs.getInt("sex"));				
				user.setEmail(rs.getString("email"));
				user.setImage(rs.getString("image"));	
				user.setPhonenumber(rs.getString("phonenumber"));
				user.setUserlevel(rs.getString("userlevel"));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public User getUserInfoByUserId(int userid) {
		User  user=null;
		PreparedStatement  sta=null;
		ResultSet rs=null;
		try {
			  sta=getPreSta("select *  from user_table where userid=?");
			sta.setInt(1, userid);
			rs=sta.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setUserid(rs.getInt("userid"));
				//user.setUsername(rs.getString("username"));
				//user.setPassword(rs.getString("password"));	
				user.setNickname(rs.getString("nickname"));
				user.setXingmiang(rs.getString("xingmiang"));
				user.setSex(rs.getInt("sex"));			
				user.setEmail(rs.getString("email"));
				user.setImage(rs.getString("image"));
				user.setPhonenumber(rs.getString("phonenumber"));
				user.setUserlevel(rs.getString("userlevel"));
						
						
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;	}

	@Override
	public boolean checkUserExsit(String username) {
		boolean result=false;
		Statement  sta=null;
		try {
			sta=getSta();
			ResultSet  rs=sta.executeQuery("select  count(userid)  from  user_table where username='"+username+"'");
			rs.next();
			result=(rs.getInt(1)>0)?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
