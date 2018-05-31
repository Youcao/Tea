 package com.orcale.tea.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;


import com.orcale.tea.model.bean.PageBean;
import com.orcale.tea.model.bean.product;
import com.orcale.tea.model.daoImp.productDAOImp;

/**
 * Servlet implementation class productServlet
 */
@WebServlet("/productServlet")
public class productServlet extends HttpServlet {
	private productDAOImp  dao;
	private static final long serialVersionUID = 1L;
	int count=0; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productServlet() {
    	dao=new productDAOImp();
        
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodName=request.getParameter("method");//通过前端传过来的method参数来识别用户是要调用哪个方法
		switch (methodName) {
		case "index":
		{
			index(request,response);
			break;
		}
		case "detail":
		{
			detail(request,response);
			break;
		}
		case "search":
		{
			search(request,response);
			break;
		}
		case "searchAny":
		{
			searchAny(request,response);
			break;
		}
		case "searchlistproductByPage"://分页搜索茶信息方法
		{
			searchlistproductByPage(request,response);
			break;
		}
		case "listproductByPage"://分页查询茶信息的方法
		{
			listproductByPage(request,response);
			break;
		}
		case "mohuSearch"://搜索框模糊匹配关键字
		{
			mohuSearch(request,response);
			break;
		}
		case "listTeaByAjaxRequest"://ajax分页
		{
			listTeaByAjaxRequest(request,response);
			break;
		}
		default:
			break;
		}	
	}
	/**
	 * 定义一个方法，这个方法是为首页准备数据的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("进入后台来准备给数据了");
		//在页面没有加载完之前，先把这个页面要显示的数据查出来，准备好，下面才可以用
		ArrayList<product> allproduct=dao.listRecentproductByCount(5);//这里应该调用查询N个茶信息的方法，把需要显示在首页的茶信息查询出来	
		request.setAttribute("allproduct", allproduct);
		
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	
	
	/**
	 * 这是加载某个茶详情的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入了的加载详细信息的方法");
		
		//在页面没有加载完之前，先把这个页面要显示的数据查出来，准备好，下面才可以用
		//ArrayList<product> product=dao.listRecentproductByCount(200);
		product productInfo=dao.getproductInfoByteaId(Integer.parseInt(request.getParameter("teaid")));			
		request.setAttribute("product", productInfo);
		
		request.getRequestDispatcher("Product_Detailed.jsp").forward(request, response);
	}
	
	/**
	 * 这是处理条件搜索功能的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入了的条件搜索的方法");
		
		/*String  pinpai=null;
		if(request.getParameter("teaSearch")!=null)
		  pinpai=new String(request.getParameter("teaSearch"));//品牌
		System.out.println(pinpai);*/
		//1.获取用户从上一个页面提交时输入的数据
		/*String  chandi=null;
		if(request.getParameter("teaSearch")!=null)
			chandi=new String(request.getParameter("teaSearch"));//品牌
			System.out.println(chandi);*/
			String  teaname=null;
		if(request.getParameter("teaSearch")!=null)
			teaname=new String(request.getParameter("teaSearch"));//品牌
			System.out.println(teaname);

		//String  chandi=request.getParameter("chandi");//产地
		//String  teaname=request.getParameter("teaname");//名称

		//2.根据数据查询数据库，找到对应的茶信息
		ArrayList<product>  searchedproducts=dao.searchproductByCondition(teaname);
		count=searchedproducts.size();
		System.out.println(searchedproducts);
		request.setAttribute("product", searchedproducts);//这里是将查询出来的集合存储到request，然后通过转发传递到下一个jsp中显示出来

		//3.当数据准备完毕之后，应该跳转到下一个页面(jsp)
		request.getRequestDispatcher("SearchProduct.jsp").forward(request, response); //request对象负责让这个jsp跳转到下一个页面

		}
	/**
	 * 这是处理搜索任意字段功能的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void searchAny(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入了的加载搜索任意字段的方法");
		String   key=new String(request.getParameter("key").getBytes("UTF-8"));
		System.out.println(key);
		productDAOImp  dao=new productDAOImp();
		ArrayList<product> products=dao.searchAllByKey(key);
		System.out.println(products);
		request.setAttribute("product", products);
		request.getRequestDispatcher("SearchProduct.jsp").forward(request, response); //request对象负责让这个jsp跳转到下一个页面

	}
	/**
	 * 搜索分页
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void searchlistproductByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入搜索分页方法");
		String  searchpage=request.getParameter("searchpage");
		System.out.println(searchpage);
		String searchcount=request.getParameter("searchcount");
		System.out.println(searchcount);
		ArrayList<product>  product=dao.searchlistproductByPage(Integer.parseInt(searchpage),Integer.parseInt(searchcount));
		

		/**
		 * 通过计算将分页中所有要用到的数字全部算出来
		 */
		int nowPage=Integer.parseInt(searchpage);//当前页
		int allCount=count;
		System.out.println(allCount);				
		int pageOfCount=Integer.parseInt(searchcount);
		int allPages=(allCount%pageOfCount==0)?allCount/pageOfCount:(allCount/pageOfCount+1);//求总页数
		int perviousPage=nowPage<=1?1:(nowPage-1);
		int nextPage=nowPage>=allPages?allPages:(nowPage+1);
		/**
		 * 将所有的分页 中的属性封装成一个分页bean，将一个对象整体保存传到页面上
		 */
		PageBean  pageBean=new PageBean();
		pageBean.setNowPage(nowPage);
		pageBean.setPreviousPage(perviousPage);
		pageBean.setNextPage(nextPage);
		pageBean.setAllCount(allCount);
		pageBean.setAllPages(allPages);
		pageBean.setEverPageCount(pageOfCount);
		
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("product", product);
		System.out.println(product.toString());
		request.getRequestDispatcher("SearchProduct.jsp").forward(request, response);
	
	}
	/**
	 * 这个方法是处理分页显示茶信息的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void listproductByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入处理分页显示所有茶信息的方法");
		String  page=request.getParameter("page");
		System.out.println(page);
		String count=request.getParameter("count");
		System.out.println(count);
		ArrayList<product>  product=dao.listproductByPage(Integer.parseInt(page),Integer.parseInt(count));
		

		/**
		 * 通过计算将分页中所有要用到的数字全部算出来
		 */
		int nowPage=Integer.parseInt(page);//当前页
		int allCount=dao.getAllCountOfproduct();//因为分页在页面上要知道最大页，所以，我们要调用dao中查询所有条数的方法，获得product有多少条
		int pageOfCount=Integer.parseInt(count);
		int allPages=(allCount%pageOfCount==0)?allCount/pageOfCount:(allCount/pageOfCount+1);//求总页数
		int perviousPage=nowPage<=1?1:(nowPage-1);
		int nextPage=nowPage>=allPages?allPages:(nowPage+1);
		/**
		 * 将所有的分页 中的属性封装成一个分页bean，将一个对象整体保存传到页面上
		 */
		PageBean  pageBean=new PageBean();
		pageBean.setNowPage(nowPage);
		pageBean.setPreviousPage(perviousPage);
		pageBean.setNextPage(nextPage);
		pageBean.setAllCount(allCount);
		pageBean.setAllPages(allPages);
		pageBean.setEverPageCount(pageOfCount);
		
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("product", product);
		System.out.println(product.toString());
		request.getRequestDispatcher("Product_List.jsp").forward(request, response);
	}
	/**
	 * 这是前台ajax模糊查询关键字的业务方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void mohuSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  key=request.getParameter("key");
		System.out.println(key);
		ArrayList<String>  teaname=dao.mohuSearch(key);
		System.out.println(teaname);
		response.setContentType("text/xml;charset=UTF-8");
		PrintWriter   out=response.getWriter();
		out.write("<?xml version='1.0'   encoding='UTF-8' ?>\r\n");
		out.write("<titles>\r\n");
			for(String k:teaname) {
				out.write("<title>"+k+"</title>\r\n");
			}
		out.write("</titles>");
		out.flush();
		out.close();
	}
	/**
	 * Ajax分页请求方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void listTeaByAjaxRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  page=request.getParameter("page");
		String count=request.getParameter("count");
		ArrayList<product>  teas=dao.listproductByPage(Integer.parseInt(page),Integer.parseInt(count));
		response.setContentType("text/json;charset=utf-8");
		PrintWriter  out=response.getWriter();
		JSONArray  allTeas=new JSONArray();
		for(product  t:teas) {
			JSONObject  tea=new JSONObject();
			try {
				tea.put("teaid", t.getTeaid());
				tea.put("image", t.getMainimag());
				tea.put("teaname",t.getTeaname());
				tea.put("shangchengjia", t.getShangchengjia());
				tea.put("yuanjia", t.getYuanjia());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			allTeas.put(tea);
		}
		out.write(allTeas.toString());
		/**
		 * xml方式返回ajax请求当结构化的数据
		 */
//		out.write("<?xml  version='1.0'  encoding='utf-8'  ?>");
//		out.write("<cars>");
//		for(Car  c:cars) {
//			out.write("<car>");
//				out.write("<carbrand>"+c.getPinpaiming()+"</carbrand>");
//				out.write("<price>"+c.getShoujia()+"</price>");
//				out.write("<xilie>"+c.getXilie()+"</xilie>");
//				out.write("<pailiang>"+c.getPailiang()+"</pailiang>");
//				out.write("<gonglishu>"+c.getGonglishu()+"</gonglishu>");
//			out.write("</car>");
//		}
//		
//		
//		out.write("</cars>");
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
