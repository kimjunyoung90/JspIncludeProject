package com.sist.member.dao;
import java.util.*;
import java.sql.*; //Connection,PreparedStatement,ResultSet
import javax.naming.*;//Context
import javax.sql.*;//DataSource=>Database의 정보
//DBCP : Connection을 미리 생성후에 주소를 얻어서 오라클에 접근하는 방식
/*
 * 	1. 생성된 Connection 가져오기 : getConnection();
 * 	2. 사용
 * 	3. 반환 : disConnection();
 * ================>Connection의 갯수를 제한하면서 재사용이 가능하게 만들어 준다.
 * 
 */
public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//주소를 얻는다(POOL로부터) POOL이란 Connection을 관리하는 영역
	/*
	 * 	POOL 메모리 구조
	 * ========================
	 * 	java://comp/env(C 드라이브와 같다고 생각)
	 * ===============================(사용여부가 true가 되어있으면 다음 주소를 가져 온다)
	 * 	이름				주소		사용여부
	 * jdbc/oracle		100		false
	 * jdbc/oracle		200		false
	 * jdbc/oracle		300		false
	 * jdbc/oracle		400		false
	 * jdbc/oracle		500		false
	 * ===============================
	 * 사용중 : true, 반환 : false
	 * ===============================
	 */
	public void getConnection()
	{
		try {
			//pool 연결
			Context init=new InitialContext();
			//탐색기를 연다.=>JNDI
			
			Context c=(Context)init.lookup("java://comp/env");
			// C://드라이버에 연결
			
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			//저장된 데이터베이스의 정보(DataSource)를 얻어온다. lookup은 이름에 대한 객체 주소를 가져온다.
			
			conn=ds.getConnection();
					
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	//반환
	public void disConnection() 
	{
		try {
				if(ps!=null)
				{
					ps.close();
				}
				if(conn!=null)
				{
					conn.close();
				}
		}catch(Exception ex)
		{
			
		}
	}
	
	public int idcheck(String id)
	{
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM food_member WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		finally {
			disConnection();
		}
		return count;
	}
	
	public ArrayList<ZipcodeVO> postfind(String dong)
	{
		ArrayList<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
		try {
			getConnection();
			String sql="SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') FROM zipcode "
					+ "WHERE dong LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ZipcodeVO vo=new ZipcodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setGugun(rs.getString(3));
				vo.setDong(rs.getString(4));
				vo.setBunji(rs.getString(5));
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
	
	public int postfindCount(String dong)
	{
		int count=0;
		
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM zipcode WHERE dong LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		finally {
			disConnection();
		}
		return count;
	}
	/*
	 * ID
PWD
NAME
SEX
BIRTHDAY
EMAIL
POST
ADDR1
ADDR2
TEL
	 */
	public void memberJoin(MemberVO vo)
	{
	   try {
		   getConnection();
		   String sql="INSERT INTO food_member VALUES(?,?,?,?,?,?,?,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   
		   ps.setString(1, vo.getId());
		   ps.setString(2, vo.getPwd());
		   ps.setString(3, vo.getName());
		   ps.setString(4, vo.getSex());
		   ps.setString(5, vo.getBirthday());
		   ps.setString(6, vo.getEmail());
		   ps.setString(7, vo.getPost1()+"-"+vo.getPost2());
		   ps.setString(8, vo.getAddr1());
		   ps.setString(9, vo.getAddr2());
		   ps.setString(10, vo.getTel1()+"-"+vo.getTel2()+"-"+vo.getTel3());
		   
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally 
	   {
		   disConnection();
	   }
	}
	
	// 로그인 
	public String isLogin(String id,String pwd)
    {
    	String result="";
    	try
    	{
    		getConnection();
    		// ID존재여부 확인   => 1(존재),0(존재(X))
    		String sql="SELECT COUNT(*) FROM food_member "
    				  +"WHERE id=?";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		int count=rs.getInt(1);
    		
    		if(count==0)
    		{
    			result="NOID";
    		}
    		else
    		{
    			sql="SELECT pwd,name FROM food_member "
    	    			   +"WHERE id=?";
    	    			ps=conn.prepareStatement(sql);
    	    			ps.setString(1, id);
    	    			
    	    			rs=ps.executeQuery();
    	    			rs.next();
    	    			
    	    			String db_pwd=rs.getString(1);
    	    			String name=rs.getString(2);
    	    			rs.close();
    	    			
    	    			if(db_pwd.equals(pwd)) // Login
    	    			{
    	    				result=name;
    	    			}
    	    			else // pwd가 틀린상태
    	    			{
    	    				result="NOPWD";
    	    			}
    		}
    		
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		disConnection();
    	}
    	return result;
    }
	
}
