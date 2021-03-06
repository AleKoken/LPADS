﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private string var1; 

    protected void Page_Load(object sender, EventArgs e)
    {
        Application["Contador"] = int.Parse(Application["Contador"].ToString())+1;
        Label1.Text = Application["Contador"].ToString(); 
    }

    protected void btnCopiar_Click(object sender, EventArgs e)
    {
        // var1 = TextBox1.Text;
        //Session["var1"] = TextBox1.Text; 
        // Cache["var1"] = TextBox1.Text;
        // ViewState["var1"] = TextBox1.Text; 
        Response.Cookies["var2"].Value = TextBox1.Text;
        Response.Cookies["var2"].Expires.AddDays(30); 
        TextBox1.Text = ""; 
    }

    protected void btnColar_Click(object sender, EventArgs e)
    {
        //TextBox2.Text = var1; 
        //TextBox2.Text = Session["var1"].ToString(); 
        //TextBox2.Text = Cache["var1"].ToString(); 
        // TextBox2.Text = ViewState["var1"].ToString(); 
        TextBox2.Text = Request.Cookies["var2"].Value.ToString();
    }
}