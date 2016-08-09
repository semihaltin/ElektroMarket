<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="E_Ticaret_2.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="breadcrumb">
            <li><a href="index.html">Anasayfa</a> <span class="divider">/</span></li>
            <li><a href="products.html">Ürünler</a> <span class="divider">/</span></li>
            <li class="active">Ürün  Detayları</li>
        </ul>
        <div class="row">
            <div id="gallery" class="span3">
                <asp:Label ID="lblilk" runat="server" Text=""></asp:Label>
                <asp:Image ID="imgilk" runat="server" ImageUrl='<%# Eval("Urunresimyolu1") %>' />
                </a>
                <div id="differentview" class="moreOptopm carousel slide">
                    <div class="carousel-inner">
                        <div class="item active">
                            <asp:Label ID="lblbir" runat="server" Text=""></asp:Label>
                            <asp:Image ID="imgbir" runat="server" Width="29%" ImageUrl='<%# Eval("Urunresimyolu2") %>' />
                            </a>
                             <asp:Label ID="lbliki" runat="server" Text=""></asp:Label>
                            <asp:Image ID="imgiki" runat="server" Width="29%" ImageUrl='<%# Eval("Urunresimyolu3") %>' />
                            </a>
                              <asp:Label ID="lbluc" runat="server" Text=""></asp:Label>
                            <asp:Image ID="imguc" runat="server" Width="29%" ImageUrl='<%# Eval("Urunresimyolu4") %>' />
                            </a>




                        </div>
                        <%-- <div class="item">
                            <a href="themes/images/products/large/f3.jpg">
                                <img style="width: 29%" src="themes/images/products/large/f3.jpg" alt="" /></a>
                            <a href="themes/images/products/large/f1.jpg">
                                <img style="width: 29%" src="themes/images/products/large/f1.jpg" alt="" /></a>
                            <a href="themes/images/products/large/f2.jpg">
                                <img style="width: 29%" src="themes/images/products/large/f2.jpg" alt="" /></a>
                        </div>--%>
                    </div>
                    <!--  
			  <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
              <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
			  -->
                </div>

                <div class="btn-toolbar">
                    <div class="btn-group">
                        <span class="btn"><i class="icon-envelope"></i></span>
                        <span class="btn"><i class="icon-print"></i></span>
                        <span class="btn"><i class="icon-zoom-in"></i></span>
                        <span class="btn"><i class="icon-star"></i></span>
                        <span class="btn"><i class=" icon-thumbs-up"></i></span>
                        <span class="btn"><i class="icon-thumbs-down"></i></span>
                    </div>
                </div>
            </div>
            <div class="span6">
                <h3>
                    <asp:Label ID="lblmarka" runat="server" Text='<%#Eval("UrunAd")%>'></asp:Label>
                </h3>

                <hr class="soft" />

                        <asp:Button ID="Button1" runat="server" class="btn btn-large btn-primary pull-right" Text="Sepete At" OnClick="Button1_Click" />

                <div class="control-group">

                    <asp:Label ID="lblfiyat" class="control-label" runat="server" Font-Bold="true" Font-Size="Medium" Text='<%#Eval("UrunFiyat")%>'> 
                    </asp:Label>
                     <asp:Label ID="Label1" class="control-label" runat="server" Font-Bold="true" Font-Size="Medium" Text="   TL"> 
                    </asp:Label>
                    <div class="controls">

                    </div>
                </div>
                <hr class="soft" />
                <h4>Ürün Özellikleri</h4>

                <hr class="soft clr" />
                <p>
                    <asp:Label ID="lblurundbilgisi" runat="server" Text='<%#Eval("UrunBilgisi")%>'></asp:Label>
                </p>
                <a class="btn btn-small pull-right" href="#detail">Daha Fazla Detay</a>
                <br class="clr" />
                <a href="#" name="detail"></a>
                <hr class="soft" />
            </div>

        </div>
    </div>

</asp:Content>
