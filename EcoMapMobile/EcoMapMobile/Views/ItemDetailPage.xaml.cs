using EcoMapMobile.ViewModels;
using System.ComponentModel;
using Xamarin.Forms;

namespace EcoMapMobile.Views
{
    public partial class ItemDetailPage : ContentPage
    {
        public ItemDetailPage()
        {
            InitializeComponent();
            BindingContext = new ItemDetailViewModel();
        }
    }
}