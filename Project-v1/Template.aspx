<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Template.aspx.cs" Inherits="Template" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <meta content="charset=utf-8" />
    <meta name="description" content="Place your description here"/>
    <meta name="keywords" content="tez, bitirme, proje,bilgiayar, mühendislik"/>
    <meta name="author" content="Onurhan & Alper"/>   
    <link href="template.css" rel="stylesheet" type="text/css" />
    <link href="reset.css" rel="stylesheet" type="text/css" />
    <script src="jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="scripts/cufon-replace.js" type="text/javascript"></script>
    <script src="scripts/cufon-yui.js" type="text/javascript"></script>
    <script src="scripts/html5.js" type="text/javascript"></script>
    <script src="scripts/ie_png.js" type="text/javascript"></script>
    <script src="scripts/Myriad_Pro_300.font.js" type="text/javascript"></script>
    <script src="scripts/Myriad_Pro_400.font.js" type="text/javascript"></script>
    <script src="scripts/script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrap">
        <div id="header">
            <div class="container">
                <h1><a href="Template.aspx" >Bilgisayar Mühendisliği Bölümü Bitirme Tezi Sayfası</a></h1>

            <div id="nav">
                <ul>
                   <li class="current"><a href="Template.aspx" class="m1">Home Page</a></li>
                   <li><a href="about-us.html" class="m2">About Us</a></li>
                   <li><a href="articles.html" class="m3">Our Articles</a></li>
                   <li><a href="contact-us.html" class="m4">Contact Us</a></li>
                   <li class="last"><a href="sitemap.html" class="m5">Site Map</a></li>
                </ul>   
            </div>

            <div id="search-form">
                <div class="fieldset">
                <div class="rowElem">
                   <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server"></asp:TextBox>
                   <a href="#" onClick="document.getElementById('search-form').submit()">Search</a></div>
                </div>
             </div>
            </div>
        </div>



        <div class="container">
            
            <div id="aside">
                <h3>Categories</h3>
                <ul class="categories">
                    <li><span><a href="#">Programs</a></span></li>
                    <li><span><a href="#">Student Info</a></span></li>
                    <li><span><a href="#">Teachers</a></span></li>
                    <li><span><a href="#">Descriptions</a></span></li>
                    <li><span><a href="#">Administrators</a></span></li>
                    <li><span><a href="#">Basic Information</a></span></li>
                    <li><span><a href="#">Vacancies</a></span></li>
                    <li class="last"><span><a href="#">Calendar</a></span></li>
                </ul>

                <div id="newsletter-form">
                    <div class="fieldset">
                    <div class="rowElem">
                       <h2>Newsletter</h2>
                       <input type="email" value="Enter Your Email Here" onFocus="if(this.value=='Enter Your Email Here'){this.value=''}" onBlur="if(this.value==''){this.value='Enter Your Email Here'}" >
                       <div class="clear"><a href="#" class="fleft">Unsubscribe</a><a href="#" class="fright" onClick="document.getElementById('newsletter-form').submit()">Submit</a></div>
                    </div>
                    </div>
                </div>

                <h2>Fresh <span>News</span></h2>
                
                 <ul class="news">
                     <li><strong>June 30, 2010</strong>
                          <h4><a href="#">Sed ut perspiciatis unde</a></h4>
                          Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. </li>
                      <li><strong>June 14, 2010</strong>
                           <h4><a href="#">Neque porro quisquam est</a></h4>
                             Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit consequuntur magni. </li>
                    <li><strong>May 29, 2010</strong>
                         <h4><a href="#">Minima veniam, quis nostrum</a></h4>
                         Uis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae. </li>
                </ul>            
            </div>

            <div id="content">
                 <div id="banner">
                    <h2>Online <span>Tez Bilgileri <span>ve Takibi</span></span></h2>
                 </div>   
                 <div class="ic">More Website Templates at TemplateMonster.com!</div>

                 <div class="inside">
                    <h2>Recent <span>Articles</span></h2>

                    <ul class="list">
                       <li><span><img src="images/icon1.png"></span>
                          <h4>About Template</h4>
                          <p>Free 1028X768 Optimized Website Template from TemplateMonster.com! We hope that you like this tem- plate and will use for your websites.</p>
                       </li>
                       <li><span><img src="images/icon2.png"></span>
                          <h4>Branch Office</h4>
                          <p>Sed ut perspiciatis unomnis iste natus error sit volup tatem accusantiu loremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.</p>
                       </li>
                       <li class="last"><span><img src="images/icon3.png"></span>
                          <h4>Student’s Time</h4>
                          <p>Eque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempo- ra incidunt ut labore.</p>
                       </li>
                    </ul>

                    <h2>Move Forward <span>With Your Education</span></h2>
                    <p><span class="txt1">Student’s Site</span> is a free web template created by TemplateMonster.com team. This website template is optimized for 1024X768 screen resolution. </p>
                    <div class="img-box"><img src="images/1page-img.jpg">This website template can be delivered in two packages - with PSD source files included and without them. If you need PSD source files, please go to the template download page at TemplateMonster to leave the e-mail address that you want the template ZIP package to be delivered to.</div>

                    <p class="p0">This website template has several pages: <a href="index.html">Home</a>, <a href="about-us.html">About us</a>, <a href="articles.html">Articles</a> (with Article page), <a href="contact-us.html">Contact us</a> (note that contact us form – doesn’t work), <a href="sitemap.html">Site Map</a>.</p>
                 </div>
            
            </div>
        </div>
    </div>
    <div id="footer">
          <div class="container">
          <div class="inside">
             <div class="wrapper">
                <div class="fleft">24/7 Customer Service <span>8.800.146.56.7</span></div>
                <div class="aligncenter"><a rel="nofollow" href="http://www.templatemonster.com" class="new_window">Website template</a> designed by TemplateMonster.com<br>
                   <a href="http://www.html5xcss3.com" class="new_window">Html5xcss3.com</a></div>
             </div>
          </div>
          </div> 
    </div>
    </form>
</body>
</html>
