<%--
  Created by IntelliJ IDEA.
  User: ZhangJunjie
  Date: 2020/4/29
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<!--员工修改模态框-->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empId_update_static" class="col-sm-2 control-label">员工ID</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empId_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-4">
                            <label>
                                <select class="form-control" id="dept_update_select" name="dId">
                                </select>
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_button">修改</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="请输入员工姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_add_input"
                                   placeholder="请输入邮箱地址">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-4">
                            <label>
                                <select class="form-control" name="dId" id="dept_add_select">
                                </select>
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_button">更新</button>
            </div>
        </div>
    </div>
</div>

<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row page-header">
        <div class="col-md-12">
            <h1>增删改查</h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" data-toggle="modal" id="emp_add_model">添加</button>
            <button class="btn btn-danger" id="emp_delete_all_button">删除</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_tables">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all">
                    </th>
                    <th>员工ID</th>
                    <th>员工姓名</th>
                    <th>员工性别</th>
                    <th>email地址</th>
                    <th>部门名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!--显示分页信息-->
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">
        </div>
        <!--分页条信息-->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">

    //页面加载完成后发送一个ajax请求获取分页数据
    $(function () {
        to_page(1);
    });

    //表单信息填充
    function build_emps_table(result) {
        //清空table表格
        $("#emps_tables tbody").empty();

        const emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            const checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            const empIdTd = $("<td></td>").append(item.empId);
            const empNameTd = $("<td></td>").append(item.empName);
            const gender = item.gender === "M" ? "男" : "女";
            const empGenderTd = $("<td></td>").append(gender);
            const emailTd = $("<td></td>").append(item.email);
            const deptNameTd = $("<td></td>").append(item.department.deptName);

            //增删按钮
            const editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加自定义属性表示当前员工id
            editBtn.attr("edit-id", item.empId);
            editBtn.attr("edit-name", item.empName);
            const delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加自定义属性表示当前员工id
            delBtn.attr("del-id", item.empId);
            const btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //append方法执行完成后返回原来的元素
            $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(empGenderTd).append(emailTd).append(deptNameTd).append(btnTd).appendTo("#emps_tables tbody");
        })
    }

    //解析显示分页信息
    function build_page_info(result) {

        //清空分页信息
        $("#page_info_area").empty();

        $("#page_info_area").append("当前是第" + result.extend.pageInfo.pageNum + "页,共" + result.extend.pageInfo.pages + "页，共" + result.extend.pageInfo.total + "条记录")

    }

    function to_page(pn) {

        $.ajax({
            url: "${pageContext.request.contextPath}/res",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //解析并显示员工数据
                build_emps_table(result);
                //解析并显示分页信息
                build_page_info(result);
                //解析显示分页条信息
                build_page_nav(result);
            }
        })
    }

    //解析显示分页条,功能实现
    function build_page_nav(result) {

        //清空分页信息
        $("#page_nav_area").empty();

        const ul = $("<ul></ul>").addClass("pagination");

        if (result.extend.pageInfo.hasPreviousPage) {
            const firstPageLi = $("<li></li>").append(($("<a></a>")).append("首页").attr("href", "#"));
            firstPageLi.click(function () {
                to_page(1);
            })
            ul.append(firstPageLi);
        }
        if (result.extend.pageInfo.pageNum !== 1) {
            const prePageLi = $("<li></li>").append(($("<a></a>")).append("&laquo;"));
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            })
            ul.append(prePageLi);
        }

        //遍历添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            const numLi = $("<li></li>").append(($("<a></a>")).append(item));
            if (result.extend.pageInfo.pageNum === item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            })
            ul.append(numLi);
        })

        if (result.extend.pageInfo.pageNum !== result.extend.pageInfo.pages) {
            const nextPageLi = $("<li></li>").append(($("<a></a>")).append("&raquo;"));
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            })
            ul.append(nextPageLi);
        }

        if (result.extend.pageInfo.hasNextPage) {
            const lastPageLi = $("<li></li>").append(($("<a></a>")).append("尾页").attr("href", "#"));
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            })
            ul.append(lastPageLi);
        }

        //把ull添加到nav
        const navEle = $("<nav></nav>").append(ul);

        //添加到Div中
        navEle.appendTo("#page_nav_area");
    }

    //点击新增弹出模态框
    $("#emp_add_model").click(function () {

        //显示下拉菜单数据
        getDepts("#empAddModal select");
        //模态框弹出
        $("#empAddModal").modal({
            backdrop: "static"
        })
    })

    //查出所有部门信息并添加到下拉列表
    function getDepts(element) {
        $.ajax({
            url: "${pageContext.request.contextPath}/depts",
            type: "GET",
            success: function (result) {
                $.each(result.extend.depts, function () {
                    const optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    $(element).append(optionEle);
                })
            }
        })
    }

    jQuery("#empName_add_input").change(function () {
        //ajax校验用户名是否可用
        const empName = this.value;
        $.ajax({
            url: "${pageContext.request.contextPath}/check",
            data: "empName=" + empName,
            success: function (result) {
                if (result.code !== 100) {
                    show_validate_msg("#empName_add_input", "error", "用户名已存在");
                    $("#emp_save_button").attr("ajax-va", "false");
                } else {
                    show_validate_msg("#empName_add_input", "success", "");
                    $("#emp_save_button").attr("ajax-va", "success");
                }
            }
        })
    })

    function validate_add_form() {

        //判断用户校验是否成功
        if ($("#emp_save_button").attr("ajax-va") !== "success") {
            return false;
        }

        //校验数据,使用正则表达式
        //检查用户名
        const empName = $("#empName_add_input").val();
        const regName = /(^[a-z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input", "error", "用户名要求2-5位中文或者6-15英文数字组合");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "用户名格式正确");
        }
        //检查邮箱
        const email = $("#email_add_input").val();
        const regEmail = /^\w+((-\w+)|(\.\w+))*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "请输入正确的邮箱地址");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "邮箱格式正确");
        }
        return true;
    }

    //显示校验结果信息
    function show_validate_msg(element, status, msg) {
        //清楚校验状态
        $(element).parent().removeClass("has-success has-error");
        $(element).next("span").text("");
        if (status === "success") {
            $(element).parent().addClass("has-success");
            $(element).next("span").text(msg);
        } else {
            $(element).parent().addClass("has-error");
            $(element).next("span").text(msg);
        }
    }

    //数据提交
    jQuery("#emp_save_button").click(function () {

        //先校验数据
        if (validate_add_form()) {
            $.ajax({
                url: "${pageContext.request.contextPath}/res",
                type: "POST",
                data: $("#empAddModal form").serialize(),
                success: function (result) {
                    alert(result.msg);
                    if (result.code === 100) {
                        $("#empAddModal form")[0].reset();
                        $("#empName_add_input").parent().removeClass("has-success has-error");
                        $("#empName_add_input").next("span").text("");
                        $("#email_add_input").parent().removeClass("has-success has-error");
                        $("#email_add_input").next("span").text("");
                        $("#empAddModal").modal('hide');
                        to_page(1);
                    } else if (result.code === 200) {
                        //显示失败信息
                        if (undefined !== result.extend.errorMsg.email) {
                            show_validate_msg("#email_add_input", "error", result.extend.errorMsg.email);
                        } else if (undefined !== result.extend.errorMsg.empName) {
                            show_validate_msg("#empName_add_input", "error", result.extend.errorMsg.empName);
                        }
                    }
                }
            })
        } else {

        }
    })

    //用户信息修改，绑定单击事件，由于按钮是加载完数据再添加上去的所以不能通过原始方法绑定
    $(document).on("click", ".edit_btn", function () {
        const empId = $(this).attr("edit-id");
        const empName = $(this).attr("edit-name");
        //查出员工信息并显示员工信息
        getEmp(empId, empName);
        //查出部门信息并显示部门列表
        getDepts("#empUpdateModal select");
        $("#emp_update_button").attr("edit-id", empId);
        //弹出模态框
        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    })

    //查询员工信息并请求
    function getEmp(empId, empName) {
        $.ajax({
            url: "${pageContext.request.contextPath}/res/" + empId,
            type: "GET",
            success: function (result) {
                //拿到员工数据
                const empData = result.extend.emp;
                //在指定位置填充数据
                $("#empId_update_static").text(empId);
                $("#empName_update_static").text(empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        })
    }

    //更新功能实现
    $("#emp_update_button").click(function () {
        //检查邮箱
        const email = $("#email_update_input").val();
        const regEmail = /^\w+((-\w+)|(\.\w+))*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "请输入正确的邮箱地址");
            return;
        } else {
            show_validate_msg("#email_update_input", "success", "邮箱格式正确");
        }
        //发送Ajax请求
        $.ajax({
            url: "${pageContext.request.contextPath}/res/" + $(this).attr("edit-id"),
            type: "PUT",
            data: $("#empUpdateModal form").serialize(),
            success: function (result) {
                alert(result.msg);
                if (result.code === 100) {
                    $("#email_update_input").parent().removeClass("has-success has-error");
                    $("#email_update_input").next("span").text("");
                    $("#empUpdateModal").modal('hide');
                    to_page(1);
                } else if (result.code === 200) {
                    //显示失败信息
                    if (undefined !== result.extend.errorMsg.email) {
                        show_validate_msg("#email_add_input", "error", result.extend.errorMsg.email);
                    } else if (undefined !== result.extend.errorMsg.empName) {
                        show_validate_msg("#empName_add_input", "error", result.extend.errorMsg.empName);
                    }
                }
            }
        })
    })

    //删除功能实现
    $(document).on("click", ".delete_btn", function () {
        //弹出是否删除的确定框
        const empName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除：【" + empName + "】的信息吗？")) {
            $.ajax({
                url: "${pageContext.request.contextPath}/res/" + $(this).attr("del-id"),
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page(1);
                }
            })
        } else {
            alert("确定好了再来！");
            to_page(1);
        }
    })

    //完成全选、反选
    $("#check_all").click(function () {
        //prop是dom原生的属性，attr是自定义属性
        $(document)
        $(".check_item").prop("checked", $(this).prop("checked"));
    })

    //单选后取消全选按钮
    $(document).on("click", ".check_item", function () {
        //判断当前选中的元素是否为五个
        $("#check_all").prop("checked", $(".check_item:checked").length === 5);
    })

    //点击全部删除
    $("#emp_delete_all_button").click(function () {
        let names = "";
        let ids = "";
        $.each($(".check_item:checked"), function () {
            names += $(this).parents("tr").find("td:eq(2)").text() + " ";
            ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
        })
        if (confirm("确认删除【" + names + "】信息嘛？")) {
            const name = $(this).parents("tr").find("td:eq(2)").text();
            $.ajax({
                url: "${pageContext.request.contextPath}/res/" + ids,
                type: "DELETE",
                success: function (result) {
                    alert(name + result.msg);
                    to_page(1);
                }
            })
        } else {
            alert("确认好了再来吧！")
        }
    })

</script>
</body>
</html>
