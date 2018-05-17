package com.sist.news.manager;
import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import java.net.*;

public class NewsManager {
	public List<Item> newsAllData(String data)
	{
		List<Item> list=new ArrayList<Item>();
		
		try {
			//xml에 있는 데이터를 집어넣는 클래스
			//newInstance=>()안에 지정되어 있는 곳부터 데이터를 저장한다는 의미
			JAXBContext jc=JAXBContext.newInstance(Rss.class);
			
			Unmarshaller un=jc.createUnmarshaller();
			// xml-> class로 변경(업먀샬), class->xml로 변경 마샬
			URL url=new URL("http://newssearch.naver.com/search.naver?where=rss&query="
	                  +URLEncoder.encode(data, "UTF-8"));			
			//where=rss는 rss형식을 의미 query는 검색할 단어
			//url 뒤에 있는 URLEncoder.encode(data, "UTF-8")은 query뒤에 오는 검색할 한글 단어(data)를 인코딩 해주는 명령
			
			Rss rss=(Rss)un.unmarshal(url);
			list=rss.getChannel().getItem();
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		
		return list;
	}
}
