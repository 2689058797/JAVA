package Dao;

import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

/**
 * Shopcar entity. @author MyEclipse Persistence Tools
 */

public class Shopcar implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Book book;
	private Users users;
	private Date addDate;
	private Integer num;

	// Constructors

	/** default constructor */
	public Shopcar() {
	}

	/** minimal constructor */
	public Shopcar(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Shopcar(Integer id, Book book, Users users, Date addDate, Integer num) {
		this.id = id;
		this.book = book;
		this.users = users;
		this.addDate = addDate;
		this.num = num;
	}

	// Property accessors
	@GeneratedValue(strategy = GenerationType.AUTO)
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

	public Date getAddDate() {
		return this.addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}