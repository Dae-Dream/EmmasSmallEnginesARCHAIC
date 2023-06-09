﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmasSmallEngines
{
	//Michael Quill
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Page_LoadCompleted(object sender, EventArgs e)
		{
			
		}

		protected void txtUsername_Load(object sender, EventArgs e)
		{
			Page.SetFocus(txtUsername.ClientID);
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
			UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
			IdentityUser user = manager.Find(txtUsername.Text, txtPassword.Text);
			if (user == null)
			{
				lblMessage.Text = "Username or password is incorrect.";
			}
			else
			{
				var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
				var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
				authenticationManager.SignIn(userIdentity);
				Response.Redirect("~/Customers.aspx");
			}
		}

		protected void btnRegister_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Register.aspx");
		}

	}
}