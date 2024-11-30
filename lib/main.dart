import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Welcome to Seed",
      "subtitle": "Empowering smart agriculture with advanced technology.",
      "image": "assets/images/Welcome.jpg", // Add your image assets here
    },
    {
      "title": "Smart Crop Suggestions",
      "subtitle": "Get the best crop recommendations for your soil.",
      "image": "assets/images/crop_recommendations.jpg",
    },
    {
      "title": "Real-Time Monitoring",
      "subtitle": "Track soil health and weather data anytime, anywhere.",
      "image": "assets/images/soil_weather.jpg",
    },
    {
      "title": "Real-Time Monitoring",
      "subtitle": "Track soil health and weather data anytime, anywhere.",
      "image": "assets/images/soil_weather.jpg",
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the next page (e.g., Login/Signup) when onboarding is complete
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Seed Home Page')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      data["image"]!,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data["title"]!,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data["subtitle"]!,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Skip to the last page
                    _pageController.jumpToPage(_onboardingData.length - 1);
                  },
                  child: const Text("Skip"),
                ),
                Row(
                  children: List.generate(
                    _onboardingData.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8.0,
                      width: _currentPage == index ? 16.0 : 8.0,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.deepPurple
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _nextPage,
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('Welcome to Seed Home Page!'),
      ),
    );
  }
}
