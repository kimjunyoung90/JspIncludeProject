package com.sist.member.dao;
import java.util.*;
import java.sql.*; //Connection,PreparedStatement,ResultSet
import javax.naming.*;//Context
import javax.sql.*;//DataSource=>Database�� ����
//DBCP : Connection�� �̸� �����Ŀ� �ּҸ� �� ����Ŭ�� �����ϴ� ���
/*
 * 	1. ������ Connection �������� : getConnection();
 * 	2. ���
 * 	3. ��ȯ : disConnection();
 * ================>Connection�� ������ �����ϸ鼭 ������ �����ϰ� ����� �ش�.
 * 
 */
public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//�ּҸ� ��´�(POOL�κ���) POOL�̶� Connection�� �����ϴ� ����
	/*
	 * 	POOL �޸� ����
	 * ========================
	 * 	java://comp/env(C ����̺�� ���ٰ� ����)
	 * ===============================(��뿩�ΰ� true�� �Ǿ������� ���� �ּҸ� ���� �´�)
	 * 	�̸�				�ּ�		��뿩��
	 * jdbc/oracle		100		false
	 * jdbc/oracle		200		false
	 * jdbc/oracle		300		false
	 * jdbc/oracle		400		false
	 * jdbc/oracle		500		false
	 * ===============================
	 * ����� : true, ��ȯ : false
	 * ===============================
	 */
	public void getConnection()
	{
		try {
			//pool ����
			Context init=new InitialContext();
			//Ž���⸦ ����.=>JNDI
			
			Context c=(Context)init.lookup("java://comp/env");
			// C://����̹��� ����
			
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			//����� �����ͺ��̽��� ����(DataSource)�� ���´�. lookup�� �̸��� ���� ��ü �ּҸ� �����´�.
			
			conn=ds.getConnection();
					
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	//��ȯ
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
	
	// �α��� 
	public String isLogin(String id,String pwd)
    {
    	String result="";
    	try
    	{
    		getConnection();
    		// ID���翩�� Ȯ��   => 1(����),0(����(X))
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
    	    			else // pwd�� Ʋ������
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
