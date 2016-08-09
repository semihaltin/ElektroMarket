<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adres.aspx.cs" Inherits="E_Ticaret_2.Adres" %>

<%@ Register Src="~/login.ascx" TagPrefix="uc1" TagName="login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnllogin" runat="server">
        <uc1:login runat="server" ID="login" />
    </asp:Panel>
    <asp:Panel ID="pnladres" runat="server">
        <div style="float: left; width: 250px">


            <div class="control-group">
                <label class="control-label" for="aditionalInfo" style="font-size: large">Adresinizi Onaylayın</label>

            </div>

            <div>
                <div class="control-group">
                    <label class="control-label" for="aditionalInfo">Adres</label>
                    <div class="controls">
                        <textarea id="aditionalInfo" runat="server" cols="26" rows="3" placeholder="Adres"></textarea>
                        <asp:RequiredFieldValidator ID="rfvil" runat="server" ControlToValidate="aditionalInfo" ErrorMessage="Adres Girilmelidir" Font-Size="Larger" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
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


            </div>
        </div>
        <div style="float: left; margin-left: 50px">

            <div>
                <label class="control-label" for="aditionalInfo" style="font-size: large; text-align: center">Kart bilgileri</label>
            </div>

            <div style="float: left; width: 250px; height: 160px">
                <div class="control-group">
                    <label class="control-label" for="city">Kart Üzerindeki Ad Soyad:</label>
                    <div class="controls">

                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="city">Kart Numarası</label>
                    <div class="controls">
                        <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True"></asp:TextBox>

                    </div>
                </div>
                <div class="controls">
                    <div style="width: 50px; float: left">
                        <asp:DropDownList ID="ddlay" runat="server" Width="50px" AutoPostBack="True" OnSelectedIndexChanged="ddlay_SelectedIndexChanged">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="width: 80px; float: left; margin-left: 20px">
                        <asp:DropDownList ID="ddltarih" runat="server" Width="80px" AutoPostBack="True" OnSelectedIndexChanged="ddltarih_SelectedIndexChanged">
                            <asp:ListItem>2016</asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                        </asp:DropDownList>
                    </div>




                    <input type="text" id="inputguvenlikno" runat="server" placeholder="CVC" style="float: left; margin-left: 20px; width: 60px" />

                </div>
            </div>


            <div style="float: left; background-image: url(themes/images/kredikart.png); width: 250px; height: 160px; margin-top: 20px; margin-left: 20px">
                <table style="width: 250px; height: 160px">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblkartnumara" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblkarttarih" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblkartisim" runat="server"  Font-Size="Medium" Font-Bold="true"></asp:Label></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>

            </div>

            <div style="clear: both; font-size: large; text-align: center">
                Kargo Bilgileri
            </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="ArasKargo " Font-Size="Large" Width="130px"></asp:Label><asp:RadioButton ID="rbaras" runat="server" GroupName="kargo" /><br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Yurtiçi Kargo" Font-Size="Large" Width="130px"></asp:Label><asp:RadioButton ID="rbyurtici" runat="server" GroupName="kargo" /><br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="MNG Kargo" Font-Size="Large" Width="130px"></asp:Label><asp:RadioButton ID="rbmng" runat="server" GroupName="kargo" />

            </div>

            <div class="control-group" style="text-align:center;margin-top:20px">
                <div class="controls">

                    <asp:Button ID="Button1" runat="server" Text="Ödeme Yap" CssClass="btn-success" OnClick="Button1_Click" />
                </div>

            </div>



        </div>


    </asp:Panel>
</asp:Content>
