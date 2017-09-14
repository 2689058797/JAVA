package Service;

import java.util.List;

import Dao.Book;
import Dao.Comments;
import Dao.CommentsDAO;
import Dao.Page;

public class CommentsServiceImpl implements CommentsService {

	public CommentsDAO getCommentsDao() {
		return commentsDao;
	}

	public void setCommentsDao(CommentsDAO commentsDao) {
		this.commentsDao = commentsDao;
	}

	private CommentsDAO commentsDao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Comments> findAll(Page page) {
		return this.commentsDao.findAll(page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comments> findByBook(Book book, Page page) {
		return this.commentsDao.findByProperty("book", book, page);
	}

	@Override
	public void update(Comments comments) {
		this.commentsDao.merge(comments);

	}

	@Override
	public Comments findById(int id) {
		return this.commentsDao.findById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comments> findByUserAndBook(String userId, String bookId) {
		return this.commentsDao.findByUserAndBook(userId, bookId);
	}

	@Override
	public void save(Comments comments) {
		this.commentsDao.save(comments);
	}

}
