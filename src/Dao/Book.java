package Dao;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */

public class Book implements java.io.Serializable {

	// Fields

	private Integer bookId;
	private String bookname;
	private String author;
	private String imagepath;
	private String publish;
	private Integer price;
	private Integer quality;
	private String description;
	private String category;
	private Set commentses = new HashSet(0);
	private Set shopcars = new HashSet(0);

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** minimal constructor */
	public Book(Integer bookId) {
		this.bookId = bookId;
	}

	/** full constructor */
	public Book(Integer bookId, String bookname, String author,
			String imagepath, String publish, Integer price, Integer quality,
			String description, String category, Set commentses, Set shopcars) {
		this.bookId = bookId;
		this.bookname = bookname;
		this.author = author;
		this.imagepath = imagepath;
		this.publish = publish;
		this.price = price;
		this.quality = quality;
		this.description = description;
		this.category = category;
		this.commentses = commentses;
		this.shopcars = shopcars;
	}

	// Property accessors
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getBookId() {
		return this.bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getBookname() {
		return this.bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getImagepath() {
		return this.imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	public String getPublish() {
		return this.publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getQuality() {
		return this.quality;
	}

	public void setQuality(Integer quality) {
		this.quality = quality;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Set getCommentses() {
		return this.commentses;
	}

	public void setCommentses(Set commentses) {
		this.commentses = commentses;
	}

	public Set getShopcars() {
		return this.shopcars;
	}

	public void setShopcars(Set shopcars) {
		this.shopcars = shopcars;
	}

}