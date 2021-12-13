package vo;

import java.io.UnsupportedEncodingException;
import java.util.Base64.Encoder;

public class MemberVO {
	
	private String id;
	private String pass;
	private String name;
	private String addr;
	private String phone;
	private String gender;
	private int age;
	
	public MemberVO() {}

	public MemberVO(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public boolean equals(Object o) {
		if(o instanceof MemberVO) {
			return this.id.equals(((MemberVO)o).getId());
		}
		return false;
	}
	// 암호화
	// java.util.Base64
	public String getEncoder(String id) throws UnsupportedEncodingException {
		Encoder encoder = java.util.Base64.getEncoder();
		byte[] bytes = id.getBytes("utf-8");
		return new String(encoder.encode(bytes),"UTF-8");
	}
	
	// 복호화
	public String getDecoder(String encodedId) throws UnsupportedEncodingException {
		java.util.Base64.Decoder decoder
						= java.util.Base64.getDecoder();
		byte[] bytes = encodedId.getBytes("utf-8");
		byte[] decodingBytes = decoder.decode(bytes);
		return new String(decodingBytes,"UTF-8");
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pass=" + pass + ", name=" + name + ", addr=" + addr + ", phone=" + phone
				+ ", gender=" + gender + ", age=" + age + "]";
	}
}
