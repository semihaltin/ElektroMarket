<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UrunEkle.aspx.cs" Inherits="E_Ticaret_2.Admin.UrunEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 509px; text-align: center">


        <asp:DropDownList ID="ddlKategoriler" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlKategoriler_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlAltKategoriler" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAltKategoriler_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
    </div>
    <asp:GridView ID="gvUrunler" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UrunID" ForeColor="#333333" GridLines="None" Width="509px" Style="margin-top: 0px" OnSelectedIndexChanged="gvUrunler_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" HeaderText="Seç">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:CommandField>
            <asp:BoundField DataField="UrunID" HeaderText="ID" Visible="False" />
            <asp:BoundField DataField="UrunKodu" HeaderText="Ürünkodu">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="UrunAd" HeaderText="Ürünadı">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Miktar" HeaderText="Miktar">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="UrunFiyat" HeaderText="Fiyat">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="UrunBilgisi" HeaderText="ürünbilgisi" Visible="False" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <div style="width: 509px; height: 25px; color: white; font-size: large">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Yeni Ürün Ekle</asp:LinkButton>
    </div>
    <asp:Panel ID="pnlurun" runat="server" Visible="False">
        <div style="width: 509px; text-align: center; background-color: #507CD1; height: 25px; color: white; font-size: large">
            Ürün Bilgileri
        </div>

        <table style="width: 300px">
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Ürün Kodu"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUrunKodu" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Ürün Adı"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUrunAdi" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Ürün Bilgisi"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUrunBilgisi" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Miktar"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtMiktar" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Fiyat"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtFiyat" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Büyük Resim"></asp:Label>

                </td>
                <td>
                    <asp:FileUpload ID="fuAnasayfaresim" runat="server"></asp:FileUpload>
                </td>
            </tr>



            <tr>
                <td colspan="2" style="text-align: center; background-color: #507CD1">
                    <asp:Label ID="Label7" runat="server" BackColor="#507CD1" ForeColor="White" Font-Size="Large" Text="Detay Resimler" Width="509px"></asp:Label>

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Detay 1"></asp:Label>

                </td>
                <td>
                    <asp:FileUpload ID="fudetay1" runat="server"></asp:FileUpload>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Detay 2"></asp:Label>

                </td>
                <td>
                    <asp:FileUpload ID="fudetay2" runat="server"></asp:FileUpload>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Detay 3"></asp:Label>

                </td>
                <td>
                    <asp:FileUpload ID="fudetay3" runat="server"></asp:FileUpload>
                </td>
            </tr>
            <tr>

                <td colspan="2" style="text-align: center; background-color: #507CD1">
                    <asp:Button ID="btnKaydet" CssClass="bluebutton" runat="server" Text="Kaydet" Width="70px" OnClick="btnKaydet_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnDegistir" CssClass="bluebutton" runat="server" Text="Değiştir" Width="70px" OnClick="btnDegistir_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="btnSil" CssClass="bluebutton" runat="server" Text="Sil" Width="70px" OnClick="btnSil_Click" />

                </td>


            </tr>
            <tr>
                <td colspan="2" style="text-align: center; background-color: #507CD1">
                    <asp:Label ID="lblmesaj" runat="server" BackColor="#507CD1" ForeColor="White" Font-Size="Large" Width="509px"></asp:Label>

                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
