package Dao;

import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

/**
 * Comments entity. @author MyEclipse Persistence Tools
 */

public class Comments implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Book book;
	private Users users;
	private Date commentDate;
	private String content;
	private String state;

	// Constructors

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	/** default constructor */
	public Comments() {
	}

	/** minimal constructor */
	public Comments(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Comments(Integer id, Book book, Users users, Date commentDate,
			String content) {
		this.id = id;
		this.book = book;
		this.users = users;
		this.commentDate = commentDate;
		this.content = content;
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

	public Date getCommentDate() {
		return this.commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}