package com.orcale.tea.control;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   



/**
 * Servlet implementation class code
 */
@WebServlet("/MessageCodeServlet")
public class MessageCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageCodeServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String methodName = request.getParameter("method");
		switch (methodName) {
		case "setcode": {
			setcode(request, response);
			break;
		}
		default:
			break;
		}
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void setcode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//接口类型：互亿无线触发短信接口，支持发送验证码短信、订单通知短信等。
		 // 账户注册：请通过该地址开通账户http://sms.ihuyi.com/register.html
		 // 注意事项：
		 //（1）调试期间，请用默认的模板进行测试，默认模板详见接口文档；
		 //（2）请使用APIID（查看APIID请登录用户中心->验证码短信->产品总览->APIID）及 APIkey来调用接口；
		 //（3）该代码仅供接入互亿无线短信接口参考使用，客户可根据实际需要自行编写；

		String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

		int mobile_code = (int)((Math.random()*9+1)*100000); //获取随机数

		String account = "C46992253"; //查看用户名是登录用户中心->验证码短信->产品总览->APIID
		String password = "8d3a9fde21ec208286bdc6c365300ce7";  //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
		String mobile = request.getParameter("mobile");
		String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

		try {

			URL url = new URL(postUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);//允许连接提交信息
			connection.setRequestMethod("POST");//网页提交方式“GET”、“POST”
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			connection.setRequestProperty("Connection", "Keep-Alive");
			StringBuffer sb = new StringBuffer();
			sb.append("account="+account);
			sb.append("&password="+password);
			sb.append("&mobile="+mobile);
			sb.append("&content="+content);
			OutputStream os = connection.getOutputStream();
			os.write(sb.toString().getBytes());
			os.close();

			String line, result = "";
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			while ((line = in.readLine()) != null) {
				result += line + "\n";
			}
			in.close();
			System.out.println(result);

		} catch (IOException e) {
			e.printStackTrace(System.out);
		}}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
    }  
	}
