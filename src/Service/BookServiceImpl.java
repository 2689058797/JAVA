package Service;

import java.util.List;

import Dao.Book;
import Dao.BookDAO;
import Dao.Page;

public class BookServiceImpl implements BookService {

	private BookDAO bookDao;

	public BookDAO getBookDao() {
		return bookDao;
	}

	public void setBookDao(BookDAO bookDao) {
		this.bookDao = bookDao;
	}

	@Override
	public List<Book> findAllBook(Page page) {
		return this.bookDao.findAll(page);
	}

	@Override
	public void save(Book book) {

		this.bookDao.save(book);

	}

	@Override
	public void delete(Book book) {
		this.bookDao.delete(book);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findByPublish(Object property, Page page) {
		return this.bookDao.findByProperty("publish", property, page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findByAuthor(Object property, Page page) {
		return this.bookDao.findByProperty("author", property, page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findByPath(Object property, Page page) {
		return this.bookDao.findByProperty("imagepath", property, page);
	}

	@SuppressWarnings("unchecked")
	public List<Book> findLikeByName(String property, Page page) {
		return this.bookDao.findLikeByName(property, page);
	}

	@Override
	public List<Book> findByCategory(Object property, Page page) {
		return this.bookDao.findByCategory(property, page);
	}

	@Override
	public List<Book> findByBookId(Object property, Page page) {
		return this.bookDao.findByProperty("bookId", property, page);
	}

	@Override
	public List<Book> findAllBook() {
		return this.bookDao.findAll();
	}

	@Override
	public List<Book> findByBookPrice(Page page) {
		return this.bookDao.findByPrice(page);
	}

	@Override
	public Book findById(int id) {
		return this.bookDao.findById(id);
	}

}
