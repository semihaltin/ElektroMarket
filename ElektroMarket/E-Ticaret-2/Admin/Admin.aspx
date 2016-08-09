<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="E_Ticaret_2.Admin.Admin1" %>

<%@ Register Src="~/Admin/login.ascx" TagPrefix="uc1" TagName="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
         <uc1:login runat="server" id="login" />

    </asp:Panel>
   
</asp:Content>
