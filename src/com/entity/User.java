package com.entity;

public class User {
private Integer id;
private String name;
private String addr;

public User() {
	// TODO Auto-generated constructor stub
}
public User(Integer id,String name,String addr) {
	this.id=id;
	this.name=name;
	this.addr=addr;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getAddr() {
	return addr;
}
public void setAddr(String addr) {
	this.addr = addr;
}
@Override
public String toString() {
	return "User [id=" + id + ", name=" + name + ", addr=" + addr + "]";
}

}
