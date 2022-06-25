import 'package:flutter/material.dart';
import 'package:reven2/constants/load_images.dart';
import 'package:reven2/home%20view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LoadImage loadImage = LoadImage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.wait([
      loadImage.loadImg(context, 'assets/raven3.jpg'),
      loadImage.loadImg(context, 'assets/saved_image.png'),
      loadImage.loadImg(context, 'assets/saved_image22.jpg'),
      loadImage.loadImg(context, 'assets/saved_image33.jpg'),
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomeView(),
    );
  }
}

