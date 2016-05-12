<%@ Page Title="Tez Bilgilerim" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="MyThesis.aspx.cs" Inherits="Students_MyThesis" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert"  >
        
        <InsertItemTemplate>
            <h5>Henüz bir tez yüklemediniz, hazır bir teziniz varsa aşağıdaki formu doldurarak tezinizi yükleyebilir ya da Güncel Tez Konuları hakkında fikir edinmek için 
             <div class="linkNoVisit"><a href="ResearchThesis.aspx">Tez Konusu Araştır</a>  bölümünü inceleyebilirsiniz.</div></h5>
            <br />  
            <br />
            <h4>Tez Yükleme Formu</h4>
            <asp:Label ID="supLabel" runat="server" CssClass="LabelClass" Text="Danışman:"></asp:Label>
            <asp:DropDownList ID="supervisorDropDown" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Label ID="titleLabel" runat="server" CssClass="LabelClass" Text="Tez Adı:"></asp:Label>
            <asp:TextBox ID="TitleTextBox" runat="server"  Width="200px" />
            <asp:RequiredFieldValidator ID="titleRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TitleTextBox" ValidationGroup="ItemInserting" CssClass="ErrorMessage" Text="*"></asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="contentLabel" runat="server" CssClass="LabelClass" Text="Özet:"></asp:Label>
            <asp:TextBox ID="ContentTextBox" runat="server" TextMode="MultiLine" Width="500px" Height="130"/>
            <asp:RequiredFieldValidator ID="contentRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ContentTextBox" CssClass="ErrorMessage" ValidationGroup="ItemInserting" Text="*"></asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="docLabel" runat="server" CssClass="LabelClass" Text="Dosya:"></asp:Label>
            <asp:FileUpload ID="documentFileUpload" runat="server" />
            <asp:RequiredFieldValidator ID="docRFV" runat="server" ErrorMessage="Bir dosya yüklemeniz gerekmektedir." ControlToValidate="documentFileUpload" Text="*" ValidationGroup="ItemInserting" CssClass="ErrorMessage"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="docREV" runat="server" ErrorMessage='Dosya uzantısı ".doc/.docx/.pdf" şeklinde olmalıdır.' ValidationExpression="(.*\.([dD][oO][cC]|[dD][oO][cC][xX]|[pP][dD][fF])$)" ValidationGroup="ItemInserting" ControlToValidate="documentFileUpload" CssClass="ErrorMessage"></asp:RegularExpressionValidator>
            <br />
            <asp:Button ID="InsertButton" runat="server" Text="Yükle" ValidationGroup="ItemInserting" 
                onclick="InsertButton_Click" />

        </InsertItemTemplate>

        <EditItemTemplate>
            <h5>Güncel ve yüklü olan tezinize ait bilgiler aşağıda görünmektedir. Tezinize ait bilgileri ve tez dökümanınızı buradan güncelleyebilirsiniz.</h5>
            <br />
            <h4>Tez Bilgileriniz</h4>
            <br />

            <asp:Label ID="Label1" runat="server" CssClass="LabelClass" Text="Tez Durumu:"></asp:Label>  
            <asp:Label ID="statusText" runat="server" Text='Onaylanmadı' Width="200px" ForeColor="Red" />  
            <br />
            <asp:Label ID="sup2Label" runat="server" CssClass="LabelClass" Text="Danışman:"></asp:Label>
            <asp:TextBox ID="sup2TextBox" runat="server" 
                Text='<%# Bind("Supervisor") %>' Width="200px" ReadOnly="true"/>
            
            <br />            
            <asp:Label ID="title2Label" runat="server" CssClass="LabelClass" Text="Konu Adı:"></asp:Label>
            <asp:TextBox ID="title2TextBox" runat="server" 
                Text='<%# Bind("Title") %>' Width="200px"/>
            <asp:RequiredFieldValidator ID="name2RFV" runat="server"  ValidationGroup="ItemUpdating" ControlToValidate="title2TextBox" Display="Static" Text="*" CssClass="ErrorMessage"></asp:RequiredFieldValidator>
            <br />
                
            <asp:Label ID="content2Label" runat="server" CssClass="LabelClass" Text="Özet:"></asp:Label>
            <asp:TextBox ID="Content2TextBox" runat="server" Text='<%# Bind("Content") %>' TextMode="MultiLine" Width="320px" Height="130"/>
            <asp:RequiredFieldValidator ID="content2RFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Content2TextBox" CssClass="ErrorMessage" ValidationGroup="ItemUpdating" Text="*"></asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="doc2Label" runat="server" CssClass="LabelClass" Text="Döküman:"></asp:Label>
            <asp:LinkButton ID="docLinkButton" runat="server" Text='<%# Bind("Document") %>' 
                onclick="docLinkButton_Click"></asp:LinkButton>
            
            <br />
            <asp:FileUpload ID="doc2FileUpload" runat="server" style="margin-left:90px;margin-top:10px;" Width="200px" />
            <br />
            <asp:RegularExpressionValidator ID="doc2REV" runat="server" style="margin-left:90px;" ErrorMessage='Dosya uzantısı ".doc/.docx/.pdf" şeklinde olmalıdır.' 
            ValidationExpression="(.*\.([dD][oO][cC]|[dD][oO][cC][xX]|[pP][dD][fF])$)" ValidationGroup="ItemUpdating" ControlToValidate="doc2FileUpload" CssClass="ErrorMessage"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button ID="saveButton" runat="server" Text="Değişiklikleri Kaydet" 
                ValidationGroup="ItemUpdating" onclick="saveButton_Click"/>
        </EditItemTemplate>
    </asp:FormView>  
</asp:Content>

