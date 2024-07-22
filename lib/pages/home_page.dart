import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/component_3.dart';
import 'package:smart_daigoku/components/quotes_component.dart';
import 'package:smart_daigoku/components/weather_component.dart';
import 'package:smart_daigoku/pages/availability_Page.dart';
import 'package:smart_daigoku/pages/cafeteria_page.dart';
import 'package:smart_daigoku/pages/classroom_page.dart';
import 'package:smart_daigoku/pages/overall_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smart_daigoku/services/weather/weather_model.dart';
import 'package:smart_daigoku/services/weather/weather_service.dart';
import '../components/date_display.dart';
import '../components/page_card.dart';
import '../components/drawer.dart';
import '../data/keys.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _currentPage = 'Home';
  final DateTime today = DateTime.now();
  late PageController _pageController;
  late Timer _timer;
  final _weatherService = WeatherService(Keys.WEATHER_API_KEY);
  WeatherModel? _weather;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      int nextPage = _pageController.page!.round() + 1;
      if (nextPage == 3) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    });
    _fetchWeather();
  }

  _fetchWeather() async {
    try {
      List<String> cityInfos = await _weatherService.getCurrentCity();
      final weather =
          await _weatherService.getWeather(cityInfos[0], cityInfos[1]);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Icon(
                        Icons.school,
                        size: 80,
                        color: Color(0xFF52556F),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Smart',
                            style: TextStyle(
                              color: Color(0xFF52556F),
                              fontSize: 40,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Daigoku',
                            style: TextStyle(
                              color: Color(0xFF52556F),
                              fontSize: 40,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      DateDisplay(date: today),
                      GridView.count(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          CustomPageCard(
                            icon: Icons.notifications,
                            title: 'Overall',
                            explanation: 'Check your Notifications',
                            page: OverallPage(),
                          ),
                          CustomPageCard(
                            icon: Icons.local_cafe,
                            title: 'Cafeteria',
                            explanation: 'Check the cafeteria state',
                            page: CafeteriaPage(),
                          ),
                          CustomPageCard(
                            icon: Icons.people,
                            title: 'Availability',
                            explanation:
                                'Check the availability of academic staff',
                            page: AvailabilityPage(),
                          ),
                          CustomPageCard(
                            icon: Icons.class_,
                            title: 'Classroom',
                            explanation: 'Check your classroom state',
                            page: ClassroomPage(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xFF52556F),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        child: Stack(
                          children: [
                            PageView(
                              controller: _pageController,
                              children: [
                                WeatherComponent(weather: _weather),
                                QuotesComponent(),
                                Component3(),
                              ],
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: SmoothPageIndicator(
                                  controller: _pageController,
                                  count: 3,
                                  effect: WormEffect(
                                    dotHeight: 8,
                                    dotWidth: 8,
                                    activeDotColor: Colors.white,
                                    dotColor: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 45,
                left: 15,
                child: GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Icon(
                      Icons.menu,
                      size: 25,
                    )),
              ),
            ],
          );
        },
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
