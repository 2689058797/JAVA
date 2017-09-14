package Action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Dao.Book;
import Dao.Purchase;
import Dao.Users;
import Service.BookService;
import Service.PurchaseService;
import Service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class ListPurchaseAction extends ActionSupport {

	/**
	 * 杩欎釜绫绘槸鐢ㄤ簬鍒楀嚭涔拌繃鍟嗗搧鐨�
	 */
	private static final long serialVersionUID = 1L;
	private Purchase purchase;
	private BookService bookService;
	private List<Purchase> list;
	private PurchaseService purchaseService;
	private Book book;
	private Users users;
	private UserService userService;
	private List<Object> infolist;

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public BookService getBookService() {
		return bookService;
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	// 璇ユ柟娉曠敤鎴锋煡璇㈡墍鏈夌殑鍟嗗搧璐拱璁板綍锛屾槸鎸囨暟鎹簱鍐呬繚瀛樼殑鎵�湁璁板綍锛岀敤鏉ョ粰绠＄悊鍛樻煡鐪嬬殑涓�釜鍔熻兘
	public String listAllPurchase() {

		System.out.println(this.users.getUserId());

		HttpSession session = ServletActionContext.getRequest().getSession();

		list = purchaseService.findAllPurchase();
		for (int i = 0; i < list.size(); i++) {
			this.book = bookService.findById(list.get(i).getBook().getBookId());
			this.users = userService.findById(list.get(i).getUsers()
					.getUserId());

			list.get(i).setBook(this.book);
			list.get(i).setUsers(this.users);

		}

		session.setAttribute("purchaselist", list);

		return SUCCESS;

	}

	public String listPurchase() {

		list = purchaseService.findAllPurchase();
		HttpSession session = ServletActionContext.getRequest().getSession();

		this.users = userService.findById(this.users.getUserId());
		int i = 0;
		for (; i < list.size();) {

			if (list.get(i).getUsers().getUserId()
					.equals(this.users.getUserId()))

			{
				i++;
			} else {

				list.remove(i);

			}

		}

		for (int j = 0; j < list.size(); j++) {

			this.book = bookService.findById(list.get(j).getBook().getBookId());

			list.get(j).setUsers(this.users);
			list.get(j).setBook(this.book);

		}

		session.setAttribute("purchaselist", list);

		return SUCCESS;

	}

	public List<Purchase> getList() {
		return list;
	}

	public void setList(List<Purchase> list) {
		this.list = list;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<Object> getInfolist() {
		return infolist;
	}

	public void setInfolist(List<Object> infolist) {
		this.infolist = infolist;
	}

}
