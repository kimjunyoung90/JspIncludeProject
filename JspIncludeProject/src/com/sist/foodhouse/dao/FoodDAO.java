package com.sist.foodhouse.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.*;

public class FoodDAO {
	 private Connection conn;
	  private PreparedStatement ps;
	  /*public FoodDAO()
	  {
		  try
		  {
			  Class.forName("oracle.jdbc.driver.OracleDriver");
		  }catch(Exception ex)
		  {
			  System.out.println(ex.getMessage());
		  }
	  }*/
	  public void getConnection()
	  {
		  try
		  {
			  // ������ ��ġ => �ּҰ� �б� => �̸����� ���丮  (JNDI)
			  Context init=new InitialContext();
			  Context c=(Context)init.lookup("java://comp/env");
			  DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			  
			  conn=ds.getConnection();
			  /*String url="jdbc:oracle:thin:@localhost:1521:ORCL";
			  conn=DriverManager.getConnection(url,"scott","tiger");*/
		  }catch(Exception ex)
		  {
			  System.out.println(ex.getMessage());
		  }
		  
	  }
	  // ��ȯ 
	  public void disConnection()
	  {
		  try
		  {
			  if(ps!=null) ps.close();
			  if(conn!=null) conn.close();
		  }catch(Exception ex){}
	  }
	  
	  //category ����
	  public void foodCategoryInsert(CategoryVO vo)
	  {
		  try {
			  getConnection();
			  String sql="INSERT INTO category VALUES((SELECT NVL(MAX(cateNo)+1,1)FROM category),?,?,?)";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, vo.getTitle());
			  ps.setString(2, vo.getSubject());
			  ps.setString(3, vo.getPoster());
			  ps.executeUpdate();			  
		  }catch(Exception ex)
		  {
			  System.out.println(ex.getMessage());
		  }
		  finally {
			  disConnection();
		  }
	  }
	  public ArrayList<CategoryVO> categoryAllData()
	  {
		  ArrayList<CategoryVO> list=new ArrayList<CategoryVO>();
		  
		  try {
			  getConnection();
			  String sql="SELECT cateno,title,subject,poster FROM category ORDER BY cateno ASC";
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  CategoryVO vo=new CategoryVO();
				  vo.setCateNo(rs.getInt(1));
				  vo.setTitle(rs.getString(2));
				  vo.setSubject(rs.getString(3));
				  vo.setPoster(rs.getString(4));
				  list.add(vo);
			  }
			  rs.close();
		  }catch(Exception ex)
		  {
			  System.out.println(ex.getMessage());
		  }
		  finally {
			  disConnection();
		  }
		  
		  return list;
	  }
}
