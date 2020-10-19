<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>calculation & record</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://at.alicdn.com/t/font_1962070_wy8nexxh717.css">
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="aspx-body">
            <button id="start_but" >
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                -START-
            </button>
            <div class="num-box">
                <span class="number cal-1" id="cal_1">1</span>
                <span class="cal-font cal-now" id="cal_font">*</span>
                <span class="number cal-2" id="cal_2">3</span>
                <span class="cal-font">=</span>
                <div class="input-box">
                    <input type="text" id="ans_input" name="" required="required" value="" autocomplete="off">
                    <span>ans</span>
                </div>
            </div>
            <ul class="request-box" id="request_box">
            </ul>
            <div class="ac-rate">
                <i class="iconfont icon-CatFootprint"></i>
                <span>0%</span>
                <div class="tiny-ac-rate">
                    <span>0</span>
                    <span>/</span>
                    <span>0</span>
                </div>
            </div>
            
        </div>
    </form>
</body>
<script>
    var ac=0 ;
    var wa=0 ;
    var rate=0.0 ;
    $(document).ready(function () {
        setRandom() ;
        $("#start_but").click(function () {
            var num_1=$(".cal-1").text() ;
            var num_2=$(".cal-2").text() ;
            var cal_type=$(".cal-now").text() ;
            var ans=$("#ans_input").val();
            if (""==ans) {
                $("#ans_input~span").text("input empty!") ;
                return false ;
            } else {}
            $.ajax({
               type:"POST",
               data:"{ 'num_1': '"+num_1+"',"
                     +"'num_2': '"+num_2+"',"
                     +"'cal_type': '"+cal_type+"',"
                     +"'ans_input': '"+ans
                     +"' }",
               url: "index.aspx/ansStatus", 
               cache: false,
               contentType: "application/json", 
               //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
               dataType: "json",
               success: function(data, statues, xml) {
                    var result = data.d;
                    if ("true"==result) {
                        var new_res="<li><div class=\"formula-box\">"
                                    +num_1.toString()+cal_type.toString()+num_2.toString()
                                    +"="+ans.toString()
                                    +"</div><i class=\"iconfont icon-icon_gou\"></i></li>" ;
                        setRate(1) ;
                        if (100<=(ac+wa)) {
                            $(".request-box").children().first().remove();
                        } else {}
                        $(".request-box").append(new_res) ;
                    } else {
                        var new_res="<li><div class=\"formula-box\">"
                                    +num_1.toString()+cal_type.toString()+num_2.toString()
                                    +"="+ans.toString()
                                    +"</div><i class=\"iconfont icon-close-small\"></i></li>" ;
                        setRate(2) ;
                        if (100<=(ac+wa)) {
                            $(".request-box").children().first().remove();
                        } else {}
                        $(".request-box").append(new_res) ;
                    }
                    $("#ans_input").val("") ;
                    setRandom() ;
                },
                error: function(xhr, textStatus, errorThrown){
                    //alert("ERROR") ;
                    $("#ans_input~span").text("input error!") ;
                }
            });
            return false;
        });
    }) ;
    function randomNum(minNum,maxNum){ 
        switch(arguments.length){ 
            case 1: 
                return parseInt(Math.random()*minNum+1,10); 
            break; 
            case 2: 
                return parseInt(Math.random()*(maxNum-minNum+1)+minNum,10); 
            break; 
            default: 
                return 0; 
            break; 
        } 
    } 
    function setRandom() {
        var ran_1=randomNum(0,100) ;
        var ran_2=randomNum(0,100) ;
        while (0==ran_2) {
            ran_2=randomNum(0,100) ;
        }
        const tmp=["+","-","*","/"] ;
        var ran_index=randomNum(4) ;
        $(".cal-1").text(ran_1.toString()) ;
        $(".cal-2").text(ran_2.toString()) ;
        $(".cal-now").text(tmp[ran_index]) ;
    }
    function setRate(status) {
        var tmp ;
        if (1==status) {
            ++ac ;
            rate=(ac/(wa+ac))*100 ;
            
        } else {
            ++wa ;
            rate=(ac/(wa+ac))*100 ;
        }
        tmp=rate.toString() ;
        tmp=tmp.substring(0,6) ;
        tmp=tmp+"\%"
        $(".ac-rate>span").text(tmp) ;
        $(".tiny-ac-rate>span:first-child").text(ac) ;
        $(".tiny-ac-rate>span:last-child").text(wa) ;
        $("#ans_input~span").text("ans") ;
    }
</script>
</html>
