package Service;

import java.util.List;

import Dao.Book;
import Dao.Comments;
import Dao.Page;

public interface CommentsService {
	public List<Comments> findAll(Page page);

	public List<Comments> findByBook(Book book, Page page);

	public void update(Comments comments);

	public Comments findById(int id);

	public List<Comments> findByUserAndBook(String userId, String bookId);

	public void save(Comments comments);

}
