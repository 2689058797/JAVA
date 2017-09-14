package Dao;

import java.sql.Date;

/**
 * Purchase entity. @author MyEclipse Persistence Tools
 */

public class Purchase implements java.io.Serializable {

	// Fields

	private Integer id;
	private Book book;
	private Users users;
	private Date buyDate;
	private Integer num;

	// Constructors

	/** default constructor */
	public Purchase() {
	}

	/** minimal constructor */
	public Purchase(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Purchase(Integer id, Book book, Users users, Date buyDate,
			Integer num) {
		this.id = id;
		this.book = book;
		this.users = users;
		this.buyDate = buyDate;
		this.num = num;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Date getBuyDate() {
		return this.buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}