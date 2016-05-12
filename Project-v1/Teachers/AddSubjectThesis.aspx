<%@ Page Title="Tez Konusu Ekleme" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="AddSubjectThesis.aspx.cs" Inherits="Teachers_AddSubjectThesis" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="EntityDataSource1" CssClass="FormViewClass" 
        DefaultMode="Insert" oniteminserting="FormView1_ItemInserting">
        
        <InsertItemTemplate>
            <h4>Araştırma tezleri için yeni bir konu ekleyin. Bu konu bu yıl için geçerli olacaktır.</h4>
            <br />
            <asp:Label ID="subjectLabel" runat="server" CssClass="LabelClass" Text="Konu:"></asp:Label>
            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("Subject") %>' Width="320px"/>
            <asp:RequiredFieldValidator ID="subRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="subjectTextBox" ValidationGroup="ItemInserting" CssClass="ErrorMessage" Text="*"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="coursesLabel" runat="server" CssClass="LabelClass" Text="İlgili Dersler:"></asp:Label>
            <asp:TextBox ID="coursesTextBox" runat="server" Text='<%# Bind("Related_Courses") %>' Width="320px"/>
            <asp:RequiredFieldValidator ID="coursesRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="coursesTextBox" ValidationGroup="ItemInserting" CssClass="ErrorMessage" Text="*"></asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="contentLabel" runat="server" CssClass="LabelClass" Text="Araştırma Konusu:"></asp:Label>
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' TextMode="MultiLine" Width="320px" Height="130"/>
            <asp:RequiredFieldValidator ID="contentRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ContentTextBox" CssClass="ErrorMessage" ValidationGroup="ItemInserting" Text="*"></asp:RequiredFieldValidator>
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
        EnableInsert="True" EntitySetName="Research_Thesis" 
        Select="it.[Acd_id], it.[Related_Courses], it.[Content], it.[Year]">
    </asp:EntityDataSource>
</asp:Content>

