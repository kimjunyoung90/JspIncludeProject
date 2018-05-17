package com.sist.news.manager;

import javax.xml.bind.annotation.XmlElement;

/*
 *   <rss>
 *     <channel>
 *       <item>
 *         <title>aaa</title>
 *         <link>http://</link>
 *       </item>
 *     </channel>
 *   </rss>
 */
public class Item {
    private String title;
    private String description;
    private String author;
    private String link;
    
	public String getTitle() {
		return title;
	}
	
	@XmlElement
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	
	@XmlElement
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAuthor() {
		return author;
	}
	
	@XmlElement
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getLink() {
		return link;
	}
	
	@XmlElement
	public void setLink(String link) {
		this.link = link;
	}
	  
}


