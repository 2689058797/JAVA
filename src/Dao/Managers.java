package Dao;

/**
 * Managers entity. @author MyEclipse Persistence Tools
 */

public class Managers implements java.io.Serializable {

	// Fields

	private Integer managerId;
	private String username;
	private String password;
	private String state;

	// Constructors

	/** default constructor */
	public Managers() {
	}

	/** minimal constructor */
	public Managers(Integer managerId) {
		this.managerId = managerId;
	}

	/** full constructor */
	public Managers(Integer managerId, String username, String password,
			String state) {
		this.managerId = managerId;
		this.username = username;
		this.password = password;
		this.state = state;
	}

	// Property accessors

	public Integer getManagerId() {
		return this.managerId;
	}

	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
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

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}