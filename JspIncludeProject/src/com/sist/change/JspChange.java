package com.sist.change;

public class JspChange {
   private static String[] jsp={
	   "home.jsp",
	   "../member/join.jsp",
	   "../foodhouse/foodhouse.jsp",
	   "../foodhouse/foodhouse.jsp",
	   "../databoard/databoard.jsp",
	   "../member/welcome.jsp"
   };
   // dno
   private static String[] databoard_jsp={
	   "list.jsp",
	   "detail.jsp",
	   "insert.jsp",
	   "update.jsp"
   };
   //mno
   /*private static String[] member_jsp= {
		   "",
		   "welcome.jsp"
   };
   public static String member_changer(int no)
   {
	   return member_jsp[no];
   }*/
   public static String change(int no)
   {
	   return jsp[no];
   }
   public static String databoard_change(int no)
   {
	   return databoard_jsp[no];
   }
}
