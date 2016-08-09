<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AltKategoriEkle.aspx.cs" Inherits="E_Ticaret_2.Admin.AltKategoriEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:GridView ID="gvAltKategoriEkle" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" Width="458px" OnSelectedIndexChanged="gvAltKategoriEkle_SelectedIndexChanged" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField HeaderText="Seç" SelectText="&gt;&gt;" ShowSelectButton="True">
                <HeaderStyle Width="30px" />
            </asp:CommandField>
            <asp:BoundField DataField="AltKategoriAd" HeaderText="AltKategoriAD">
                <HeaderStyle HorizontalAlign="Left" Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="KategoriNo" HeaderText="KategoriNo" Visible="False" />
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
    <div style="background-color:#507CD1;width:458px;color:white">
        <asp:Label ID="Label1" runat="server" Font-Size="Medium" >Kategori Seç</asp:Label>
    </div>
    <div>
        <asp:DropDownList ID="ddlkategorigetir" runat="server" AutoPostBack="True" DataTextField="KategoriAd" DataValueField="ID" OnSelectedIndexChanged="ddlkategorigetir_SelectedIndexChanged" >
        </asp:DropDownList>
    </div>
    <div>
        <asp:LinkButton ID="LinkButton1" ForeColor="#507CD1" Font-Size="Medium" runat="server" OnClick="LinkButton1_Click" >AltKategori Ekle</asp:LinkButton>
        <br />

    </div>
    <asp:Panel ID="pnlaltkategori" runat="server" Visible="False">
        <table style="width: 300px">
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="AltKategori"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAltkategoriad" runat="server" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Açıklama"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAciklama" runat="server" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnKaydet" BackColor="#507CD1" ForeColor="White" runat="server" Text="Kaydet" Width="70px" OnClick="btnKaydet_Click" /></td>
                <td>
                    <asp:Button ID="btnDegistir" BackColor="#507CD1" ForeColor="White" runat="server" Text="Değiştir" Width="70px" OnClick="btnDegistir_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSil" BackColor="#507CD1" ForeColor="White" runat="server" Text="Sil" Width="70px" OnClick="btnSil_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>


</asp:Content>
