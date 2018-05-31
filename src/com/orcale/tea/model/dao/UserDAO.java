package com.orcale.tea.model.dao;

import com.orcale.tea.model.bean.User;

public interface UserDAO extends BaseDAO {
	public User  login(String username,String password);
	public  User getUserInfoByUserId(int userid);
	public boolean checkUserExsit(String username);
}

