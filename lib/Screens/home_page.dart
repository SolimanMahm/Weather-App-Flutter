import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/search_page.dart';
import 'package:weather_app/models/weather_model.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

WeatherModel? weatherDate;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    weatherDate = Provider.of<WeatherProvider>(context).weatherDate;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: weatherDate == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "there is no weather 😔 start",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "searching now 🔍",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 3,
                ),
                Text(
                  Provider.of<WeatherProvider>(context).cityName ?? '',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  'updated at: ${weatherDate?.date.hour.toString() ?? ''}:${weatherDate?.date.minute.toString() ?? ''}',
                  style: const TextStyle(fontSize: 22),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: NetworkImage('http:${weatherDate?.image ?? ''}'),
                    ),
                    Text(
                      '${weatherDate?.temp ?? ''}',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          'maxTemp: ${weatherDate?.maxTemp ?? ''}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          'minTemp: ${weatherDate?.minTemp ?? ''}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  weatherDate?.weatherStateName ?? '',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 6,
                ),
              ],
            ),
    );
  }
}
