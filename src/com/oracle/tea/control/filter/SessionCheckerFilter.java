package com.oracle.tea.control.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter(filterName="sessionChecker",urlPatterns="/UserServlet")
public class SessionCheckerFilter  implements  Filter{

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//判断是否非法访问需要登录的后台
		//1.先获取用户访问的url地址
		HttpServletRequest r=(HttpServletRequest) request;
		HttpServletResponse rs=(HttpServletResponse) response;
		String url=r.getRequestURL().toString();//获取请求的路径
		String parameters=r.getQueryString();//获取请求中的参数信息，request.getQueryString
		if(parameters==null) {//如果用户要登录，表单数据时隐藏的，所以，判断参数为null的时候，直接让用户进行登录
			chain.doFilter(request, response);//如果正确登录，就放行
			return ;
		}
		if(parameters.contains("method=loadUserInfo")) {
			
			//2.判断session中有没有用户登录的信息
			if(r.getSession().getAttribute("loginedUser")!=null) {
				chain.doFilter(request, response);//如果正确登录，就放行
			}else
			{
				rs.sendRedirect("login.jsp");//如果没有正确登录，直接跳转回登录页面
			}
			
		}else {
			chain.doFilter(request, response);//如果不是要查看个人中心，那么其他功能我们不拦截，直接放心
		}
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
