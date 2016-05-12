<%@ Page Title="Araştırma Konuları" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="ResearchThesis.aspx.cs" Inherits="Students_ResearchThesis" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h4>Bu yıl öğretim üyelerince belirlenen lisans tezlerine dair araştırma konuları aşağıdadır.</h4>
    <asp:Repeater ID="Repeater1" runat="server" >
        <ItemTemplate>
            <asp:Label ID="subLabel" runat="server" CssClass="LabelClass" Text="Konu:"></asp:Label>
            <asp:Literal ID="Literal2" Text='<%# Eval("Subject") %>'  runat="server"></asp:Literal>
            <br />
            <asp:Label ID="acdNameLabel" runat="server" CssClass="LabelClass" Text="Öğretim Üyesi:"></asp:Label>
            <asp:Literal ID="Literal1" Text='<%# Eval("Academic") %>' runat="server">
            </asp:Literal>  
            <br />
            <asp:Label ID="relLabel" runat="server" CssClass="LabelClass" Text="İçerik:"></asp:Label>
            <asp:Literal ID="Literal3" Text='<%# Eval("Content") %>' runat="server">
            </asp:Literal> 
            <br />
            <br />
        </ItemTemplate>
    </asp:Repeater>   

</asp:Content>

