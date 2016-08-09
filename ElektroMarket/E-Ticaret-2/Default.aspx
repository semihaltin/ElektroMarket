﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Ticaret_2.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlisturunler" runat="server" RepeatColumns="3" DataKeyField="UrunID" OnItemCommand="dlisturunler_ItemCommand">

        <ItemTemplate>

            <div class="thumbnail" style="margin-right: 40px; margin-bottom: 20px; width: 250px; height: 400px">

                <div  style="text-align:center">
                <asp:ImageButton ID="imgResim" runat="server" ImageUrl='<%#Eval("Urunresimyolu1") %>' CommandName="detay" CommandArgument='<%#Eval("UrunID") %>'  />

                </div>

                <div class="caption">
                    <h5 style="height: 40px">
                        <asp:Label ID="lblUrunAd" runat="server" Text='<%#Eval("UrunAd") %>'></asp:Label>
                    </h5>
                    <h4 style="text-align: center"><a class="btn" href="Details.aspx"><i class="icon-zoom-in"></i></a>
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn" CommandName="sepet" CommandArgument='<%#Eval("UrunID") %>'>Ekle<i class="icon-shopping-cart"></i>
                        </asp:LinkButton>
                        <a class="btn btn-primary" href="#">
                            <asp:Label ID="lblUrunFiyat" runat="server" Text='<%#Eval("UrunFiyat", "{0:N}") %>'></asp:Label>

                        </a>
                    </h4>
                    <h4 style="text-align:center">
                        
                        <asp:Label ID="Label2" runat="server"  ForeColor="Black" Text="Adet : "></asp:Label>  <asp:TextBox ID="txtMiktar" BorderWidth="2px" BorderColor="Black" Font-Size="Medium" Font-Bold="true" runat="server" TextMode="Number" min="1" Text="1" Width="30px" ></asp:TextBox><br />
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="Large" Text="Stokta Yok !" Visible='<%#Convert.ToInt32(Eval("Miktar"))==0? true:false %>'></asp:Label>
                    </h4>
                </div>

            </div>
        </ItemTemplate>
    </asp:DataList>

</asp:Content>


<%--<asp:ImageButton ID="imgResim" runat="server" ImageUrl='<%#Eval("Urunresimyolu1") %>' Width="160px" Height="160px" CommandName="detay" CommandArgument='<%#Eval("UrunID") %>' /><br />
            <asp:Label ID="lblUrunAd" runat="server" Text='<%#Eval("UrunAd") %>'></asp:Label>
            <br />
            <br />
                <asp:TextBox ID="txtAdet" Text="1" Width="30px" TextMode="Number" runat="server"></asp:TextBox><br />

            <asp:ImageButton ID="btnSepeteAt" runat="server" CommandName="sepet" CommandArgument='<%#Eval("UrunID") %>' ImageUrl="themes/images/products/btnSepeteAt.png" Height="30" Width="120" />--%>