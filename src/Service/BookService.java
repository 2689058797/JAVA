package Service;

import java.util.List;

import Dao.Book;
import Dao.Page;

public interface BookService {
	public List<Book> findAllBook(Page page);

	public List<Book> findAllBook();

	public void save(Book book);

	public void delete(Book book);

	public List<Book> findLikeByName(String property, Page page);

	public List<Book> findByPublish(Object property, Page page);

	public List<Book> findByAuthor(Object property, Page page);

	public List<Book> findByPath(Object property, Page page);

	public List<Book> findByCategory(Object property, Page page);

	public Book findById(int id);

	public List<Book> findByBookId(Object property, Page page);

	public List<Book> findByBookPrice(Page page);

}
