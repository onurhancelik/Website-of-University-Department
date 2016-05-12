<%@ Page Title="Güncel Tezler" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="CurrentThesis.aspx.cs" Inherits="Teachers_CurrentThesis" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
<h3>Danışmanı olduğunuz güncel tezler</h3>
<h4>Tez numarasına tıklayarak ayrıntılı tez bilgilerine ulaşıp, tezi onaylama kısmına ulaşabilirsiniz.</h4>
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

            <asp:CheckBoxField DataField="Approval" HeaderText="Onay" 
                SortExpression="Approval" />

        </Columns>  
        
<HeaderStyle CssClass="GridViewHeader"></HeaderStyle>
        
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
        <asp:Button ID="approvalButton" runat="server" Text="ONAYLA" 
            onclick="approvalButton_Click" />
    </asp:Panel>      
</asp:Content>

