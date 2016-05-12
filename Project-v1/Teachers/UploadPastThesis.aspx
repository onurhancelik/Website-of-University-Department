<%@ Page Title="Geçmiş Tarihli Tez Yükleme" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="UploadPastThesis.aspx.cs" Inherits="Teachers_UploadPastThesis" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" DataSourceID="EntityDataSource1" CssClass="FormViewClass" 
        DefaultMode="Insert" oniteminserting="FormView1_ItemInserting" 
        oniteminserted="FormView1_ItemInserted" >
        
        <InsertItemTemplate>
            <h4>Geçmiş yıllarda danışmanı olduğunuz eski tezleri siteye yükleyebilirsiniz.</h4>
            <br />
            <asp:Label ID="stdNameLabel" runat="server" CssClass="LabelClass" Text="Öğrenci Adı:"></asp:Label>
            <asp:TextBox ID="Std_nameTextBox" runat="server" 
                Text='<%# Bind("Std_name") %>' Width="200px"/>
            <asp:RequiredFieldValidator ID="nameRFV" runat="server"  ValidationGroup="ItemInserting" ControlToValidate="Std_nameTextBox" Display="Static" Text="*" CssClass="ErrorMessage"></asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="yearLabel" CssClass="LabelClass" runat="server" Text="Yıl:" ></asp:Label>
            <asp:DropDownList ID="yearDropDownList" runat="server">
            </asp:DropDownList>
            <br />

            <asp:Label ID="titleLabel" runat="server" CssClass="LabelClass" Text="Tez Adı:"></asp:Label>
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="200px" />
            <asp:RequiredFieldValidator ID="titleRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TitleTextBox" ValidationGroup="ItemInserting" CssClass="ErrorMessage" Text="*"></asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="contentLabel" runat="server" CssClass="LabelClass" Text="İçerik:"></asp:Label>
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' TextMode="MultiLine" Width="320px" Height="130"/>
            <asp:RequiredFieldValidator ID="contentRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ContentTextBox" CssClass="ErrorMessage" ValidationGroup="ItemInserting" Text="*"></asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="docLabel" runat="server" CssClass="LabelClass" Text="Dosya:"></asp:Label>
            <asp:FileUpload ID="documentFileUpload" runat="server" />
            <asp:RequiredFieldValidator ID="docRFV" runat="server" ErrorMessage="Bir dosya yüklemeniz gerekmektedir." ControlToValidate="documentFileUpload" Text="*" ValidationGroup="ItemInserting" CssClass="ErrorMessage"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="docREV" runat="server" ErrorMessage='Dosya uzantısı ".doc/.docx/.pdf" şeklinde olmalıdır.' ValidationExpression="(.*\.([dD][oO][cC]|[dD][oO][cC][xX]|[pP][dD][fF])$)" ValidationGroup="ItemInserting" ControlToValidate="documentFileUpload" CssClass="ErrorMessage"></asp:RegularExpressionValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Yükle" ValidationGroup="ItemInserting" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="İptal" />
            
        </InsertItemTemplate>
    </asp:FormView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=BitirmeTeziDatabaseEntities" 
        DefaultContainerName="BitirmeTeziDatabaseEntities" EnableFlattening="False" 
        EntitySetName="Past_Thesis" 
        
        Select="it.[Std_name], it.[Supervisor], it.[Content], it.[Title], it.[Document], it.[Year]" 
        EnableInsert="True">
    </asp:EntityDataSource>
</asp:Content>

