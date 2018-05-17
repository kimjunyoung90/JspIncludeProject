package com.sist.news.manager;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Rss {
	private Channel channel=new Channel();

	public Channel getChannel() {
		return channel;
	}
	
	//@XmlElement=> Jsoup에서 text()를 가져오는 것과 같은 의미
	
	@XmlElement
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	
	
}
