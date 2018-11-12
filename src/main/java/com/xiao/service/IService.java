package com.xiao.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiao.entity.Identity;
import com.xiao.entity.User;

public interface IService {
	public User checkUser(User user);
	public List<User>selectAllUsers();
	public void updateUser1(HashMap<String, Object>user);
	public void updateUser(User user);
	public void deleteUser(int id);
	public void createUser(User user);
	public List<Identity> selectAllIdentity();
}
