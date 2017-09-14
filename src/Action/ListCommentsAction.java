package Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Dao.Book;
import Dao.Comments;
import Dao.Page;
import Dao.Users;
import Service.BookService;
import Service.CommentsService;
import Service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class ListCommentsAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Comments> list;
	private Comments comments;
	private CommentsService commentsService;
	private Book book;
	private BookService bookService;
	private Page page;
	private List<Book> bookList;
	private Users user;
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<Comments> getList() {
		return list;
	}

	public void setList(List<Comments> list) {
		this.list = list;
	}

	public Comments getComments() {
		return comments;
	}

	public void setComments(Comments comments) {
		this.comments = comments;
	}

	public CommentsService getCommentsService() {
		return commentsService;
	}

	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public String execute() {
		try {
			if (null == page) {
				page = new Page();
			}
			HttpServletRequest request = ServletActionContext.getRequest();
			this.book = (Book) request.getAttribute("book");
			list = commentsService.findByBook(this.book, page);
			request.setAttribute("comments", list);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}

	public String findUnchecked() {
		try {
			if (null == page) {
				page = new Page();
			}
			HttpSession session = ServletActionContext.getRequest()
					.getSession();
			list = commentsService.findAll(page);
			for (int i = 0; i < list.size(); i++) {
				this.user = userService.findById(list.get(i).getUsers()
						.getUserId());
				this.book = bookService.findById(list.get(i).getBook()
						.getBookId());
				list.get(i).setBook(this.book);
				list.get(i).setUsers(this.user);
			}
			session.setAttribute("unchecked", list);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;
	}

	public String check() {
		try {
			if (null == page) {
				page = new Page();
			}
			this.comments = commentsService.findById(this.comments.getId());
			this.comments.setState("1");
			commentsService.update(this.comments);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;
	}

	public String getComment() {
		HttpServletRequest request = ServletActionContext.getRequest();
		int i = Integer.parseInt(request.getParameter("book.bookId"));
		String bookId = Integer.toString(i);
		int j = Integer.parseInt(request.getParameter("users.userId"));
		String userId = Integer.toString(j);
		list = commentsService.findByUserAndBook(userId, bookId);
		this.comments = list.get(0);
		this.comments.setContent(request.getParameter("comments.content"));
		this.commentsService.save(this.comments);
		return SUCCESS;

	}

}
