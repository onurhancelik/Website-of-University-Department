<%@ Page Title="Profil Sayfam" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Teachers_MyProfile" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
                <table id="formTable">
                    <tr>
                        <td align="center" colspan="2" 
                            style="color:White;background-color:#008CC4;font-weight:bold">Profilim</td>
                    </tr>
                    <tr>
                        <td> <asp:Label ID="usernameLabel" runat="server" Text="Label">Username: </asp:Label></td>
                        <td><asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Eval("Username") %>' ReadOnly="True" Width="200px"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td> <asp:Label ID="nameLabel" runat="server" Text="Label">Ad Soyad: </asp:Label></td>
                        <td><asp:TextBox ID="nameTextBox" runat="server" Text='<%# Eval("Name") %>' ReadOnly="True" Width="200px"></asp:TextBox></td>
                    </tr>
                    
                    <tr>
                        <td> <asp:Label ID="emailLabel" runat="server" Text="Label">Email: </asp:Label></td>
                        <td><asp:TextBox ID="emailTextBox" runat="server" Text='<%# Eval("Email") %>' ReadOnly="True" Width="200px"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td> <asp:Label ID="educationLabel" runat="server" Text="Label">Öğrenim: </asp:Label></td>
                        <td><asp:TextBox ID="educationTextBox" runat="server" Text='<%# Eval("Education") %>' TextMode="MultiLine" Width="200px" Height="80"></asp:TextBox></td>
                    </tr> 
                                       
                    <tr>
                        <td> <asp:Label ID="interestLabel" runat="server" Text="Label">İlgi ve Araştırma <br /> Alanları:</asp:Label></td>
                        <td><asp:TextBox ID="interestTexBox" runat="server" Text='<%# Eval("Interests") %>' TextMode="MultiLine" Width="200px" Height="80"></asp:TextBox></td>
                    </tr>
                  
                    <tr>
                        <td> <asp:Label ID="phoneLabel" runat="server" Text="Label">Telefon: </asp:Label></td>
                        <td><asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Eval("Phone") %>' Width="200px"></asp:TextBox></td>
                    </tr>
                </table>
        </ItemTemplate>
    </asp:ListView>

    <asp:Button ID="saveButton" runat="server" Text="Kaydet" 
        style="margin-left:245px;" onclick="saveButton_Click"/>

    <br /> <br />

    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        ChangePasswordButtonText="Tamam" 
        ChangePasswordFailureText="Şifre hatalı veya yeni şifre geçersiz. Yeni şifrenin minimum uzunluğu: {0}. Alfanümerik olmayan gereken karakter sayısı: {1}." 
        ChangePasswordTitleText="Şifre Değiştir" 
        ConfirmNewPasswordLabelText="Yeni Şifre Tekrar:" ContinueButtonText="Devam Et" 
        NewPasswordLabelText="Yeni Şifre:" PasswordLabelText="Şifre:" 
        CancelButtonStyle-CssClass="MyButton" 
        ChangePasswordButtonStyle-CssClass="MyButton" LabelStyle-HorizontalAlign="Left" 
        TitleTextStyle-BackColor="#008CC4" TitleTextStyle-ForeColor="White" 
        CancelButtonText="" 
        ConfirmPasswordCompareErrorMessage="Yeni Şifre Tekrar girdiğiniz Yeni Şifre ile aynı olmalıdır." 
        ConfirmPasswordRequiredErrorMessage="Yeni Şifreyi doğrulamanız gerekmektedir." 
        NewPasswordRegularExpressionErrorMessage="Lütfen farklı bir şifre giriniz." 
        NewPasswordRequiredErrorMessage="Yeni Şifre gereklidir." 
        PasswordRequiredErrorMessage="Şifre gereklidir." 
        SuccessText="Şifreniz değiştirilmiştir." 
        SuccessTitleText="Şifre Değiştirme Tamamlandı" Width="310px">
        <CancelButtonStyle CssClass="MyButton"></CancelButtonStyle>

        <ChangePasswordButtonStyle CssClass="MyButton"></ChangePasswordButtonStyle>

        <ChangePasswordTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" colspan="2" style="color:White;background-color:#008CC4;">
                                    Şifre Değiştir</td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                        AssociatedControlID="CurrentPassword">Şifre:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                        ControlToValidate="CurrentPassword" ErrorMessage="Şifre gereklidir." 
                                        ToolTip="Şifre gereklidir." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="NewPasswordLabel" runat="server" 
                                        AssociatedControlID="NewPassword">Yeni Şifre:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                        ControlToValidate="NewPassword" ErrorMessage="Yeni Şifre gereklidir." 
                                        ToolTip="Yeni Şifre gereklidir." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmNewPassword">Yeni Şifre Tekrar:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmNewPassword" 
                                        ErrorMessage="Yeni Şifreyi doğrulamanız gerekmektedir." 
                                        ToolTip="Yeni Şifreyi doğrulamanız gerekmektedir." 
                                        ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                        ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="Yeni Şifre Tekrar girdiğiniz Yeni Şifre ile aynı olmalıdır." 
                                        ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;</td>
                                <td align="right">
                                    <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                        CommandName="ChangePassword" CssClass="MyButton" Text="Tamam" 
                                        ValidationGroup="ChangePassword1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ChangePasswordTemplate>

        <LabelStyle HorizontalAlign="Left"></LabelStyle>

        <SuccessTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" style="color:White;background-color:#008CC4;">
                                    Şifre Değiştirme Tamamlandı</td>
                            </tr>
                            <tr>
                                <td>
                                    Şifreniz değiştirilmiştir.</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" 
                                        CommandName="Continue" CssClass="MyButton" Text="Devam Et" 
                                        onclick="ContinuePushButton_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </SuccessTemplate>

        <TitleTextStyle BackColor="#008CC4" ForeColor="White"></TitleTextStyle>
    </asp:ChangePassword>
</asp:Content>

