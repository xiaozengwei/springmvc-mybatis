package com.xiao.service.imp;

import java.util.HashMap;

import java.util.List;

import javax.annotation.Resource;

import org.apache.coyote.http11.filters.VoidInputFilter;
import org.springframework.stereotype.Service;

import com.xiao.dao.Dao;
import com.xiao.entity.Identity;
import com.xiao.entity.User;
import com.xiao.service.IService;


@Service
public class ServiceImp implements IService {
	@Resource
	private Dao dao;

	public User checkUser(User user) {
		User u=null;
		u=dao.checkUser(user);
		return u;
	}

	public List<User> selectAllUsers() {
		List<User>u=null;
		u=dao.selectAllUsers();
		return u;
	}

	public void updateUser1(HashMap<String, Object> user) {
		dao.updateUser1(user);
	}

	public void updateUser(User user) {
		dao.updateUser(user);
	}
	public void deleteUser(int id) {
		dao.deleteUser(id);
	}

	public void createUser(User user) {
		dao.createUser(user);
	}
	
	public List<Identity> selectAllIdentity(){
		List<Identity> allIdentity=null;
		allIdentity=dao.selectAllIdentity();
		return allIdentity;
	}
}
