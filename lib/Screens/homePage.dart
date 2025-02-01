import 'package:flutter/material.dart';
import 'package:seed_application/Screens/welcome_Screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {

  final String apiKey = 'ede05a6991004763b9074142252101';
  final String city = 'Kottayam';

  Future<Map<String, dynamic>> fetchWeather() async {
    final response = await http.get(
      Uri.parse('https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFB6B6B6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10), // Spacing between image and text
                  const Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40), // Makes the image circular
                    child: Image.asset(
                      'assets/images/images.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill, // Ensures the image fits within the circular frame
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text('Guide'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Share'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings or perform an action
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.flag_outlined),
              title: const Text('Report'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.support_agent_outlined),
              title: const Text('Support'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Perform logout logic
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const welcome_Screen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: FutureBuilder<Map<String, dynamic>>(
          future: fetchWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final weather = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('City: ${weather['location']['name']}'),
                    Text('Temperature: ${weather['current']['temp_c']}°C'),
                    Text('Condition: ${weather['current']['condition']['text']}'),
                    Text('Humidity: ${weather['current']['humidity']}%'),
                  ],
                ),
              );
            }
          },
          ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

