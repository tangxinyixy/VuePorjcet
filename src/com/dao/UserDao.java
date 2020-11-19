package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.User;

@Repository
public class UserDao {
	static List<User> list = new ArrayList<User>();
	static Integer id=7;
	static {
		list.add(new User(1,"��·��","����"));
		list.add(new User(2,"�̲�","����"));
		list.add(new User(3,"������","����"));
		list.add(new User(4,"��Ƭ","����"));
		list.add(new User(5,"Ĩ�走��","����"));
		list.add(new User(6,"�u��","����"));
	}
	
	public List<User>  findAll() {
		return list;
	}
	
	
	public User getOne(Integer id) {
		for (int i = 0; i < list.size(); i++) {
			if(id!=null&&list.get(i).getId()==id) {
				return list.get(i);
			}
		}
		return null;
	}
	
	
	public void addorupdate(User user) {
		if(user.getId()==null) {
			user.setId(id++);
			list.add(user);
		}else{
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getId()==user.getId()) {
					list.get(i).setAddr(user.getAddr());
					list.get(i).setName(user.getName());
				}
			}
		}
		
	}
	
	public void remove(Integer id) {
		for (int i = 0; i < list.size(); i++) {
			if(id!=null&&list.get(i).getId()==id) {
				 list.remove(i);
			}
		}
	}
	
	
}
