<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="KategoriEkle.aspx.cs" Inherits="E_Ticaret_2.Admin.KategoriEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvkategoriler" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" Width="439px" Height="139px" OnSelectedIndexChanged="gvkategoriler_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField HeaderText="Seç" SelectText="&gt;&gt;" ShowSelectButton="True">
                <HeaderStyle Width="30px" />
            </asp:CommandField>
            <asp:BoundField DataField="KategoriAd" HeaderText="Kategori Adı">
            <HeaderStyle HorizontalAlign="Left" Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="Aciklama" HeaderText="Açıklama">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
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
    <div>
        <asp:LinkButton ID="lnkbtnkategori" runat="server" ForeColor="Blue" Font-Size="Medium" OnClick="lnkbtnkategori_Click">Kategori ekle</asp:LinkButton>
    </div>
    <asp:Panel ID="pnlyenikategori" runat="server" Visible="False">
        <table style="width: 300px">
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Kategori"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtyenikategori" runat="server" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Açıklama"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtyeniaciklama" runat="server" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnKaydet" BackColor="#507CD1" ForeColor="White" runat="server" Text="Kaydet" Width="70px" OnClick="btnKaydet_Click" />

                </td>
                <td>
                    <asp:Button ID="btnDegistir" BackColor="#507CD1" runat="server" ForeColor="White" Text="Değiştir" Width="70px" OnClick="btnDegistir_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSil" BackColor="#507CD1" runat="server" ForeColor="White" Text="Sil" Width="70px" OnClick="btnSil_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
