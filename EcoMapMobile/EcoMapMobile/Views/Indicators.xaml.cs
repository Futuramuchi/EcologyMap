﻿using EcoMapMobile.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace EcoMapMobile.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Indicators : ContentPage
    {
        public Indicators()
        {
            InitializeComponent();
            BindingContext = new IndicatorsViewModel();

        }
    }
}