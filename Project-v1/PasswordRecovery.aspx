<%@ Page Title="Şifre Kurtarma" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs" Inherits="_PasswordRecovery" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h4 class="style1"> Şifre Kurtarma</h4>
    <p>
        &nbsp;</p>
    <p>
        Yeni şifrenizi almak için lütfen kullanıcı adınızı giriniz ve ardından güvenlik sorunuzu cevaplayınız.
    </p>
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" 
        UserNameInstructionText="" UserNameLabelText="Kullanıcı Adı:" 
        UserNameTitleText="" AnswerLabelText="Cevap:" 
        AnswerRequiredErrorMessage="Cevap gereklidir." 
        GeneralFailureText="Şifrenizi yenileme isteğiniz gerçekleştirilemedi. Lütfen tekrar deneyiniz." 
        onsendingmail="PasswordRecovery1_SendingMail" 
        QuestionFailureText="Cevabınız doğrulanamıyor. Lütfen tekrar deneyiniz." 
        QuestionInstructionText="Şifrenizi almak için lütfen aşağıdaki soruyu cevaplayınız." 
        QuestionLabelText="Soru:" QuestionTitleText="Kimlik Doğrulaması" 
        SuccessText="Yeni şifreniz mail adresinize gönderildi." 
        UserNameFailureText="Bilgilerinize ulaşılamadı. Lütfen tekrar deneyiniz." 
        UserNameRequiredErrorMessage="Kullanıcı Adı gereklidir." 
        SubmitButtonText="Gönder">
        <MailDefinition Subject="Bitirme Tezi Sitesi için Yeni Şifreniz" 
            BodyFileName="~/App_Data/PasswordRecovery.txt"></MailDefinition>
        <SubmitButtonStyle CssClass="MyButton" />
    </asp:PasswordRecovery>
</asp:Content>

