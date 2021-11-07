using Android.Content.Res;
using EcoMapMobile.Views;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace EcoMapMobile.ViewModels
{
    public class AuthViewModel : BaseViewModel
    {
        public string Login { get => _login; set { _login = value; OnPropertyChanged("Login"); } }
        public string Password { get => _password; set { _password = value; OnPropertyChanged("Password"); } }

        private string _login;
        private string _password;

        public Command Authorisation { get; }
        CancellationTokenSource cts;

        public AuthViewModel()
        {
            Authorisation = new Command(Auth);
        }


        private void Auth(object b)
        {
            if (!string.IsNullOrEmpty(_login) || string.IsNullOrEmpty(_password))
            {
                Application.Current.MainPage = new AppShell();
                //await Shell.Current.GoToAsync(nameof(Indicators));
            }
        }
    }
}
