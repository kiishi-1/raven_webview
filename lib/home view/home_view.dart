import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:reven2/go%20to%20webview/goto_webview.dart';
import 'package:reven2/home%20view/goto_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int activeIndex = 0;
  List<String> picList = [
    'assets/saved_image.png',
    'assets/saved_image22.jpg',
    'assets/saved_image33.jpg',
  ];
  buildImage(String picImage, int index) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(picImage), fit: BoxFit.cover),
        color: Colors.grey,
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: picList.length,
      effect: const ScrollingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: Colors.cyan,
        dotColor: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            // ignore: prefer_const_constructors
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/raven3.jpg'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Welcome to Raven's Port",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                CarouselSlider.builder(
                  itemCount: picList.length,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.5,
                    enableInfiniteScroll: true,
                    pageSnapping: true,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: ((index, reason) =>
                        setState(() => activeIndex = index)),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final picImage = picList[index];

                    return buildImage(picImage, index);
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                buildIndicator(),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GoToWebView()));
              },
              child: Align(alignment: Alignment.center, child: GoToContainer()),
            ),
          ],
        ),
      ),
    );
  }
}
