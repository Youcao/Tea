package com.orcale.tea.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orcale.tea.model.bean.product;
import com.orcale.tea.model.daoImp.productDAOImp;




/**
 * Servlet implementation class ShoppingCarServlet
 */
@WebServlet("/shoppingCarServlet")
public class shoppingCarServlet extends HttpServlet {
	private productDAOImp  dao;
	public shoppingCarServlet() {
		dao=new productDAOImp();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch (method) {
		case "add":
		{	
			add(request, response);
			break;
		}
		case "ajaxadd":
		{	
			ajaxadd(request, response);
			break;
		}
		case "deleteCar"://判断用户请求的参数中，告诉我们是进入哪个后台业务方法
		{	
			deleteCar(request, response);
			break;
		}
		case "deleteAll":
		{	
			deleteAll(request, response);
			break;
		}
		case "jia":
		{	
			jia(request, response);
			break;
		}
		case "jian":
		{	
			jian(request, response);
			break;
		}
		default:
			break;
		}
	
	}
/**
 * 添加商品到购物车的方法
 * @param request
 * @param response
 * @throws ServletException
 * @throws IOException
 */
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				System.out.println("进入添加商品到购物车的方法");
				//1.先获取前端页面点击'添加到购物车'按钮时传过来的商品ID
				String  teaid=request.getParameter("teaid");
				System.out.println(teaid);
				//2.将这个茶id存储到  ‘购物车’   里面
				//先判断session中有没有存储购物车集合，如果有，说明之前已经买过东西，如果没有说明没买过东西
				if(request.getSession().getAttribute("products")==null)
				{
						HashMap<product, Integer>  shoppingcars=new HashMap<>();
						//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
						shoppingcars.put(dao.getproductInfoByteaId(Integer.parseInt(teaid)), 1);//将页面中添加的商品id和数量存储到购物车里
						System.out.println(shoppingcars);
						//3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
						request.getSession().setAttribute("products", shoppingcars);
				}else {
					HashMap<product, Integer>  shoppingcars=(	HashMap<product, Integer> )request.getSession().getAttribute("products");
					//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
					System.out.println(shoppingcars);
					//因为session中已经存过购物车集合，说明之前买过东西，此时在添加新商品的时候应该先判断之前买过这个商品吗
					//如果买过，应该是在原来的数量上加现在的数量，如果没买过就直接将这个商品添加到集合中
					
					if(shoppingcars.containsKey(new product(Integer.parseInt(teaid))))
					{
						product  c=dao.getproductInfoByteaId(Integer.parseInt(teaid));
						int  nowCount=shoppingcars.get(c)+1;
						shoppingcars.put(c, nowCount);
					}
					else {
							shoppingcars.put(dao.getproductInfoByteaId(Integer.parseInt(teaid)),  1);//将页面中添加的商品id和数量存储到购物车里
					}
//					3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
					request.getSession().setAttribute("products", shoppingcars);
					
					//4.为了提升用户体验度，我们除了讲用户购物车的数据放入session，同时再存入cookie，方便用户关闭页面时再打开能看到之前的购物车商品
					/*
					for(product  cc:shoppingcars.keySet()) {
						Cookie  r=new Cookie("products"+cc.getTeaid(), cc.getTeaid()+","+shoppingcars.get(cc));
						r.setMaxAge(1000*60*60*24*15);
						response.addCookie(r);
					}*/
				}
				response.sendRedirect("shopping_cart.jsp");//当数据添加到购物车之后，直接跳转到购物车页面，让用户看一下购物车的信息
			}
	/**
	 * ajax添加商品到购物车的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
		protected void ajaxadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					System.out.println("进入添加商品到购物车的方法");
					//1.先获取前端页面点击'添加到购物车'按钮时传过来的商品ID
					String  teaid=request.getParameter("teaid");
					System.out.println(teaid);
					//2.将这个茶id存储到  ‘购物车’   里面
					//先判断session中有没有存储购物车集合，如果有，说明之前已经买过东西，如果没有说明没买过东西
					if(request.getSession().getAttribute("products")==null)
					{
							HashMap<product, Integer>  shoppingcars=new HashMap<>();
							//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
							shoppingcars.put(dao.getproductInfoByteaId(Integer.parseInt(teaid)), 1);//将页面中添加的商品id和数量存储到购物车里
							System.out.println(shoppingcars);
							//3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
							request.getSession().setAttribute("products", shoppingcars);
					}else {
						HashMap<product, Integer>  shoppingcars=(	HashMap<product, Integer> )request.getSession().getAttribute("products");
						//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
						System.out.println(shoppingcars);
						//因为session中已经存过购物车集合，说明之前买过东西，此时在添加新商品的时候应该先判断之前买过这个商品吗
						//如果买过，应该是在原来的数量上加现在的数量，如果没买过就直接将这个商品添加到集合中
						
						if(shoppingcars.containsKey(new product(Integer.parseInt(teaid))))
						{
							product  c=dao.getproductInfoByteaId(Integer.parseInt(teaid));
							int  nowCount=shoppingcars.get(c)+1;
							shoppingcars.put(c, nowCount);
						}
						else {
								shoppingcars.put(dao.getproductInfoByteaId(Integer.parseInt(teaid)),  1);//将页面中添加的商品id和数量存储到购物车里
						}
//						3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
						request.getSession().setAttribute("products", shoppingcars);
						
						//4.为了提升用户体验度，我们除了讲用户购物车的数据放入session，同时再存入cookie，方便用户关闭页面时再打开能看到之前的购物车商品
						/*
						for(product  cc:shoppingcars.keySet()) {
							Cookie  r=new Cookie("products"+cc.getTeaid(), cc.getTeaid()+","+shoppingcars.get(cc));
							r.setMaxAge(1000*60*60*24*15);
							response.addCookie(r);
						}*/
					}
					response.sendRedirect("shopping_cart.jsp");//当数据添加到购物车之后，直接跳转到购物车页面，让用户看一下购物车的信息
				}
	/**
	 * 这是处理删除购物车商品的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入处理删除购物车商品的方法");
		//1.获取要删除的车辆id
		String id=request.getParameter("teaid");
		//2.从session里面取出购物车集合
		HashMap<product, Integer>  shoppingcars=(	HashMap<product, Integer> )request.getSession().getAttribute("products");
		for(product p:shoppingcars.keySet()) {
			if(p.getTeaid()==Integer.parseInt(id)) {
				shoppingcars.remove(p);
				break;
			}
		}
		//3.档购物车的商品删除成功后，跳转到购物车页面
		response.sendRedirect("shopping_cart.jsp");
	}
	/**
	 * 这是处理删除购物车商品的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void jia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取要删除的tea的id
		String id=request.getParameter("teaid");
		if(request.getSession().getAttribute("teas")==null)
		{
				HashMap<product, Integer>  shoppingteas=new HashMap<>();
				//构建了一个新的HashMap<key,value>对象，赋予变量 shoppingteas
				//HashMap< Tea, Integer >是 HashMap 里的键是Tea类型-值是integer类型
				//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
				shoppingteas.put(dao.getproductInfoByteaId(Integer.parseInt(id)), 1);
				//将页面中添加的商品id和数量存储到购物车里
				
				//3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
				request.getSession().setAttribute("teas", shoppingteas);
		}else {
			HashMap<product, Integer>  shoppingteas=(HashMap<product, Integer>)request.getSession().getAttribute("teas");
			//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
			//因为session中已经存过购物车集合，说明之前买过东西，此时在添加新商品的时候应该先判断之前买过这个商品吗
			//如果买过，应该是在原来的数量上加现在的数量，如果没买过就直接将这个商品添加到集合中
			if(shoppingteas.containsKey(new product(Integer.parseInt(id))))
			{
				product  t=dao.getproductInfoByteaId(Integer.parseInt(id));
				int  nowCount=shoppingteas.get(t)+1;
				shoppingteas.put(t, nowCount);
			}
			else {
				shoppingteas.put(dao.getproductInfoByteaId(Integer.parseInt(id)),  1);
				//将页面中添加的商品id和数量存储到购物车里
			}
//			3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
			request.getSession().setAttribute("teas", shoppingteas);
		}
		//3.档购物车的商品删除成功后，跳转到购物车页面
		response.sendRedirect("shopping_cart.jsp");
	}
	
	protected void jian(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取要删除的tea的id
		String id=request.getParameter("teaid");
		//2.从session里面取出购物车集合
		HashMap<product, Integer>  shoppingteas=(HashMap<product, Integer>)request.getSession().getAttribute("teas");
		//for(Tea t:shoppingteas.keySet()) {
			if(shoppingteas.containsKey(new product(Integer.parseInt(id))))
			{
				product t=dao.getproductInfoByteaId(Integer.parseInt(id));
				int  nowCount=shoppingteas.get(t)-1;
				shoppingteas.put(t, nowCount);
			}
			else {
				shoppingteas.put(dao.getproductInfoByteaId(Integer.parseInt(id)),  1);
				//将页面中添加的商品id和数量存储到购物车里
			}
//			3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
			request.getSession().setAttribute("teas", shoppingteas);
		//}
		//3.档购物车的商品删除成功后，跳转到购物车页面
		response.sendRedirect("shopping_cart.jsp");
	}

	/**
	 * 清空购物车方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入清空购物车方法");
		request.getSession().removeAttribute("products");
		response.sendRedirect("shopping_cart.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
