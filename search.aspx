<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
    <div class="w-container">
    <h1>Search results</h1>
    <form action="/search" class="w-form"><label for="search">Search</label><input type="search" class="w-input" maxlength="256" name="query" placeholder="Search…" id="search" required=""><input type="submit" value="Search" class="w-button"></form>
  </div>
</asp:Content>

