<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="E_Ticaret_2.Admin.login" %>
    <h5>ALREADY REGISTERED ?</h5>

    <div class="control-group">
        <label class="control-label" for="inputEmail1">Email</label>
        <div class="controls">
            <input class="span3" type="text" id="inputEmail" runat="server" placeholder="Email">
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="inputPassword1">Password</label>
        <div class="controls">
            <input type="password" class="span3" id="inputPassword" runat="server" placeholder="Password">
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <asp:Button ID="Button1" runat="server" Text="Giriş" OnClick="Button1_Click" />
            <a href="forgetpass.html">Forget password?</a>
        </div>
    </div>

