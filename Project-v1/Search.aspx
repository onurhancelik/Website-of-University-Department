<%@ Page Title="Tez Arama" Language="C#"  EnableEventValidation="true"  MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h4>Şimdiye kadar tamamlanmış tüm onaylı tezlere buradan ulaşabilirsiniz. Tez numarasına tıklayarak ayrıntılı bir şekilde ilgili tezi incelebilirsiniz.</h4><br />
            <table class="style1">
                <tr>
                    <td>Tarama Terimi Giriniz</td>
                    <td>Aranacak Alan</td>
                    <td>Yıl</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="keyTextBox" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:DropDownList ID="typeDropDownList" runat="server">
                            <asp:ListItem>Tez Adı</asp:ListItem>
                            <asp:ListItem>Danışman</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="yearDropDown" runat="server" AutoPostBack="True" 
                        CausesValidation="True" 
                        onselectedindexchanged="yearDropDown_SelectedIndexChanged">
                        <asp:ListItem>Tümü</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="searchButton" runat="server" Text="Ara" 
                            onclick="searchButton_Click" />
                        <asp:Button ID="clearButton" runat="server" Text="Yenile" 
                            onclick="clearButton_Click" />
                     </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" CssClass="GridViewClass" runat="server" AutoGenerateColumns="False"  
                onrowdatabound="GridView1_RowDataBound" HorizontalAlign="Left" HeaderStyle-CssClass="GridViewHeader">
                <Columns>
                    <asp:BoundField DataField="Thesis_id" HeaderText="Tez No" SortExpression="Thesis_id">

                    </asp:BoundField>
                    <asp:BoundField DataField="Std_name" HeaderText="Öğrenci Adı" SortExpression="Std_name">
                        <ItemStyle CssClass="GridViewCell" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Year" HeaderText="Yıl" SortExpression="Year">
                        <ItemStyle CssClass="GridViewCell" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Tez Adı" SortExpression="Title">
                        <ItemStyle CssClass="GridViewCell" />
                    </asp:BoundField>
                </Columns>  
        
            </asp:GridView>

            <asp:Button ID="showPopupButton" runat="server" Text="Button" style="display:none"/>

            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="showPopupButton" PopupControlID="Panel1"
                       CancelControlID="cancelButton"></cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" BorderWidth="1" BackColor="#f0f5f9" Height="400" Width="620px" style="display:none">
                <div id="headerExtend">Detaylı Tez Bilgileri <div id="extendClose"> 
                    <asp:Button ID="cancelButton" runat="server" Text="Kapat" 
                        onclick="cancelButton_Click" /> </div></div><br />
                <asp:DetailsView ID="DetailsView1" runat="server" Height="300px" Width="600px" 
                    AutoGenerateRows="False" FieldHeaderStyle-CssClass="DetailsViewHeader" 
                    HeaderStyle-CssClass="DetailsViewHeader">
                    <Fields>
                            <asp:BoundField DataField="Thesis_id" HeaderText="Tez No" SortExpression="Thesis_id"/>
                            <asp:BoundField DataField="Std_name" HeaderText="Öğrenci Adı" SortExpression="Std_name"/>
                            <asp:BoundField DataField="Year" HeaderText="Yıl" SortExpression="Year"/>
                            <asp:BoundField DataField="Supervisor" HeaderText="Danışman" SortExpression="Supervisor" />
                            <asp:BoundField DataField="Title" HeaderText="Tez Adı" SortExpression="Title"/>
                            <asp:BoundField DataField="Content" HeaderText="Özet" SortExpression="Content" />
                            <asp:BoundField DataField="Document" HeaderText="İndirme" SortExpression="Document" />
                    </Fields>
                </asp:DetailsView>  
                <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" 
                    ImageUrl="~/Images/download.png" onclick="ImageButton1_Click" Width="50px" />  
            </asp:Panel>             
          </ContentTemplate>
    </asp:UpdatePanel>   
</asp:Content>

