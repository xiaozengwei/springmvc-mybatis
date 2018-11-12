package com.xiao.dao;

import java.util.HashMap;
import java.util.List;

import com.xiao.entity.Identity;
import com.xiao.entity.User;

public interface Dao {
	public User checkUser(User user);
	public List<User>selectAllUsers();
	public void updateUser1(HashMap<String, Object>user);
	public void updateUser(User user);
	public void deleteUser(int id);
	public void createUser(User user);
	public User selectById(int id);
	public List<Identity> selectAllIdentity();
}
