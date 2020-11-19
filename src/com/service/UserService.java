package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.User;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	
	
	public List<User> findAll(){
		return userDao.findAll();
	}

	public User getOne(Integer id) {
		return userDao.getOne(id);
	}
	
	public void addorupdate(User user) {
		userDao.addorupdate(user);
	}
	public void remove(Integer id) {
		userDao.remove(id);
	}
}
