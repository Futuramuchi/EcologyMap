using EcologyMapApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologyMapApi.Helper
{
    public class ValuesGenerator
    {
        private static List<PointModel> _points { get; set; }
        public static List<PointModel> PointsValues()
        {
            _points = new List<PointModel>();
            Random rand = new Random();
            List<string> surnames = new List<string>()
            {
                "Иванов", "Степанова", "Кушинов", "Топоренко", "Миронова"
            };

            List<string> regions = new List<string>()
            {
                "Хамовники", "Перово", "Кунцево", "Алексеевский", "Тверской", "Чертаново Центральное",
                "Московский", "Северное Бутово", "Марушкинское", "Сокольники", "Куркино", "Силино", "Некрасовка", "Алтуфьевский"
            };

            int amount = rand.Next(10, 16);

            for (int i = 0; i < amount; i++)
            {
                _points.Add(
                new PointModel()
                {
                    Id = i,
                    SoilState = new SoilStateModel()
                    {
                        Id = i,
                        IndexBGKP = GetRandomNumber(1.0, 200.0),
                        PHValue = GetRandomNumber(1.0, 14.0)
                    },
                    AirState = new AirStateModel()
                    {
                        Id = i,
                        CO2Value = rand.Next(350, 700),
                        NO2Value = Math.Round(GetRandomNumber(0.2, 0.8), 3),
                    },
                    Region = new RegionModel()
                    {
                        Name = regions[rand.Next(0, 13)]
                    },
                    WaterState = new WaterStateModel()
                    {
                        Id = i,
                        TDSValue = rand.Next(0, 350)
                    },
                    //Latitude = Math.Round(GetRandomNumber(55.621276, 55.887350), 6),
                    //Longitude = Math.Round(GetRandomNumber(37.564309, 37.591344), 6),
                    Temperature = rand.Next(3, 12),
                    User = new UserModel()
                    {
                        Id = i,
                        MiddleName = surnames[rand.Next(0, 4)]
                    }
                });

            }

            for (int i = 0; i < _points.Count; i++)
            {
                #region Soil
                if (_points[i].SoilState.PHValue <= 9 && _points[i].SoilState.PHValue >= 3.5)
                {
                    if (_points[i].SoilState.IndexBGKP > 0 && _points[i].SoilState.IndexBGKP <= 10)
                    {
                        _points[i].CommonSoilColor = "C8CC0B";
                    }
                    if (_points[i].SoilState.IndexBGKP > 10 && _points[i].SoilState.IndexBGKP <= 200)
                    {
                        _points[i].CommonSoilColor = "FFB100";
                    }
                    if (_points[i].SoilState.IndexBGKP > 200 && _points[i].SoilState.IndexBGKP <= 1000)
                    {
                        _points[i].CommonSoilColor = "FF680D";
                    }
                    if (_points[i].SoilState.IndexBGKP > 1000)
                    {
                        _points[i].CommonSoilColor = "FF2B1F";
                    }

                }
                if (_points[i].SoilState.PHValue > 9)
                {
                    if (_points[i].SoilState.IndexBGKP > 0 && _points[i].SoilState.IndexBGKP <= 10)
                    {
                        _points[i].CommonSoilColor = "0ECB30";
                    }
                    if (_points[i].SoilState.IndexBGKP > 10 && _points[i].SoilState.IndexBGKP <= 200)
                    {
                        _points[i].CommonSoilColor = "C8CC0B";
                    }
                    if (_points[i].SoilState.IndexBGKP > 200 && _points[i].SoilState.IndexBGKP <= 1000)
                    {
                        _points[i].CommonSoilColor = "FFB100";
                    }
                    if (_points[i].SoilState.IndexBGKP > 1000)
                    {
                        _points[i].CommonSoilColor = "FF2B1F";
                    }
                }

                if (_points[i].SoilState.PHValue < 3.5)
                {
                    if (_points[i].SoilState.IndexBGKP > 0 && _points[i].SoilState.IndexBGKP <= 10)
                    {
                        _points[i].CommonSoilColor = "FF9500";
                    }
                    if (_points[i].SoilState.IndexBGKP > 10 && _points[i].SoilState.IndexBGKP <= 200)
                    {
                        _points[i].CommonSoilColor = "FF5612";
                    }
                    if (_points[i].SoilState.IndexBGKP > 200 && _points[i].SoilState.IndexBGKP <= 1000)
                    {
                        _points[i].CommonSoilColor = "FF2B1F";
                    }
                    if (_points[i].SoilState.IndexBGKP > 1000)
                    {
                        _points[i].CommonSoilColor = "FF2B1F";
                    }
                }
                #endregion

                #region Water
                if (_points[i].WaterState.TDSValue >= 0 && _points[i].WaterState.TDSValue < 170)
                {
                    _points[i].CommonWaterColor = "0ECB30";
                }

                if (_points[i].WaterState.TDSValue >= 170 && _points[i].WaterState.TDSValue < 300)
                {
                    _points[i].CommonWaterColor = "C8CC0B";
                }

                if (_points[i].WaterState.TDSValue >= 300 && _points[i].WaterState.TDSValue < 400)
                {
                    _points[i].CommonWaterColor = "FFBE00";
                }

                if (_points[i].WaterState.TDSValue >= 400 && _points[i].WaterState.TDSValue < 500)
                {
                    _points[i].CommonWaterColor = "FF8209";
                }

                if (_points[i].WaterState.TDSValue >= 500)
                {
                    _points[i].CommonWaterColor = "FF2B1F";
                }
                #endregion Water

                #region Air
                if (_points[i].AirState.CO2Value >= 0 && _points[i].AirState.CO2Value <= 350)
                {
                    if (_points[i].AirState.NO2Value <= 0.75)
                        _points[i].CommonAirColor = "00CB33";
                    if (_points[i].AirState.NO2Value > 0.75)
                        _points[i].CommonAirColor = "C8CC0B";
                }

                if (_points[i].AirState.CO2Value > 350 && _points[i].AirState.CO2Value <= 450)
                {
                    if (_points[i].AirState.NO2Value <= 0.75)
                        _points[i].CommonAirColor = "52CB23";
                    if (_points[i].AirState.NO2Value > 0.75)
                        _points[i].CommonAirColor = "C8CC0B";
                }

                if (_points[i].AirState.CO2Value > 450 && _points[i].AirState.CO2Value <= 700)
                {
                    if (_points[i].AirState.NO2Value <= 0.75)
                        _points[i].CommonAirColor = "9DCC14";
                    if (_points[i].AirState.NO2Value > 0.75)
                        _points[i].CommonAirColor = "FFB100";
                }

                if (_points[i].AirState.CO2Value > 700 && _points[i].AirState.CO2Value <= 1000)
                {
                    if (_points[i].AirState.NO2Value <= 0.75)
                        _points[i].CommonAirColor = "FFB100";
                    if (_points[i].AirState.NO2Value > 0.75)
                        _points[i].CommonAirColor = "FF680D";
                }

                if (_points[i].AirState.CO2Value > 1000)
                {
                    if (_points[i].AirState.NO2Value <= 0.75)
                        _points[i].CommonAirColor = "FF5612";
                    if (_points[i].AirState.NO2Value > 0.75)
                        _points[i].CommonAirColor = "FF2B1F";
                }
                #endregion


                _points[i].CommonSoilState = (double)_points[i].SoilState.PHValue * 100 / 14; // >58 - norm
                _points[i].CommonWaterState = (double)_points[i].WaterState.TDSValue * 100 / 500; // <80 - norm
                _points[i].CommonAirState = (double)_points[i].AirState.CO2Value * 100 / 5000; // <16 - norm

                if (_points[i].CommonSoilState >= 58 && _points[i].CommonWaterState < 80
                    && _points[i].CommonWaterState < 16)
                {
                    _points[i].CommonState = rand.Next(70, 100);
                }
                else
                {
                    _points[i].CommonState = rand.Next(20, 65);
                }

            }


            return _points;
        }

        public static double GetRandomNumber(double minimum, double maximum)
        {
            Random random = new Random();
            return random.NextDouble() * (maximum - minimum) + minimum;
        }


    }
}