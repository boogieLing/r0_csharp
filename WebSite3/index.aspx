<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
.views {
    position: relative ;
    box-sizing: border-box ;
    margin-left: 20px ;
    margin-right: 20px ;
    flex: 1 ;
    display: flex ;
    flex-direction: row ;
    justify-content: center;
    align-items: center ;
    transition: 0.3s ;
}
.views img{
    position: relative ;
    display: inline-block ;
    border: 2px solid  white ;
    box-shadow: 0 0 10px rgba(99, 110, 114,1.0) ;
    width: 100% ;
    height: 100% ;
    user-select: none ;
    transition: 0.3s ;
}
.center-box:hover img{
    width: 80% ;
    height: 80% ;
}
.views>img:hover {
    width: 150% ;
    height: 150% ;
    z-index: 10 ;
}
</style>
    <div class="views">
        <img src="img/1.jpg" alt="">
    </div>
    <div class="views">
        <img src="img/2.jpg" alt="">
    </div>
    <div class="views">
        <img src="img/3.jpg" alt="">
    </div>
</asp:Content>