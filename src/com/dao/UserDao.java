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
		list.add(new User(1,"ÂİÎ‡·Û","ÓÀÖİ"));
		list.add(new User(2,"ÄÌ²è","ÓÀÖİ"));
		list.add(new User(3,"±ù¼¤Áè","ÓÀÖİ"));
		list.add(new User(4,"ÊíÆ¬","ÓÀÖİ"));
		list.add(new User(5,"Ä¨²èµ°¸â","ÓÀÖİ"));
		list.add(new User(6,"ûu·Û","ÓÀÖİ"));
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
