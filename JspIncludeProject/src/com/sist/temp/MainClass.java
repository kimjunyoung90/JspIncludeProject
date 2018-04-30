package com.sist.temp;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
       try
       {
    	   SAXParserFactory spf=SAXParserFactory.newInstance();
    	   SAXParser sp=spf.newSAXParser();
    	   sp.parse(new File("C:\\webDev\\webStudy\\JspIncludeProject\\WebContent\\xml\\dbcp.xml"), new XMLHandler());
       }catch(Exception ex){}
	}

}
