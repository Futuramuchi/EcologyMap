using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using EcoMapMobile.CustomRenderer;
using EcoMapMobile.Droid.CustomRenderer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;

[assembly: ExportRenderer(typeof(MyCustomDatePicker), typeof(MyDatePickerRenderer))]
namespace EcoMapMobile.Droid.CustomRenderer
{
    class MyDatePickerRenderer : DatePickerRenderer
    {
        public MyDatePickerRenderer(Context context) : base(context)
        {
           
        }

        protected override void OnElementChanged(ElementChangedEventArgs<Xamarin.Forms.DatePicker> e)
        {
            base.OnElementChanged(e);

            if (Control != null)
            {
                Control.SetBackgroundColor(Android.Graphics.Color.Transparent);   
            }
        }
    }
}