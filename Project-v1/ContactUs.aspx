<%@ Page Title="Bize Ulaşın" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="_ContactUs" %>

<%@ Register src="Controls/ContactForm.ascx" tagname="ContactForm" tagprefix="uc1" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    
    <uc1:ContactForm ID="ContactForm1" runat="server" />
    
</asp:Content>

