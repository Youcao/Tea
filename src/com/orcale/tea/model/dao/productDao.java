package com.orcale.tea.model.dao;

import java.util.ArrayList;

import com.orcale.tea.model.bean.product;



public interface productDao  extends BaseDAO{
	/*
	 * 设计一个可以根据用户传入的数量查询显示出最近发布的茶信息
	 */
	public abstract ArrayList<product>  listRecentproductByCount(int count);
	
	/**
	 * 定义一个查询需要推广显示到滚动区域茶信息的方法
	 */
	public abstract  ArrayList<product>  getAllproductByTuiguang();
	
	/**
	 * 
	 * @param teaid 要查询的茶ID
	 * @return  一个查询并封装好的tea对象
	 */
	public abstract product  getproductInfoByteaId(int teaid);
	/**
	 * 根据传入的条件，搜索对应的茶信息的方法
	 * @param chandi
	 * @param teaname
	 * @return
	 */
	public abstract ArrayList<product> searchproductByCondition(
			String teaname);
	/**
	 * 根据模糊关键字查询所有的内容
	 * @param key
	 * @return
	 */
	public  abstract ArrayList<product>  searchAllByKey(String key);
	/**
	 * 搜索分页
	 * @param page
	 * @param count
	 * @return
	 */
	public ArrayList<product>  searchlistproductByPage(int searchpage,int searchcount);
	/**
	 * 显示所有商品分页
	 * @param page
	 * @param count
	 * @return
	 */
	public ArrayList<product>  listproductByPage(int page,int count);
	/**
	 * 查询出茶信息表有多少条数据
	 * @return
	 */
	public int getAllCountOfproduct();
	/**
	 * 
	 * @param key
	 * @return
	 */
	public  ArrayList<String>  mohuSearch(String key);
	}
