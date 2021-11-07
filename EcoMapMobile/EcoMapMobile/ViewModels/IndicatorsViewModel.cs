using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms.Maps;

namespace EcoMapMobile.ViewModels
{
    public class IndicatorsViewModel : BaseViewModel
    {
        public string Address { get => _address; set { _address = value; OnPropertyChanged("Address"); } }

        private string _address;
        CancellationTokenSource cts;


        public IndicatorsViewModel()
        {
            GetCurrentLocation();
        }

        async Task GetCurrentLocation()
        {
            try
            {
                var request = new GeolocationRequest(GeolocationAccuracy.Best, TimeSpan.FromSeconds(10));
                cts = new CancellationTokenSource();
                var location = await Geolocation.GetLocationAsync(request, cts.Token);

                if (location != null)
                {
                    var latitude = location.Latitude;
                    var longitude = location.Longitude;

                    Console.WriteLine($"Latitude: {latitude}, Longitude: {longitude}, Altitude: {location.Altitude}");

                    Geocoder geocoder = new Geocoder();
                    Position position = new Position(latitude, longitude);
                    IEnumerable<string> possibelAddress = await geocoder.GetAddressesForPositionAsync(position);

                    Address = possibelAddress.FirstOrDefault();

                }


            }
            catch (FeatureNotSupportedException fnsEx)
            {
                // Handle not supported on device exception
            }
            catch (FeatureNotEnabledException fneEx)
            {
                // Handle not enabled on device exception
            }
            catch (PermissionException pEx)
            {
                // Handle permission exception
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }


        }

        protected void OnDisappearing()
        {
            if (cts != null && !cts.IsCancellationRequested)
                cts.Cancel();
            OnDisappearing();
        }
    }
}
