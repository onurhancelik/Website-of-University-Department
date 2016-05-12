<%@ Page Title="Tez Geniş Görünümü" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="ThesisExtendView.aspx.cs" Inherits="_ThesisExtendView" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:Button ID="Button1" runat="server" Text="Fill Form in Popup" />
    <cc1:modalpopupextender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="Button1"
    CancelControlID="Button2" BackgroundCssClass="Background"></cc1:modalpopupextender>
    <asp:Panel ID="Panel1" runat="server" CssClass="Popup" style = "display:none" BackColor="#FF5050">
        <table>
            <tr>
            <td>
            <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="First Name"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBox1" runat="server" Font-Size="14px" ></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="Label2" runat="server" CssClass="lbl" Text="Middle Name"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBox2" runat="server" Font-Size="14px" ></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="Label3" runat="server" CssClass="lbl" Text="Last Name"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBox3" runat="server" Font-Size="14px" ></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="Label4" runat="server" CssClass="lbl" Text="Gender"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBox4" runat="server" Font-Size="14px" ></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="Label5" runat="server" CssClass="lbl" Text="Age"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBox5" runat="server" Font-Size="14px" ></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="Label6" runat="server" CssClass="lbl" Text="City"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBox6" runat="server" Font-Size="14px" ></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="Label7" runat="server" CssClass="lbl" Text="State"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBox7" runat="server" Font-Size="14px" ></asp:TextBox>
            </td>
            </tr>
        </table>
    <br />
    <asp:Button ID="Button2" runat="server" Text="Close" />
    <asp:Button ID="Button3" runat="server" Text="Button" onclick="Button3_Click" />
</asp:Panel>
</asp:Content>

