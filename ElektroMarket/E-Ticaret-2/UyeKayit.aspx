<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UyeKayit.aspx.cs" Inherits="E_Ticaret_2.UyeKayit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table style="float: left">

        <tr>

            <td>


                <h4>Yeni Üye Kayıt</h4>


                <div class="control-group">
                    <label class="control-label" for="inputFname">Ad</label>
                    <div class="controls">

                        <input type="text" id="inputisim" runat="server" placeholder="İsim">
                        <asp:RequiredFieldValidator ID="rfvisim" runat="server" ControlToValidate="inputisim" ErrorMessage="isim Boş Geçilemez!" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>

                    </div>
                </div>




                <div class="control-group">
                    <label class="control-label" for="inputLname">Soyad</label>
                    <div class="controls">
                        <input type="text" id="inputsoyisim" runat="server" placeholder="Soyisim" />
                        <asp:RequiredFieldValidator ID="rfvsoyisim" runat="server" ControlToValidate="inputsoyisim" ErrorMessage="Soyisim Boş Geçilemez!" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputLname">TCKNO</label>
                    <div class="controls">
                        <input type="text" id="inputtckno" runat="server" placeholder="TCKNO" />
                        <asp:RequiredFieldValidator ID="rfvtckno" runat="server" ControlToValidate="inputtckno" ErrorMessage="TC Kimlik No Girilmelidir!" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="control-group">
                    <label class="control-label" for="inputLname">Şifre</label>
                    <div class="controls">
                        <input type="password" id="sifre" runat="server" placeholder="Şifre" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="sifre" ErrorMessage="Şifre Boş Geçilemez!" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputLname">Şifre Tekrar</label>
                    <div class="controls">
                        <input type="password" id="sifretekrar" runat="server" placeholder="Şifre Tekrar" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sifretekrar" ErrorMessage="Şifre Boş Geçilemez!" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="sifre" ControlToValidate="sifretekrar" ErrorMessage="Şifreler Aynı Değil" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:CompareValidator>
                        &nbsp;&nbsp;
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="city">Mail Adres</label>
                    <div class="controls">
                        <input type="text" id="inputmail" runat="server" placeholder="deneme@xxx.com" />
                        <asp:RequiredFieldValidator ID="rfvmail" runat="server" ControlToValidate="inputmail" ErrorMessage="Mail Adresi Girilmelidir!" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="mobile">Telefon</label>
                    <div class="controls">
                        <input type="text" id="inputtelefon" runat="server" placeholder="Telefon No" />
                        <asp:RequiredFieldValidator ID="rfvtelefon" runat="server" ControlToValidate="inputtelefon" ErrorMessage="Telefon Boş Geçilemez" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="aditionalInfo">Adres</label>
                    <div class="controls">
                        <textarea id="aditionalInfo" runat="server" cols="26" rows="3" placeholder="Adres"></textarea>
                        <asp:RequiredFieldValidator ID="rfvil" runat="server" ControlToValidate="aditionalInfo" ErrorMessage="Adres Girilmelidir" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="control-group">
                    <label class="control-label" for="city">İl</label>
                    <div class="controls">
                        <input type="text" id="inputil" runat="server" placeholder="Şehir" />

                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="city">İlçe</label>
                    <div class="controls">
                        <input type="text" id="inputilce" runat="server" placeholder="ilçe" />

                    </div>
                </div>


                <div class="control-group">
                    <div class="controls">

                        <asp:Button ID="Button1" runat="server" Text="Kaydet" CssClass="btn-success" ValidationGroup="1" OnClick="Button1_Click" />
                    </div>

                </div>


            </td>


        </tr>




    </table>

    <div style="float: left; height: 200px; width: 436px">
        <div style="height: 60px">
        </div>


        <div>
            <asp:TextBox ID="txtSozlesme" runat="server" TextMode="MultiLine" Text="Gizlilik Sözleşmesi : Girmiş olduğunuz kişisel bilgileriniz 3.şahıs ve kurumlarla kesinlikle paylaşılmayacaktır. Her türlü özel bilgi ve ödeme işlemleriniz 128 bit SSL güvenlik sertifikalarıyla şifrelenmektedir." Font-Names="Verdana" Font-Size="8pt" Height="176px" Width="408px"></asp:TextBox>

        </div>
        <div style="text-align: center">
            <asp:CheckBox ID="cbxSozlesme" runat="server" Text="Gizlilik Sözleşmesini Okudum" />
        </div>
        <div>
            <asp:Label ID="lblmesaj" runat="server"></asp:Label>
        </div>

        <div>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="1" Font-Size="Large" ForeColor="Red" Width="427px" style="margin-bottom: 0px" />

        </div>



    </div>



</asp:Content>
