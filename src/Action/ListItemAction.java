package Action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Dao.Book;
import Dao.Page;
import Dao.Purchase;
import Dao.Shopcar;
import Dao.Users;
import Service.BookService;
import Service.PurchaseService;
import Service.ShopCarService;

import com.opensymphony.xwork2.ActionSupport;

public class ListItemAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Shopcar> list;
	private Shopcar shopCar;
	private ShopCarService shopCarService;
	private Users users;
	private Book book;
	private BookService bookService;
	private PurchaseService purchaseService;
	private Purchase purchase;

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}

	private Page page;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public List<Shopcar> getList() {
		return list;
	}

	public void setList(List<Shopcar> list) {
		this.list = list;
	}

	public Shopcar getShopCar() {
		return shopCar;
	}

	public void setShopCar(Shopcar shopCar) {
		this.shopCar = shopCar;
	}

	public ShopCarService getShopCarService() {
		return shopCarService;
	}

	public void setShopCarService(ShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}

	// 往购物车中添加商品，并且检验是否有相同商品已经在购物车中
	public String execute() throws Exception {
		if (null == page) {
			page = new Page();
		}
		boolean b = true;
		book = this.bookService.findByBookId(book.getBookId(), page).get(0);
		HttpSession session = ServletActionContext.getRequest().getSession();
		this.users = (Users) session.getAttribute("user");
		this.list = this.shopCarService.findAllItems(this.users);
		// 查询此书本是否已经存在于购物车中
		for (Shopcar s : list) {
			if (s.getBook().getBookId().equals(book.getBookId())) {
				b = false;
			}
		}
		if (b) {
			this.shopCar.setBook(this.book);
			this.shopCar.setUsers(this.users);
			java.util.Date currentTime = new java.util.Date();// 将时间格式化，便于录入数据库
			java.sql.Date date = new java.sql.Date(currentTime.getTime());
			this.shopCar.setAddDate(date);
			this.shopCarService.save(this.shopCar);
			return SUCCESS;
		}
		return ERROR;

	}

	// 将购物车的物品添加到确认支付的物品清单中
	@SuppressWarnings("unchecked")
	public String purchase() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		list = (List<Shopcar>) session.getAttribute("itemList");
		for (int i = 0; i < list.size(); i++) {
			this.purchase = new Purchase();
			this.purchase.setBook(list.get(i).getBook());
			this.purchase.setBuyDate(list.get(i).getAddDate());
			this.purchase.setUsers(list.get(i).getUsers());
			this.purchase.setNum(list.get(i).getNum());
			this.purchaseService.save(purchase);
		}
		list.clear();
		session.setAttribute("itemList", list);
		return SUCCESS;
	}

	// 购物车中的删除操作
	public String delete() throws Exception {
		this.shopCarService.delete(this.shopCar);
		return SUCCESS;
	}

	// 显示某个用户的购物车
	public String findByUserName() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		users = (Users) session.getAttribute("user");
		this.list = this.shopCarService.findAllItems(this.users);
		session.setAttribute("itemList", list);
		return SUCCESS;
	}

}
