普通标量测试：
<#if num0==18>18岁，成年了！</#if><#--数字 -->
<#if user=="老高">欢迎你</#if><#--字符串-->
<#if b2>b2是true！</#if>  <#--布尔值-->
${date1?string("yyyy-MM-dd HH:mm:ss")} 格式化日期
<#-- ${date1.toString()}????时间怎么处理??  -->
-----------------------------------------------
普通变量和javabean测试：
你好啊，${user}，${user1.uname},今天你的精神不错!
${user2.uname}来自${user2.addr.city},那里好玩吗?
-----------------------------------------------
List数据测试：
${lst[0].city},
${lst[1].city},
${lst[2].city},
------------------------------------------------
内建函数：
${htm2?html}
-------------------------------------------------
测试空值处理：
<#-- ${sss} 没有定义这个变量，会报异常！ -->
${sss!} <#--没有定义这个变量，默认值是空字符串！ -->
${sss!"abc"} <#--没有定义这个变量，默认值是字符串abc！ -->
------------------------------------------------
if语句测试：
${user}是<#if user=="老高">我们的老师</#if>
------------------------------------------------
if else 语句测试：
<#if num0 gt 18>  <#--不是使用>，大部分时候，freemarker会把>解释成标签结束！ -->
    及格！
<#else>
    不及格！
</#if>
---------------------------------------------------
if else if else语句测试：
<#if random gte 90>
    优秀！
<#elseif random gte 80>
    良好！
<#else>
    一般！ 
</#if>
----------------------------------------------------
测试list指令：
<#list lst as dizhi >
    <b>dizhi</b> <br/>
</#list>
----------------------------------------------------
测试include指令：
<#include "included.txt" />
----------------------------------------------------
<#macro m1>   <#--定义指令m1 -->
    <b>aaabbbccc</b>
    <b>dddeeefff</b>
</#macro>

<@m1 /><@m1 />  <#--调用上面的宏指令 -->
------------------------------------------------------
<#macro m2 a b c >
    ${a}--${b}--${c}
</#macro>
<@m2 a="老高" b="老张" c="老马" />
----------------------------------------------------
<#macro border> 
  <table border=4 cellspacing=0 cellpadding=4><tr><td> 
    <#nested> 
  </td></tr></table> 
</#macro> 
<@border >表格中的内容！</@border>
-------------------------------------------------------
测试命名空间：
<#import "b.ftl" as bb  />
<@bb.copyright date="2010-2011" />
${bb.mail}
<#assign mail="my@163.com"  />
${mail}
<#assign mail="my@163.com" in bb  />
${bb.mail}