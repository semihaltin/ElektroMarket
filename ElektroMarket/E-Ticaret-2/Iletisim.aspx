<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="E_Ticaret_2.Iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainBody">
        <div class="row">

            <div class="span4">
                <h4>İletişim Detayları</h4>
                <p>
                    Beşiktaş<br />
                    Wissen Akademie
			<br />
                    <br />
                    info@bootsshop.com<br />
                    ﻿Tel 123-456-6780<br />
                    Fax 123-456-5679<br />
                    web:bootsshop.com
                </p>
            </div>
            <div class="span4">
                <h4>Email Atın</h4>
                <fieldset>
                    <div class="control-group">

                        <input type="text" placeholder="İsim" class="input-xlarge" />

                    </div>
                    <div class="control-group">

                        <input type="text" placeholder="email" class="input-xlarge" />

                    </div>
                    <div class="control-group">

                        <input type="text" placeholder="Konu" class="input-xlarge" />

                    </div>
                    <div class="control-group">
                        <textarea rows="3" id="textarea" class="input-xlarge"></textarea>

                    </div>

                    <button class="btn btn-large" type="submit">Mesaj  Gönder</button>

                </fieldset>

            </div>
        </div>
        <div class="row">
            <div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3005.348099942293!2d29.095557414956474!3d41.126926320064804!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cacb1f3757d87d%3A0xc6f0feec61ef0dda!2sBeykoz+Belediyesi!5e0!3m2!1str!2str!4v1469971575255" width="800" height="200" frameborder="0" style="border: 0" allowfullscreen></iframe>
                <br />
                <small><a href="https://maps.google.co.uk/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=18+California,+Fresno,+CA,+United+States&amp;aq=0&amp;oq=18+California+united+state&amp;sll=39.9589,-120.955336&amp;sspn=0.007114,0.016512&amp;ie=UTF8&amp;hq=&amp;hnear=18,+Fresno,+California+93727,+United+States&amp;t=m&amp;ll=36.732762,-119.695787&amp;spn=0.017197,0.100336&amp;z=14" style="color: #0000FF; text-align: left">View Larger Map</a></small>
            </div>
        </div>
    </div>
    
</asp:Content>
