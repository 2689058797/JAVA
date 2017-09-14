package Action;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import Dao.Managers;
import Dao.Users;
import Service.ManagerService;
import Service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class ListUserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 锟斤拷锟斤拷锟斤拷员锟斤拷锟斤拷
	private List<Users> list;// 锟斤拷锟斤拷锟矫伙拷锟斤拷锟斤拷荼锟绞碉拷锟�
	private Users users;// 锟斤拷锟斤拷锟矫伙拷实锟斤拷
	private UserService userService;// 锟斤拷取锟接匡拷实锟斤拷
	private List<Managers> managerList;
	private ManagerService managerService;
	private Managers managers;
	
	public ManagerService getManagerService() {
		return managerService;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	public Managers getManager() {
		return managers;
	}

	public void setManager(Managers managers) {
		this.managers = managers;
	}

	public List<Managers> getManagerList() {
		return managerList;
	}

	public void setManagerList(List<Managers> managerList) {
		this.managerList = managerList;
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

	public List<Users> getList() {
		return list;
	}

	public void setList(List<Users> list) {
		this.list = list;
	}

	@Override
	// 锟矫伙拷锟斤拷锟斤拷锟斤拷锟斤拷证
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		list = userService.findAllUser();
		managerList = managerService.findAll();
		session.setAttribute("allUser", list);
		for (Managers manager : managerList) {
			if (manager.getUsername().equals(users.getUsername())
					&& manager.getPassword().equals(users.getPassword())
					&& manager.getState().equals("0")) {
				session.setAttribute("manager", manager);
				manager.setState("1");
				this.managerService.update(manager);
				return INPUT;
			}
		}

		for (Users user : list) {
			if (user.getUsername().equals(users.getUsername())
					&& user.getPassword().equals(users.getPassword())
					&& user.getState().equals("0")) {
				session.setAttribute("user", user);
				user.setState("1");
				this.userService.update(user);
				return SUCCESS;
			}
		
			else if(user.getState().equals("1"))
			
			{
				addActionError("该用户已经登录");
				
				return ERROR;
			}
			
		}
			
		addActionError("用户名不存在或密码错误");
		
				return ERROR;
	}

	public String getUpdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		int i = Integer.parseInt(request.getParameter("users.userId"));
		this.users = this.userService.findById(i);
		request.setAttribute("users", this.users);
		return SUCCESS;
	}

	public String update() {
		this.userService.update(this.users);
		return SUCCESS;

	}

	// 锟芥储锟矫伙拷锟斤拷息
	public String save() throws Exception {
		this.userService.save(this.users);
		return SUCCESS;
	}

	// 删锟斤拷锟矫伙拷
	public String delete() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		this.users = this.userService.findById(Integer.parseInt(request
				.getParameter("users.userId")));
		this.userService.delete(this.users);
		return SUCCESS;
	}

	// 锟斤拷锟截碉拷锟斤拷锟矫伙拷锟斤拷锟斤拷息
	public String findSingle() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		this.users = (Users) session.getAttribute("user");
		return SUCCESS;
	}

	// 锟矫伙拷锟斤拷锟斤拷
	public String offline() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		this.users = userService
				.findById(((Users) session.getAttribute("user")).getUserId());
		this.users.setState("0");
		this.userService.update(this.users);
		return SUCCESS;
	}

	// 锟斤拷锟斤拷员锟斤拷锟斤拷
	public String offManager() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		this.managers = managerService.findById(((Managers) session
				.getAttribute("manager")).getManagerId());
		this.managers.setState("0");
		this.managerService.update(this.managers);
		return SUCCESS;
	}

	// 锟斤拷锟揭伙拷锟斤拷锟诫，思路锟斤拷锟矫伙拷锟斤拷锟斤拷锟斤拷一锟斤拷锟斤拷锟斤拷锟斤拷雍锟街憋拷影汛锟斤拷锟斤拷锟捷匡拷锟斤拷锟斤拷锟斤拷敕拷偷锟斤拷没锟斤拷锟斤拷锟斤拷锟�
	public String findpassword() {

		// 锟斤拷锟斤拷没锟矫伙拷锟斤拷诳锟斤拷锟斤拷锟斤拷攵拷锟斤拷锟斤拷蚍祷锟�

		list = this.userService.findByUsername(this.users.getUsername());

		// 锟绞硷拷锟斤拷锟酵诧拷锟斤拷
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		senderImpl.setHost("smtp.qq.com");
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(list.get(0).getEmail());
		mailMessage.setFrom("604142287@qq.com");
		mailMessage.setSubject(this.users.getUsername() + "锟斤拷茫锟斤拷锟斤拷锟斤拷锟斤拷锟窖撅拷锟斤拷锟斤拷");// 锟绞硷拷锟斤拷锟斤拷
		mailMessage.setText(this.users.getUsername()
				+ "锟斤拷茫锟斤拷锟斤拷锟斤拷锟斤拷锟窖撅拷锟斤拷锟斤拷        锟斤拷锟斤拷为锟斤拷" + list.get(0).getPassword());// 锟绞硷拷锟斤拷锟斤拷
		senderImpl.setUsername("604142287"); // 锟斤拷锟斤拷username
		senderImpl.setPassword("hzj19942904"); // 锟斤拷锟斤拷password

		Properties prop = new Properties();
		prop.put("mail.smtp.auth", "true"); // 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟轿猼rue锟斤拷锟矫凤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷证,锟斤拷证锟矫伙拷锟斤拷锟斤拷锟斤拷锟斤拷欠锟斤拷锟饺�
		prop.put("mail.smtp.timeout", "25000");
		senderImpl.setJavaMailProperties(prop);

		senderImpl.send(mailMessage);

		System.out.println(" 锟绞硷拷锟斤拷锟酵成癸拷.. ");

		return SUCCESS;

	}
}