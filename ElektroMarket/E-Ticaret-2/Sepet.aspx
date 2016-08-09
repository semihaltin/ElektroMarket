<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepet.aspx.cs" Inherits="E_Ticaret_2.Sepet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlDolusepet" runat="server">
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Ürün

                            </th>
                            <th>Ürün Adı

                            </th>
                            <th>Ürün/Ekle

                            </th>

                            <th>Tutar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 250px">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("urunresim") %>' Width="150px" Height="150px" />
                            </td>
                            <td style="width: 100px">
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("urunAd")%>'></asp:Label>
                            </td>
                            <td style="width: 280px">

                                <div class="input-append">
                                    <input class="span1" style="max-width: 34px" placeholder='<%# Eval("adet") %>' runat="server" id="appendedInputButtons" size="16" type="text">

                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/themes/images/Eksi.PNG" Width="40px" Height="32px" CommandName="eksi" CommandArgument='<%# Eval("urunID") %>' />
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/themes/images/arti.PNG" Width="40px" Height="32px" CommandName="artir" CommandArgument='<%# Eval("urunID") %>' />
                                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/themes/images/sil.PNG" Width="40px" Height="32px" CommandName="sil" CommandArgument='<%# Eval("urunID") %>' />


                                </div>



                            </td>
                            <td style="width: 100px">
                                <asp:Label ID="lblUrunFiyat" runat="server" Text='<%#Eval("tutar") %>'></asp:Label>
                            </td>


                        </tr>



                    </tbody>
                </table>





            </ItemTemplate>
            <FooterTemplate>
                <table class="table table-bordered" style="text-align: right">

                    <tr>

                        <td style="width: 250px"></td>
                        <td style="width: 100px"></td>

                        <td style="width: 280px">
                            <asp:Label ID="Label1" runat="server" Text="Toplam Adet"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Toplam Tutar"></asp:Label>
                        </td>

                    </tr>



                    <tr>

                        <td></td>

                        <td></td>

                        <td>

                            <asp:Label ID="lbladet" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbltutar" runat="server" Text="Label"></asp:Label>
                        </td>


                    </tr>

                    <tr>

                        <td></td>

                        <td>
                            <asp:Button ID="Button4" runat="server" Text="Sepeti Boşalt" CssClass="btn-success" CommandName="Bosalt" Width="100px" />
                        </td>

                        <td>
                            <asp:Button ID="Button3" runat="server" Text="Alışverişe Devam" CssClass="btn-success" CommandName="Devam" Width="120px" />

                        </td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Satın Al" CssClass="btn-success" CommandName="Satinal" Width="80px" />
                        </td>


                    </tr>


                </table>
            </FooterTemplate>

            <FooterStyle Font-Bold="True" ForeColor="Black" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="White" Width="800px" />
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />

        </asp:DataList>
    </asp:Panel>

    <asp:Panel ID="pnlbossepet" runat="server">
        <div style="background-image: url('themes/images/sepetbos.png'); width: 567px; height: 400px">
            <div style="width: 576px; height: 280px">
            </div>
            <div style="width: 576px; height: 40px">
            </div>
            <div style="text-align: center">
                <asp:Button ID="Button1" runat="server" BackColor="#F28B00" Font-Size="X-Large" ForeColor="White" Text="Giriş Yap" OnClick="Button1_Click" />
            </div>

        </div>




    </asp:Panel>

</asp:Content>
