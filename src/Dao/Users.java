package Dao;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String username;
	private String password;
	private String name;
	private String sex;
	private String address;
	private String phone;
	private Date birthday;
	private String email;
	private String state;
	private Set shopcars = new HashSet(0);
	private Set commentses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(Integer userId) {
		this.userId = userId;
	}

	/** full constructor */
	public Users(Integer userId, String username, String password, String name,
			String sex, String address, String phone, Date birthday,
			String email, Set shopcars, Set commentses) {
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.address = address;
		this.phone = phone;
		this.birthday = birthday;
		this.email = email;
		this.shopcars = shopcars;
		this.commentses = commentses;
	}

	// Property accessors
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set getShopcars() {
		return this.shopcars;
	}

	public void setShopcars(Set shopcars) {
		this.shopcars = shopcars;
	}

	public Set getCommentses() {
		return this.commentses;
	}

	public void setCommentses(Set commentses) {
		this.commentses = commentses;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}