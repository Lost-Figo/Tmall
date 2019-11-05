<%--
  Created by IntelliJ IDEA.
  User: zengxiongqiang
  Date: 2019/10/26
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>



<form method="post" action="reg.user" class="registerForm">


    <div class="registerDiv">
        <div class="registerErrorMessageDiv">
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                <span class="errorMessage"></span>
            </div>
        </div>


        <TABLE width="400" border="1">
            <caption style="text-align: center;font-size: xx-large"> 收货地址</caption>

            <tr height="25">
                <th>地址信息编号</th>
                <th>收货地址</th>
                <th>邮编号</th>
                <th>收货人姓名</th>
                <th>电话号码</th>
                <th  colspan="2">操    作</th>

            </tr>
            <%--<%--%>
            <%--for(Product p:list){--%>
            <%--%>--%>
            <c:forEach items="${list}" var="p">
                <TR>
                    <td>
                       ${p.addid}
                    </td>
                    <TD>
                            ${p.address}
                    </TD>
                    <td>
                            ${p.post}
                    </td>
                    <td>
                            ${p.recevier}
                    </td>
                    <td>
                            ${p.phone}
                    </td>
                   <td>
                       <A href="javascript:delete1(${p.addid})">删    除</A>
                   </td>
                    <td>
                        <A href="javascript:update(${p})">修    该</A>
                    </td>
                    <script>
                        function delete1(addid) {
                            $ajax({
                                url:"delete.dress",
                                type:"post",
                                data:{
                                    addid:addid
                                },
                                success:function(data){
                                    alert("已经删除")
                                },
                                error:function(error){
                                    alert(error);
                                }
                            });
                        }


                        function update(p) {
                            $ajax({
                                url:"update.dress",
                                type:"post",
                                data:{
                                    addid:${p.addid},
                                    address:${p.address},
                                    post:${p.post},
                                    recevier:${p.recevier},
                                    phone:${p.phone}

                                },
                                success:function(data){
                                    alert("修改成功！！！")
                                },
                                error:function(error){
                                    alert(error);
                                }
                            });
                        }
                    </script>
                </TR>

            </c:forEach>

          <tr>
              <td colspan="7">
                  <hr noshade="noshade" />
                  <span style="font-family: 幼圆; text-align: center " > 增加收货地址</span>
              </td>
          </tr>
            <form action="add.dress" method="post">
                <tr>

                    <td><input type="text" name="null" value="自动生成"></td>

                    <td><input type="text" name="address"></td>
                    <td><input type="text" name="post"></td>
                    <td><input type="text" name="receiver"></td>
                    <td><input type="text" name="phone"></td>

                    <td><input type="submit" name="增加地址"></td>
                </tr>


</form>


</TABLE>



    </div>
</form>
