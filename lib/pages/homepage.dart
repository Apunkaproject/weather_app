import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/controller/popullation_controller.dart';
import 'package:weather_app/api/controller/weather_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController = Get.put(WeatherController());

    RxString selectedCirty = "Indor".obs;

    // List of items in our dropdown menu
    var items = [
      'Indor',
      'Gaya',
      'Patna',
      "Bhopal",
      "Jabalpur",
      "Ujjain",
      "Dewas",
      "Satna",
      "Rewa",
      "Chhatarpur",
      "Itarsi",
    ];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                      ),
                      SizedBox(width: 10),
                      Obx(
                        () => DropdownButton(
                            value: selectedCirty.toString(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (city) {
                              print(city);
                              selectedCirty.value = city.toString();
                              weatherController.getWeather(city.toString());
                            }),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      weatherController.getWeather("gaya");
                    },
                    icon: Icon(Icons.refresh),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/heavyrain.png",
                    width: 200,
                  ),
                ],
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weatherController.weather.value.temperature.toString(),
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 70,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "*F",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 70,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 180,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xff443C68),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/max-temp.png",
                              width: 50,
                            ),
                            Text(
                              "Temprature",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "${weatherController.weather.value.temperature.toString()} F",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 180,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xff443C68),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/windspeed.png",
                              width: 50,
                            ),
                            Text(
                              "Wind Speed",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "${weatherController.weather.value.windSpeed.toString()} /Km",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 180,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xff443C68),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/humidity.png",
                                width: 50,
                              ),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "${weatherController.weather.value.humidity.toString()} %",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ]),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 180,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xff443C68),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/hail.png",
                                width: 50,
                              ),
                              Text(
                                "Pressure",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "${weatherController.weather.value.pressure.toString()} F",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ]),
                      ),
                    ],
                  )),
              SizedBox(height: 10),
            ],
          ),
        ),
      )),
    );
  }
}
