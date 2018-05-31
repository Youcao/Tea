package com.orcale.tea.model.dao;


import java.util.ArrayList;

import com.orcale.tea.model.bean.product;
import com.orcale.tea.model.daoImp.productDAOImp;

public class text {

	public static void main(String[] args) {
		productDAOImp dao=new productDAOImp();
		ArrayList<product> as=(ArrayList<product>)dao.listproductByPage(1, 3);
		//ArrayList<product> d=(ArrayList<product>)dao.searchproductByCondition("chandi", "pinpai", "teaname");
		//System.out.println(d);
		//System.out.println(as);
	}
}
