<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.foodhouse.dao.*,java.util.*"%>
<%@ page import="com.sist.news.manager.*" %>
<jsp:useBean id="mgr" class="com.sist.foodhouse.dao.FoodManager"></jsp:useBean>
<jsp:useBean id="news" class="com.sist.news.manager.NewsManager"></jsp:useBean>
<%	
	ArrayList<CategoryVO> list=mgr.foodCategoryData(); 
	List<Item> nList=news.newsAllData("맛집");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- Features -->
				<div id="features-wrapper">
					<div id="features">
						<div class="container">
							<div class="row">
							<%	int i=0;
								for(CategoryVO vo:list)
								{
									if(i>3)
										break;
							%>
								<div class="3u 12u(mobile)">
									<!-- Feature #1 -->
										<section>
											<a href="#" class="bordered-feature-image"><img src="<%=vo.getPoster() %>" alt="" /></a>
											<h2><%=vo.getTitle() %></h2>
											<p>
												"서울에서 밤에 잠자는 사람은 루저"라고 했다. 
												잠자는 시간이 아까울 정도로 즐길거리가 많기 때문이다. 
												화려한 불빛과 함께 밤이 시작되면 낮과는 
												또다른 도시의 야경을 감상...
											</p>
										</section>
								</div>
							<%
									i++;
								} 
							%>
							</div>
						</div>
					</div>
				</div>

			<!-- Content -->
				<div id="content-wrapper">
					<div id="content">
						<div class="container">
							<div class="row">
								<div class="4u 12u(mobile)">

									<!-- Box #1 -->
										<section>
											<header>
												<h2>오늘의 뉴스</h2>
												<h2>맛집 관련 뉴스</h2>
												
											</header>
											<a href="#" class="feature-image"><img src="http://korean.visitseoul.net/comm/getImage?srvcId=SECTION&amp;parentSn=96&amp;fileTy=ATTACH&amp;fileNo=1&amp;thumbTy=L" alt="" /></a>
											<p>
												Duis neque nisi, dapibus sed mattis quis, rutrum accumsan sed.
												Suspendisse eu varius nibh. Suspendisse vitae magna eget odio amet mollis
												justo facilisis quis. Sed sagittis mauris amet tellus gravida lorem ipsum.
											</p>
										</section>

								</div>
								<div class="4u 12u(mobile)">

									<!-- Box #2 -->
										<section>
											<header>
												<h2>오늘의 뉴스</h2>
												<h3>맛집 관련 뉴스</h3>
											</header>
											<ul class="check-list">
											
											<%
												for(i=0;i<5;i++)
												{
													Item item=nList.get(i);
											%>
												<li><%=item.getTitle() %></li>
											<%
												}
											%>
											</ul>
										</section>

								</div>
								<div class="4u 12u(mobile)">

									<!-- Box #3 -->
										<section>
											<header>
												<h2>인기 맛집 목록</h2>
											</header>
											<ul class="quote-list">
												<%
													
													for(i=4;i<=7;i++)
													{
														 CategoryVO vo=list.get(i);
												%>
												<li>
													<img src="<%=vo.getPoster() %>" alt="" style="width:70px; height:70px"/>
													<p><%=vo.getTitle().substring(0,vo.getTitle().indexOf("베")) %></p>
													<span><%=vo.getSubject() %></span>
												</li>
												<%
													}
												%>
											</ul>
										</section>
									<!-- Box #3 끝-->

								</div>
							</div>
						</div>
					</div>
				</div>

</body>
</html>