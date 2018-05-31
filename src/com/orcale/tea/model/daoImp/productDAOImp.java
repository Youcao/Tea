package com.orcale.tea.model.daoImp;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import com.orcale.tea.model.bean.product;
import com.orcale.tea.model.dao.productDao;

public class productDAOImp extends BaseDAOImp implements productDao {

	@Override
	public boolean add(Object o) {
		return false;
	}

	@Override
	public boolean delete(Object id) {
		return false;
	}

	@Override
	public boolean update(Object o) {
		return false;
	}

	@Override
	public Object list() {
		return null;
	}

	
	
	public ArrayList<product> listRecentproductByCount(int count){
		ArrayList<product>  products=new  ArrayList<product>();
		ResultSet rs=null;
	try {
		rs=getSta().executeQuery("select *  from  tea order by  teaid desc  limit "+count );
		while (rs.next()) {
			products.add(parsetResultToproduct(rs));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	disposeResource(getSta(), rs, getCon());
		return  products;
	}

	@Override
	public ArrayList<product> getAllproductByTuiguang() {
		ArrayList<product>  product=new  ArrayList<product>();
		ResultSet rs=null;
	try {
		rs=getSta().executeQuery("select *  from  tea   where  shifoutuiguang=1");
		while (rs.next()) {
			product.add(parsetResultToproduct(rs));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	disposeResource(getSta(), rs, getCon());
		return  product;
	}

	@Override
	public product getproductInfoByteaId(int teaid){
		product  p=null;
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select *  from  tea  where teaid="+teaid);
			if (rs.next()) {
				p = parsetResultToproduct(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
			return  p;
	}

	
	@Override
	public ArrayList<product> searchAllByKey(String key) {
		String[] keys=key.split("\\s+");
		ArrayList<product> products = new ArrayList<product>();// 瀹氫箟涓�涓泦鍚堝瓨鍌ㄦ煡璇㈠嚭鏉ョ殑鎵�鏈夎溅杈嗕俊鎭�
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("select *  from  tea  limit 1");
			ResultSetMetaData  data=rs.getMetaData();
			String sql="select * from tea  where 1=0  or";
			String[] columnName=new String[data.getColumnCount()];
			for(int n=1;n<=data.getColumnCount();n++)
			{
				columnName[n-1]=data.getColumnLabel(n);
			}
			for(String k:keys) {
				sql+="  (  1=0";
				for(String column:columnName)
				{
					sql+="  or  "+column+" like  '%"+k+"%'";
				}
				sql+=" ) and";
			}
			sql=sql.substring(0, sql.length()-3);
			rs=getSta().executeQuery(sql);
			while(rs.next()) {
				product c=parsetResultToproduct(rs);
				products.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return products;
	}
	

	public ArrayList<product> searchproductByCondition( 
			String teaname) {
		
		//System.out.println(teaname);
		String SQL="select *  from  tea  where  1=1";
		//if (chandi != null && !chandi.equals("")) {
			//SQL += "   and  chandi='" + chandi + "'";
		//}
		//if (pinpai != null && !pinpai.equals("")) {
		//	SQL += "   and  pinpai='" + pinpai + "'";
		//}	
		 if(teaname != null && !teaname.equals("")) {
			SQL += "   and  teaname='" + teaname + "'";
		}
		
		
		System.out.println(SQL);
		
		ArrayList<product>  products=new  ArrayList<product>();// 定义�??个集合存储查询出来的�??有茶信息
		ResultSet rs=null;
	try {
		rs=getSta().executeQuery(SQL);
		while (rs.next()) {
			products.add(parsetResultToproduct(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			}
		disposeResource(getSta(), rs, getCon());
		return  products;
		}
	
	
	public product parsetResultToproduct(ResultSet rs) {
		product p = null;
		try {
			p=new product();
			p.setTeaid(rs.getInt("teaid"));
			p.setTeaname(rs.getString("teaname"));
		    p.setShangchengjia(rs.getFloat("shangchengjia"));
			p.setYuanjia(rs.getFloat("yuanjia"));
			p.setZhongliang(rs.getInt("zhongliang"));
			p.setGuige(rs.getString("guige"));
			p.setYouxiaoqi(rs.getInt("youxiaoqi"));
			p.setChandi(rs.getString("chandi"));
			p.setPinpai(rs.getString("pinpai"));
			p.setProductdate(rs.getString("productdate"));
			p.setMainimag(rs.getString("mainimag"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	
			}
	/**
	 * 计算所有商品有多少页
	 */
	@Override
	public ArrayList<product> listproductByPage(int page, int count) {
		ArrayList<product> product = new ArrayList<product>();
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("select *  from  tea    limit  "+(page-1)*count+" ,"+count);
			while (rs.next()) {

				product.add(parsetResultToproduct(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return product;
	}
	/**
	 * 计算搜索后的商品有多少页
	 */
	@Override
	public ArrayList<product> searchlistproductByPage(int searchpage, int searchcount) {
		
				
		
		ArrayList<product> product = new ArrayList<product>();
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("select *  from  tea    limit  "+(searchpage-1)*searchcount+" ,"+searchcount);
			while (rs.next()) {

				product.add(parsetResultToproduct(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return product;
	}
	/**
	 * 查询所有商品有多少个
	 */
	@Override
	public int getAllCountOfproduct() {
		int  n=0;
		ResultSet  rs=null;
		try {
			  rs=getSta().executeQuery("select count(teaid)  from  tea");
			  rs.next();
			  n=rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	@Override
	public ArrayList<String> mohuSearch(String key) {
		ArrayList<String> titles = new ArrayList<String>();
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("select  teaname  from  tea  where teaname  like '%"+key+"%'  limit 10");
			while (rs.next()) {
					titles.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return titles;
	}
	
	
	
	
	
	
	}

	

	

	

	
	
	

	

