<%@ page import="yuan.ssm.vo.UserVo" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 16-5-1
  Time: 下午2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<% UserVo userVo= (UserVo) session.getAttribute("user"); %>
<%  String projectPath=request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>新闻推荐-关注兴趣</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=1200" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/base.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/global-base.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link rel="stylesheet" type="text/css" href="css/nalbase.css">
    <link rel="Stylesheet" type="text/css" href="css/DialogBySHF.css" />
    <link rel="Stylesheet" type="text/css" href="css/label.css" />
    <link rel='stylesheet' href="css/nprogress.css"/>
    <script src="js/nprogress.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/sliders.js"></script>
    <!--[if lt IE 9]>
    <script src="js/modernizr.js"></script>
    <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
    <link href="css/iefixed.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <script type="text/javascript" src="js/vivo-common.js"></script>
    <script type="text/javascript" src="js/prefixfree.min.js"></script>
    <script type="text/javascript" src="js/DialogBySHF.js"></script>

    <!-- 分页插件－simplePagination -->
    <link  rel="stylesheet" type="text/css" href="css/simplePagination.css" />
    <script src="js/simplePagination.js"></script>

    <script type="text/javascript">
        //分页实现：　itemsOnPage 当前页面的item总数
        $(function() {
            $("#paginationpage").pagination({
                items: ${count},
                itemsOnPage: 24,
                page:10,
                hrefTextPrefix:"?p=",
                cssStyle: 'light-theme',
                prevText:"上一页",
                nextText:"下一页",
                currentPage:${currentPage}

            });
        });

    </script>



</head>
<body class="products">
<!--header 开始-->
<div id="vivo-airbox"></div>
<div id="vivo-wrap">
    <div id="vivo-head">
        <div class="vivo-search">
            <div class="search-box">
                <form action='＃' method='get' style="background:#19a97b">
                    <input type="text" placeholder="随便输入哦" name='q' style="height:40px;font-size:18px;" autocomplete="off">
                    <button style="background:#800080;margin-left:15px;">搜索</button><a class="close"></a>
                </form>
                <div class="qk-results">
                    <ul>
                    </ul>
                    <div class="other-results"><a href="#">其他搜索结果</a></div>
                </div>
            </div>
        </div>
        <div class="vivo-nav cl">
            <a style="float:left;margin-left:12%;" href="<%=projectPath%>/html/pageIndex.action?p=1&type=2&nType=6"><img style="width:120px;margin:5px;" src="images/logo.png"></a>
            <div class="search-user">
                <%--<a href="#" class="search"><b></b></a>--%>
                <%
                  if(userVo==null){

                %>
                <a href="javascript:void(0)" class="user" onclick="btnDialog(0)"><b></b></a>
                <%
                    }else{
                %>
                   <img src="<%=userVo.getHead()%>" id="indexuser" style="" onclick="btnDialog(1)"/>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
<div id="vivo-contain"></div>
</div>
<!--header 结束-->
<!--菜单　开始-->
<div class="r_box f_r">
    <div class="nav">
        <ul>
            <li>
                <a href="<%=projectPath%>/html/pageIndex.action?p=1&type=2&nType=6">
                    新闻推荐首页
                </a>
            </li>
            <c:if test="${!empty sourceIfo.cateVos}">
                <c:forEach var="cate" items="${sourceIfo.cateVos}">
                    <li>
                        <a href="<%=projectPath%>/html/pageIndex.action?p=1&title=${cate.content}&type=2&nType=7">
                        <c:out value="${cate.content}"/>
                        </a>
                    </li>
                </c:forEach>
            </c:if>

            <c:if test="${!empty sourceIfo.sourceVos}">
                <c:forEach var="s" items="${sourceIfo.sourceVos}">
                    <li>
                        <a href="<%=projectPath%>/html/pageIndex.action?p=1&title=${s.source}&type=2&nType=8">
                            <c:out value="${s.source}"/>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <li>
                <a style="color: purple;" href="<%=projectPath%>/html/userLabelPage.action?p=1">
                    关注标签
                </a>
            </li>
        </ul>
    </div>
</div>
<!--菜单　-->
<article>
    <div class="l_box f_l">
        <div class="label_top">

            <h3>可以选择你要关注的兴趣标签(<label  class="label_show" style="color: #0c9c6e;font-size: 12px;">最多30个</label>)</h3>
            <hr>
            <label>兴趣标签总数：${count} </label>
            <label class="label_show" style="float: right;margin-right: 20px;color: #0c9c6e;">
                <c:if test="${labelCount==-1}">
                   <a href="javascript:void(0)" onclick="btnDialog(0)">登陆?</a>
                </c:if>
                <c:if test="${labelCount>-1}">
                    已关注（${labelCount}）
                </c:if>
            </label>
        </div>
        <div class="label_center">

            <c:if test="${empty tasteVos}">
                没有更多兴趣标签了
            </c:if>
            <c:if test="${!empty tasteVos}">
                <c:forEach var="taste" items="${tasteVos}">
                    <div class="center_item">
                        <label>${taste}</label>
                        <a href="javascript:void(0)" onclick="likeLabel('${taste}')">关注</a>
                    </div>
                </c:forEach>
            </c:if>
        </div>

        <div class="label_bottom">
            <hr>
            <c:if test="${count-labelCount>24}">
                <div id="paginationpage"></div>
            </c:if>
        </div>
    </div>
</article>





<footer>
    <p class="ft-copyright">copyright yuan.update 2016.04.19</p>
    <div id="tbox"> <a id="togbook" href="/"></a> <a id="gotop" href="javascript:void(0)"></a> </div>
</footer>
<!--菜单点击效果-->
<script type="text/javascript" src="js/nalbase.js"></script>
<script type="text/javascript">

    var loginUrl="<%=projectPath%>/html/login/userLoginPage.action";
    var userDetalUrl="<%=projectPath%>/html/login/userDetail.action";
    var labelCount=${labelCount};
    var uid=<%=userVo==null?0:userVo.getId()%>;
    var userAddLabel="<%=projectPath%>/html/login/userAddLabel.action";

    function btnDialog(type) {
        if(type==0) {
            showDialog(loginUrl);
        }else{
            showDialog(userDetalUrl);
        }
    }

    function likeLabel(label) {

        if(uid==0){
            btnDialog(0);
            return;
        }

        if(labelCount==-1){
            btnDialog(0);
            return;
        }

        if(labelCount>=30){
            $(".label_show").css("color","#ff0000");
            return;
        }
        var arr={
           label:label
        }
        dataRequest(userAddLabel,arr,1);
    }
    
    function showDialog(url) {
        $.DialogBySHF.Dialog({
            Width: 1024,
            Height: 500,
            Title: "个人中心",
            URL: url
        });
    }

    window.onload=function() {
        $('body').show();
        NProgress.start();
        setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
    }

    function doneIt() {
        NProgress.done();
    }

    //网络请求方法提取
    function dataRequest(typeurl,arr,type) {

        $.ajax({
            url:typeurl,
            data:arr,
            type:'post',
            cache:true,
            dataType:'json',
            success:function (data,status) {
                doneIt();
                if(type==1 && data==-1){
                    alert("你关注的标签以存在！");
                }else{
                    window.location.reload()
                }
            }
        });
    }

</script>
</body>
</html>
