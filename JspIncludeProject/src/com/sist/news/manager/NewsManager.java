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
			//xml�� �ִ� �����͸� ����ִ� Ŭ����
			//newInstance=>()�ȿ� �����Ǿ� �ִ� ������ �����͸� �����Ѵٴ� �ǹ�
			JAXBContext jc=JAXBContext.newInstance(Rss.class);
			
			Unmarshaller un=jc.createUnmarshaller();
			// xml-> class�� ����(���ϼ�), class->xml�� ���� ����
			URL url=new URL("http://newssearch.naver.com/search.naver?where=rss&query="
	                  +URLEncoder.encode(data, "UTF-8"));			
			//where=rss�� rss������ �ǹ� query�� �˻��� �ܾ�
			//url �ڿ� �ִ� URLEncoder.encode(data, "UTF-8")�� query�ڿ� ���� �˻��� �ѱ� �ܾ�(data)�� ���ڵ� ���ִ� ���
			
			Rss rss=(Rss)un.unmarshal(url);
			list=rss.getChannel().getItem();
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		
		return list;
	}
}
