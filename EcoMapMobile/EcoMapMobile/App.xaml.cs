using EcoMapMobile.Services;
using EcoMapMobile.Views;
using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace EcoMapMobile
{
    public partial class App : Application
    {

        public App()
        {
            Device.SetFlags(new string[] { "AppTheme_Experimanetal" });

            InitializeComponent();

            MainPage = new AuthPage();
            //DependencyService.Register<MockDataStore>();
            //MainPage = new AppShell();
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
