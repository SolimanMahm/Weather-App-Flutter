import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

import '../models/weather_model.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? CityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: CityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherDate =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  CityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Color(0xffFFAD3B)),
              ),
              hintText: "Enter a city",
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(cityName: CityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherDate = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = CityName;
                  Navigator.pop(context);
                },
                child: const Icon(Icons.search, size: 40),
              ),
              label: const Text(
                "search",
                style: TextStyle(fontSize: 25),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 35, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
