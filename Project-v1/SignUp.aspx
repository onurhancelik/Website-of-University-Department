<%@ Page Title="Yeni Üyelik" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="_SignUp" %>

<%--Please email to bilmuh.tez@gmail.com for copyright.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" 
                Font-Names="Verdana" Font-Size="Small" Height="309px" Width="438px" 
                    AnswerLabelText="Güvenlik Cevabı:" 
                    AnswerRequiredErrorMessage="Güvenlik Cevabı Gereklidir." 
                    CompleteSuccessText="Üyeliğiniz başarıyla oluşturulmuştur." 
                    ConfirmPasswordCompareErrorMessage="Şifrenizi doğrulayın." 
                    ConfirmPasswordLabelText="Tekrar Şifre:" 
                    ConfirmPasswordRequiredErrorMessage="Şifrenizi tekrar giriniz." 
                    ContinueButtonText="Devam Et" CreateUserButtonText="Üyelik Oluştur" 
                    DuplicateEmailErrorMessage="Bu e-mail adresi daha önce kullanılmıştır. Lütfen başka bir e-mail adresi giriniz." 
                    DuplicateUserNameErrorMessage="Bu kullanıcı adı zaten kullanılmaktadır." 
                    EmailRegularExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    EmailRegularExpressionErrorMessage="Lütfen geçerli e-mail adresi giriniz." 
                    EmailRequiredErrorMessage="E-mail adresi gereklidir." 
                    InvalidAnswerErrorMessage="Lütfen farklı bir güvenlik sorusu cevabı giriniz." 
                    InvalidEmailErrorMessage="Lütfen geçerli bir e-mail adresi giriniz." 
                    InvalidPasswordErrorMessage="Minimum şifre uzunluğu: {0}. Özel karakter sayısı: {1}." 
                    InvalidQuestionErrorMessage="Lütfen farklı bir güvenlik sorusu giriniz." 
                    oncontinuebuttonclick="CreateUserWizard1_ContinueButtonClick" 
                    PasswordLabelText="Şifre:" 
                    PasswordRegularExpressionErrorMessage="Lütfen farklı bir şifre giriniz." 
                    PasswordRequiredErrorMessage="Şifre gereklidir." 
                    QuestionLabelText="Güvenlik Sorusu:" 
                    QuestionRequiredErrorMessage="Güvenlik sorusu gereklidir." 
                    UnknownErrorMessage="Üyeliğiniz oluşturulamadı. Lütfen tekrar deneyiniz." 
                    UserNameLabelText="Kullanıcı Adı:" 
                    UserNameRequiredErrorMessage="Kullanıcı adı gereklidir." 
                    onsendingmail="CreateUserWizard1_SendingMail" 
                    oncreateduser="CreateUserWizard1_CreatedUser">
                <ContinueButtonStyle BackColor="#26B6E8" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                    ForeColor="#284775" />
                <CreateUserButtonStyle BackColor="#006CAA" BorderColor="#26B6E8" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                    ForeColor="White" CssClass="MyButton" />
                    <MailDefinition BodyFileName="~/App_Data/SignUpConfirmation.txt" 
                        Subject="Yeni @Bitirme Tezi">
                    </MailDefinition>
                <TitleTextStyle BackColor="#008CC4" Font-Bold="True" ForeColor="White" />
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" 
                        Title="Yeni Hesabınız için Üye Olunuz" >

                        <ContentTemplate>
                            <table style="font-family:Verdana;font-size:100%;height:290px;width:438px;">
                                <tr>
                                    <td align="center" colspan="2" 
                                        style="color:White;background-color:#008CC4;font-weight:bold;">
                                        Yeni Hesabınız için Üye Olunuz</td>
                                </tr>

                                <tr>
                                    <td align="right">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                                            AutoPostBack="True" Width="200px">
                                            <asp:ListItem Selected="True">Öğrenci</asp:ListItem>
                                            <asp:ListItem>Akademisyen</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Kullanıcı Adı:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="Kullanıcı adı gereklidir." 
                                            ToolTip="Kullanıcı adı gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right">
                                        <asp:Label ID="NameLabel" runat="server" AssociatedControlID="NameTextBox">Ad Soyad:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="NameTextBox" ErrorMessage="Ad soyad gereklidir." 
                                            ToolTip="Ad soyad gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Şifre:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="Şifre gereklidir." 
                                            ToolTip="Şifre gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                            AssociatedControlID="ConfirmPassword">Tekrar Şifre:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                            ControlToValidate="ConfirmPassword" ErrorMessage="Şifrenizi tekrar giriniz." 
                                            ToolTip="Şifrenizi tekrar giriniz." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                            ControlToValidate="Email" ErrorMessage="E-mail adresi gereklidir." 
                                            ToolTip="E-mail adresi gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right">
                                        <asp:Label ID="telLabel" runat="server" AssociatedControlID="TelTextBox">Telefon:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TelTextBox" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="TelTextBox" ErrorMessage="Telefon gereklidir." 
                                            ToolTip="Telefon gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Güvenlik Sorusu:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                            ControlToValidate="Question" ErrorMessage="Güvenlik sorusu gereklidir." 
                                            ToolTip="Güvenlik sorusu gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Güvenlik Cevabı:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                            ControlToValidate="Answer" ErrorMessage="Güvenlik Cevabı Gereklidir." 
                                            ToolTip="Güvenlik Cevabı Gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        <br />
                                    </td>
                                </tr>

                                <asp:Panel ID="ogrPanel" runat="server">
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="NoLabel" runat="server" AssociatedControlID="NoTextBox">Öğrenci No:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="NoTextBox" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="NoTextBox" ErrorMessage="Öğrenci numarası gereklidir." 
                                                ToolTip="Öğrenci numarası gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr> 
                                </asp:Panel>
                    
                                <asp:Panel ID="akaPanel" runat="server">
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="KeyLabel" runat="server" AssociatedControlID="KeyTextBox">Akademisyen Anahtar:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="KeyTextBox" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="KeyTextBox" ErrorMessage="Akademisyen anahtarı gereklidir." 
                                                ToolTip="Akademisyen anahtarı gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Akademisyen key doğrulanamadı." ControlToValidate="KeyTextBox" ValueToCompare="1982" ValidationGroup="CreateUserWizard1" Display="Static" ToolTip="Akademisyen key doğrulanamadı." Font-Bold="True" Width="200px"></asp:CompareValidator>    
                                        </td>
                                    </tr>
                        
                                     <tr>
                                        <td align="right">
                                            <asp:Label ID="eduLabel" runat="server" AssociatedControlID="EduTextBox">Eğitim:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="EduTextBox" runat="server" TextMode="MultiLine" Width="200px" Height="80"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                ControlToValidate="EduTextBox" ErrorMessage="Eğitim alanı gereklidir." 
                                                ToolTip="Eğitim alanı gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr> 
                        
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="intLabel" runat="server" AssociatedControlID="intTextBox">Çalışma Alanı:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="intTextBox" runat="server" TextMode="MultiLine" Width="200px" Height="80"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                ControlToValidate="intTextBox" ErrorMessage="Çalışma alanı gereklidir." 
                                                ToolTip="Çalışma alanı gereklidir." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>                      
                         
                                </asp:Panel>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                            ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                            Display="Dynamic" ErrorMessage="Şifrenizi doğrulayın." 
                                            ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:RegularExpressionValidator ID="EmailRegExp" runat="server" 
                                            ControlToValidate="Email" Display="Dynamic" 
                                            ErrorMessage="Lütfen geçerli e-mail adresi giriniz." 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                            ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
               
                        </ContentTemplate>
        
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" Title="Üyelik oluşturma tamamlandı" >
                        <ContentTemplate>
                            <table style="font-family:Verdana;font-size:100%;height:309px;width:438px;">
                                <tr>
                                    <td align="center" colspan="2" 
                                        style="color:White;background-color:#008CC4;font-weight:bold;">
                                        Üyelik oluşturma tamamlandı</td>
                                </tr>
                                <tr>
                                    <td>
                                        Üyeliğiniz başarıyla oluşturulmuştur.</td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="ContinueButton" runat="server" BackColor="#26B6E8" 
                                            BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                            CausesValidation="False" CommandName="Continue" Font-Names="Verdana" 
                                            ForeColor="#284775" Text="Devam Et" ValidationGroup="CreateUserWizard1" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
                <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                    Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                    ForeColor="#284775" />
                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" 
                    VerticalAlign="Top" />
                <StepStyle BorderWidth="0px" />
            </asp:CreateUserWizard>              
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div class="PleaseWait">
                Üyelik kaydı oluşturuluyor, lütfen bekleyiniz...
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </asp:Content>
