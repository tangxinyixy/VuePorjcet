package com.controllor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.User;
import com.service.UserService;

@Controller
public class UserControllor {
	@Autowired
	private UserService userService;
	@ResponseBody
	@RequestMapping("/findall")
	public Map<String,Object>  findAll() {
		Map<String,Object> map=new HashMap<String, Object>();
        map.put("source",userService.findAll());
		return map;
	}
	@ResponseBody
	@RequestMapping(value="addandupdate",method = RequestMethod.POST)
	public boolean addorUpdate(@RequestBody User user) {
		System.out.println(user.toString());
		userService.addorupdate(user);
		return true;
	}
	@ResponseBody
	@RequestMapping(value="remove",method = RequestMethod.GET)
	public boolean remove(Integer id) {
		System.out.println(id);
		userService.remove(id);
		return true;
	}
}
