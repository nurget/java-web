package com.web.vo;

public class HumanVO {
	private int age;
	private String name;
	private String addr;
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age; // this 를 붙이면 human이 죽을 때까지 살아있음
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
		return "name=" + name + ",age=" + age + ",addr=" + addr;
	}
}

//class Execute {
//	public static void main(String[] args) {
//		HumanVO human = new HumanVO();
//		human.setAge(10);
//		System.out.println(human.getAge());
//		human.setName("홍길동");
//		human.setAddr("서울");
//		System.out.println(human);
//	}
//}
