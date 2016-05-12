<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="Controls_ContactForm" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style4
    {
        height: 20px;
    }
    .style6
    {
        height: 19px;
    }
    .style7
    {
        height: 19px;
        width: 121px;
    }
    .style8
    {
        height: 20px;
    }
    .style9
    {
        width: 121px;
    }
    .style10
    {
        height: 19px;
        width: 151px;
    }
    .style11
    {
        height: 20px;
        width: 151px;
    }
    .style12
    {
        width: 151px;
    }
</style>

<script type="text/javascript">
    function ValidatePhoneNumbers(source, args) {
        var phoneMobile = document.getElementById('<%= mobileTextBox.ClientID %>');
        var phoneBusiness = document.getElementById('<%= businessTextBox.ClientID %>');

        if (phoneMobile.value != '' || phoneBusiness.Value != '') {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="style1" runat="server" id="FormTable">
        <tr>
            <td colspan="3">
                Bu formu kullanarak bize ulaşabilirsiniz.<br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style7">
                Ad Soyad</td>
            <td class="style10">
                <asp:TextBox ID="nameTextBox" runat="server" Width="159px"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="nameTextBox" CssClass="ErrorMessage" 
                    ErrorMessage="Ad-soyad giriniz.">* Ad-soyad giriniz.</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                E-posta</td>
            <td class="style11">
                <asp:TextBox ID="emailTextBox" runat="server" Width="159px"></asp:TextBox>
            </td>
            <td class="style4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="emailTextBox" CssClass="ErrorMessage" Display="Dynamic" 
                    ErrorMessage="E-mail adresinizi giriniz.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="emailTextBox" CssClass="ErrorMessage" Display="Dynamic" 
                    ErrorMessage="Geçerli bir e-mail adresi giriniz." 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                E-posta(tekrar)</td>
            <td class="style11">
                <asp:TextBox ID="emailCheckTextBox" runat="server" Width="159px"></asp:TextBox>
            </td>
            <td class="style4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="emailCheckTextBox" CssClass="ErrorMessage" Display="Dynamic" 
                    ErrorMessage="E-mail adresinizi doğrulayınız.">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="emailTextBox" ControlToValidate="emailCheckTextBox" 
                    CssClass="ErrorMessage" ErrorMessage="E-mail adresinizi tekrar giriniz.">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Cep Telefonu</td>
            <td class="style12">
                <asp:TextBox ID="mobileTextBox" runat="server" Width="159px"></asp:TextBox>
            </td>
            <td>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ClientValidationFunction="ValidatePhoneNumbers" CssClass="ErrorMessage" 
                    Display="Dynamic" ErrorMessage="Cep veya iş telefonunuzu giriniz." 
                    onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                İş Telefonu</td>
            <td class="style12">
                <asp:TextBox ID="businessTextBox" runat="server" Width="159px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                Konu</td>
            <td class="style12">
                <asp:TextBox ID="subjectTextBox" runat="server" Width="159px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="subjectTextBox" CssClass="ErrorMessage" Display="Dynamic" 
                    ErrorMessage="Konu başlığı giriniz.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Açıklama</td>
            <td class="style12">
                <asp:TextBox ID="descriptionTextBox" runat="server" Height="177px" 
                    TextMode="MultiLine" Width="356px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="descriptionTextBox" CssClass="ErrorMessage" 
                    Display="Dynamic" ErrorMessage="Açıklama giriniz.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style12">
                <asp:Button ID="sendButton" runat="server" Text="Gönder" 
                    onclick="sendButton_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    CssClass="ErrorMessage" 
                    HeaderText="Lütfen aşağıdaki hataları düzeltiniz." />
            </td>
        </tr>
    </table>

    <asp:Label ID="Message" runat="server" Text="Form gönderildi." Visible="false"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        <div class="PleaseWait">
            Lütfen Bekleyiniz...
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
