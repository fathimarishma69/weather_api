import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String apiKey = '4706a8c4f3df4b8e85292538241607';
  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  String location = 'London'; // Default location

  @override
  void initState() {
    super.initState();
    fetchWeatherData(location);
  }

  Future<void> fetchWeatherData(String location) async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location'));

    if (response.statusCode == 200) {
      setState(() {
        weatherData = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void onLocationChange(String newLocation) {
    setState(() {
      location = newLocation;
      fetchWeatherData(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [Icon(Icons.menu, color: Colors.white, size: 40)],
          elevation: 0, // Remove shadow under the AppBar
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/screen2img.jpeg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric (horizontal: 20,vertical: 30),
                    child: Text(
                      "weather",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black26, Colors.black54],
                                  begin: Alignment.center,
                                  end: Alignment.bottomLeft),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30))),
                          child: Center(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Text(
                              "${weatherData!['current']['temp_c']} C \nTemperature",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      //  SizedBox(width: 10), // Reduced space between containers
                        Container(
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black26, Colors.black54],
                                  begin: Alignment.center,
                                  end: Alignment.bottomLeft),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30))),
                          child: Center(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Text(
                              "${weatherData!['current']['temp_f']} F\nFahrenheit",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black26, Colors.black54],
                                  begin: Alignment.center,
                                  end: Alignment.bottomLeft),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30))),
                          child: Center(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Text(
                              "${weatherData!['current']['humidity']}%\nHumidity",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                       // SizedBox(width: 10), // Reduced space between containers
                        Container(
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black26, Colors.black54],
                                  begin: Alignment.center,
                                  end: Alignment.bottomLeft),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30))),
                          child: Center(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Text(
                              "${weatherData!['current']['wind_kph']} kph\nWind Speed",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: Text(
                      "Locations",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            onLocationChange('India');
                          },
                          child: Container(
                            height: 57,
                            width: 166,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black54, Colors.black26],
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter),
                                border: Border.all(color: Colors.white)),
                            child: Center(
                                child: Text(
                                  "India",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            onLocationChange('Saudi Arabia');
                          },
                          child: Container(
                            height: 57,
                            width: 166,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black54, Colors.black26],
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter),
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Text(
                                "Saudi Arabia",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            onLocationChange('America');
                          },
                          child: Container(
                            height: 57,
                            width: 166,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black54, Colors.black26],
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter),
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Text(
                                "America",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            onLocationChange('Qatar');
                          },
                          child: Container(
                            height: 57,
                            width: 166,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black54, Colors.black26],
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter),
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Text("Qatar",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Text(
                      "Condition",
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        Container(
                          height: 95,
                          width: 132,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.black26]),
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Image.asset("assets/sunrise 1.png"),
                                isLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                  "${weatherData!['current']['condition']['text']}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          height: 95,
                          width: 132,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.black26]),
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Image.asset("assets/Vector (4).png"),
                                isLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                  "${weatherData!['current']['uv']} UV",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
