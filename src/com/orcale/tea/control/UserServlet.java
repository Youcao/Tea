package com.orcale.tea.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.orcale.tea.model.bean.User;
import com.orcale.tea.model.daoImp.UserDAOImp;
import com.orcale.tea.util.MD5;



/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  ServletConfig  config;
	@Override
	public void init(ServletConfig config) throws ServletException {
		this.config=config;
	}
	private UserDAOImp dao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		dao = new UserDAOImp();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("method")==null) {//如果是上传文件的方法，则会进入到这个分支
			updateUserInfo(request,response);
		}else
		{
		String methodName = request.getParameter("method");
		switch (methodName) {
		case "login": {
			login(request, response);
			break;
		}
		case "register": {
			register(request, response);
			break;
		}
		case "phoneRegister": {
			phoneRegister(request, response);
			break;
		}
		case "loginoff": {
			loginoff(request, response);
			break;
		}
		case "loadUserInfo": {
			loadUserInfo(request, response);
			break;
		}
		case "UserInfo": {
			UserInfo(request, response);
			break;
		}
		case "updatePassword": {
			updatePassword(request, response);
			break;
		}
		case "checkUserExists": {
			checkUserExists(request, response);
			break;
		}
		case "updateUserInfo": {
			updateUserInfo(request, response);
			break;
		}
		case "resetPassword": {
			resetPassword(request, response);
			break;
		}
		default:
			break;
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	/**
	 * 注冊方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("进入注册方法");
		//1.先去除用户输入的验证码
		String  code=request.getParameter("code");
		System.out.println("您在网页上输入的验证码："+code);
		//2.取出系统生成的验证码值
		String  systemCode=request.getSession().getAttribute("generateCode").toString();
		if(!code.equalsIgnoreCase(systemCode)) {//equlas会比较内容和大小写，   equalsingonrecase
			System.out.println("验证码验证失败了，立马调到前台页面");
			request.setAttribute("loginResultMessage", "codeError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			//在后台servlet中，代码里面如果转发和重定向后面继续写其他业务代码，会报错
				return ;
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		System.out.println(nickname);
		String email= request.getParameter("email");
		User user=new User();
		user.setUsername(username);
		user.setPassword(MD5.MD5(password));//在将表单提交过来的密码风涨到user对象前，先用md5算法把密码加密
		user.setNickname(nickname);
		user.setEmail(email);
		boolean  result=dao.add(user);
		if(result) {
			request.setAttribute("loginResultMessage", "registerSuccess");
		}else
		{
			request.setAttribute("loginResultMessage", "registerFail");
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	
	}

	/**
	 * 处理登陆的方法
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//为了更好的进行机器登陆(或者频繁登陆)的有效拦截，我们实现根据登陆频率动态添加验证码的验证
		Cookie[]  cs=request.getCookies();
		boolean  haveLogined=false;
		for(Cookie c:cs) {
			if(c.getName().equals("loginCount"))
			{
				c.setValue(Integer.parseInt(c.getValue())+1+"");
				response.addCookie(c);
				haveLogined=true;
				break;
			}
		}
		if(!haveLogined) {
			Cookie  c=new Cookie("loginCount", "1");
			c.setMaxAge(1000*60*3);
			response.addCookie(c);
		}
		System.out.println("进入登录方法");
	    //下面代码是判断验证码的业务代码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user = dao.login(username, MD5.MD5(password));
		if(user==null)
		{
			request.setAttribute("loginResultMessage", "userError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return ;
		}
		request.getSession().setAttribute("loginedUser", user);// 回话范围内存储用户资料，这样能保证用户在一次绘画中可以保留用户登录的信息
		response.sendRedirect("index.jsp");
	}
	/**
	 * 退出登陆的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void loginoff(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("安全退出登录方法");
		request.getSession().removeAttribute("loginedUser");
		//response.sendRedirect("index.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	/**
	 * 加载个人资料
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void loadUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("进入加载个人资料方法");
		String userid=request.getParameter("userid");
		User user=dao.getUserInfoByUserId(Integer.parseInt(userid));
		request.setAttribute("user", user);
		request.getRequestDispatcher("User_Center.jsp").forward(request, response);
	}
	/**
	 * 修改个人资料页面方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void UserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("进入修改个人资料页面方法");
		String userid=request.getParameter("userid");
		User user=dao.getUserInfoByUserId(Integer.parseInt(userid));
		request.setAttribute("user", user);
		request.getRequestDispatcher("user_info.jsp").forward(request, response);
	}
	/**
	 * 修改个人资料
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("进入修改个人资料方法");

		//用smartUpload来读取表单上传的文件和表单中的数据
		SmartUpload su = new SmartUpload();//创建一个smartUpload上传插件的对象
		// 上传初始化
		su.initialize(config,request,response);//,读取request，response中的数据到smartupload插件中
		try {
			su.upload();//把这个表单提交的数据读取到upload插件里
			su.save("/images");
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		
		Request  re=su.getRequest();//如果要读取表单中的文本数据，必须要使用的smartUplod里面的request
		String userid=re.getParameter("userid");
		//String username=re.getParameter("username");
		String  nickname=re.getParameter("nickname");
		String xingmiang=re.getParameter("xingmiang");
		String sex=	re.getParameter("sex");		
		String email=re.getParameter("email");
		String phonenumber=re.getParameter("phonenumber");
		String image=re.getParameter("image");
		
		
		
		/**
		 * 将表单取到的数据封装成一个user对象
		 */
		User user=new User();
		user.setUserid(Integer.parseInt(userid));
		//user.setUsername(username);
		user.setNickname(nickname);
		user.setXingmiang(xingmiang);
		user.setSex(Integer.parseInt(sex));		
		user.setEmail(email);
		user.setImage(image);
		user.setPhonenumber(phonenumber);
		
		
		
		
		File  uploadFile=su.getFiles().getFile(0);//从smartupload插件中读取出页面上传的多个文件对象
		System.out.println(uploadFile.getFileName());
		System.out.println(uploadFile.getSize());
		try {
			System.out.println(request.getRealPath("/images/uploadFiles/"));
		//	UUID //javaUUID ,算法，生成同一空间同一时间下绝不重复的字符串 36 
			String  uuidName=UUID.randomUUID().toString();
			java.io.File    destFile=new java.io.File(request.getRealPath("/images/uploadFiles/"));
			String childPath="";
			for(int n=0;n<uuidName.length();n++)
			{
				childPath+=uuidName.charAt(n)+"/";
			}
			java.io.File  f=new java.io.File(destFile,childPath);
			f.mkdirs();
			java.io.File  file=new java.io.File(f,uuidName+"."+uploadFile.getFileExt());
			
			uploadFile.saveAs(file.getAbsolutePath());
			String  urlPath=file.getAbsolutePath().substring(file.getAbsolutePath().indexOf("images"),file.getAbsolutePath().length());
			System.out.println(urlPath);
			user.setImage(urlPath);//将新上传的图片的路径设置到user对象中，传到dao里面修改新的头像地址
			
			
			
			boolean result=dao.update(user);
			System.out.println(result);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		System.out.println("aaa");
		request.getRequestDispatcher("User_Center.jsp").forward(request, response);
		
	}
	/**
	 * 检测用户是否存在的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void checkUserExists(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("检测用户是否存在的方法");
		String  username=request.getParameter("username");
		boolean result=dao.checkUserExsit(username);//调用dao方法判断该用户名是否存在
		//悄悄把数据会给他
		//用response（响应）对象中的输出流将处理好的结果输出给ajax请求对象
		response.setContentType("text/html;charset=UTF-8");//  text/html     ,text/xml    ,text/json
		PrintWriter  out=response.getWriter();//获取响应对象中的输出流
		out.write(result+"");
		out.flush();
		out.close();
	}
	/**
	 * 修改密码方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updatePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("进入修改密码方法");
	}
	/**
	 * 忘记密码方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void resetPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("进入忘记密码方法");
	}
	/**
	 * 手机注册方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void phoneRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("进入手机注册方法");
	}

	
	
	
	
}