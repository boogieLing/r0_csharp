<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Curriculum</title>
    <link rel="stylesheet" href="css/default.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <h1 class="title_info">
                -TIMETABLE QUERY-
            </h1>
            <nav id="table_select">
                <input type="radio" name="tab" id="_class_1" checked="" />
                <label for="_class_1" class="class_1 change_class">
                    <span>CLASS 1</span>
                </label>
                <input type="radio" name="tab" id="_class_2" />
                <label for="_class_2" class="class_2 change_class">
                    <span>CLASS 2</span>
                </label>
                <input type="radio" name="tab" id="_class_3"/>
                <label for="_class_3" class="class_3 change_class">
                    <span>CLASS 3</span>
                </label>
                <div class="tab"></div>
            </nav>
        </div>
        <iframe src="class_table_1.html" frameborder="0" id="myframe"></iframe>
    </form>
</body>
<script>
    var class_list = document.getElementsByClassName("change_class");
    for(var i =0;i<class_list.length;i++){
        class_list[i].index = i;
        class_list[i].onclick=function(){
            var num=this.index+1 ;
            var tmp="class_table_"+num.toString()+".html" ;
            //console.log(tmp) ;
            document.getElementById("myframe").src=tmp ;
         }
     }
</script>
</html>
