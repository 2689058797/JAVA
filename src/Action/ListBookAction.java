package Action;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Dao.Book;
import Dao.Page;
import Service.BookService;

import com.opensymphony.xwork2.ActionSupport;

public class ListBookAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 实例化
	private Page page;// 分页组件
	private List<Book> list;
	private Book book;
	private BookService bookService;
	private File file;
	private String fileFileName;
	private String fileContentType;
	private List<Book> alllist;

	private String state = null;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<Book> getAlllist() {
		return alllist;
	}

	public void setAlllist(List<Book> alllist) {
		this.alllist = alllist;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public List<Book> getList() {
		return list;
	}

	public void setList(List<Book> list) {
		this.list = list;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	// 返回book表格中的所有数据
	public String execute() {
		state = "all";
		try {
			if (null == page) {
				page = new Page();// 如果page对象为空，说明不是通过点击页码跳转
			}
			list = bookService.findAllBook(this.page);
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("list", list);
			alllist = bookService.findAllBook();
			HttpSession session = ServletActionContext.getRequest()
					.getSession();
			session.setAttribute("totalList", alllist);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;

	}

	public String findByPrice() {
		state = "price";
		try {
			if (null == page) {
				page = new Page();
			}
			list = bookService.findByBookPrice(page);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;

	}

	public String findByAuthor() {
		state = "author";
		try {
			if (null == page) {
				page = new Page();
			}
			list = bookService.findByAuthor(this.book.getAuthor(), page);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;

	}

	public String findByCategory() {
		state = "category";
		try {
			if (null == page) {
				page = new Page();
			}
			// URL传值用了GET方法

			list = bookService.findByCategory(this.book.getCategory(), page);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;
	}

	// 根据书名返回符合条件的数据

	public String findByName() {
		state = "name";
		try {
			if (null == page) {
				page = new Page();
			}
			list = bookService.findLikeByName(this.book.getBookname(), page);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;
	}

	// 根据出版社返回符合条件的数据
	public String findByPublish() {
		state = "publish";
		try {
			if (null == page) {
				page = new Page();
			}
			list = bookService.findByPublish(this.book.getPublish(), page);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;
	}

	// 根据主键返回单个book对象
	public String findSingle() {
		try {
			if (null == page) {
				page = new Page();
			}
			HttpServletRequest request = ServletActionContext.getRequest();
			this.book = bookService.findById(this.book.getBookId());
			request.setAttribute("book", this.book);
			alllist = bookService.findAllBook();
			request.setAttribute("alllist", alllist);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ERROR;
	}

	// 存储单个book对象
	public String save() throws Exception {

		if (file != null) {
			String dataDir = "C:\\Users\\a\\Desktop\\Java work object\\BookShop\\WebRoot\\images";// 上传文件存放的目录
			File savedFile = new File(dataDir, fileFileName);// 上传文件在服务器具体的位置
			file.renameTo(savedFile);// 将上传文件从临时文件复制到指定文件
			String[] s = savedFile.getAbsolutePath().split("images");
			String path = "images" + "/" + s[s.length - 1];
			this.book.setImagepath(path);
			if (this.book.getImagepath() != "")
				this.bookService.save(this.book);
		} else {
			return INPUT;
		}

		return SUCCESS;

	}
}
