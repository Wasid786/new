import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stick/pages/login_page.dart';
import 'package:stick/select_interest.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final List<Map<String, String>> carouselImages = [
    {
      'imagePath': 'assets/gif06.gif',
      'text': 'be in control of your engagement',
    },
    {
      'imagePath': 'assets/gif02.gif',
      'text': 'Trace your suitable interest',
    },
    {
      'imagePath': 'assets/gif03.gif',
      'text': 'earn rewards in your passion journey',
    },
  ];

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  void _onCarouselPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _goToPrevious() {
    _carouselController.previousPage();
  }

  void _goToNext() {
    _carouselController.nextPage();
  }

  void _navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _navigateToSelectInterestPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectInterestPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 40, 2, 0),
          child: Container(
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    onPageChanged: _onCarouselPageChanged,
                  ),
                  items: carouselImages.map((imageMap) {
                    String imagePath = imageMap['imagePath']!;
                    String text = imageMap['text']!;
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                text,
                                style: const TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _goToPrevious,
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 300),
                    GestureDetector(
                      onTap: _goToNext,
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: carouselImages.asMap().entries.map((entry) {
                    int index = entry.key;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == index ? 12 : 10,
                      height: _currentIndex == index ? 12 : 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.black
                            : const Color.fromARGB(255, 250, 245, 245),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google01.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        _navigateToSelectInterestPage(context);
                      },
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(100, 40)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 58, 57, 57),
                        ),
                      ),
                      child: const Text('join stick'),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: _navigateToLoginPage,
                  child: const Text(
                    'Already a member? Login here',
                    style: TextStyle(
                        fontSize: 16, decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
