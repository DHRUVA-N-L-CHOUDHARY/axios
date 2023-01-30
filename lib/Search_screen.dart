import 'package:axios_flutter_2/Intro_screen.dart';
import 'package:axios_flutter_2/Widgets/Custom_button.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String title;
  final String imgurl;
  final String description;
   MyWidget({
    super.key,
    required this.title,
    required this.imgurl,
    required this.description,
  });

MediaQueryData? _mediaQueryData;
  double? screenWidth;
  double? screenHeight;
  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData?.size.height;
    screenWidth = _mediaQueryData?.size.width;

    // Get the proportionate height as per screen size
    double getProportionateScreenHeight(double inputHeight) {
      // 812 is the layout height that designer use
      return (inputHeight / 812.0) * screenHeight!;
    }

    // Get the proportionate height as per screen size
    double getProportionateScreenWidth(double inputWidth) {
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth!;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "MARVEL APP",
          style: TextStyle(
              fontFamily: "BentonSans", color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(60),
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: "BentonSans",
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Image.network(
              "$imgurl.jpg",
              width:getProportionateScreenWidth(200),
              height:getProportionateScreenHeight(200),
            ),
            SizedBox(
              height:getProportionateScreenHeight(20),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: "BentonSans",
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height:getProportionateScreenHeight(20),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const IntroScreen();
                    },
                  ));
                },
                child: Container(
                  height:getProportionateScreenHeight(54),
                  width:getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Search Again",
                      style: TextStyle(
                        fontFamily: "BentonSans",
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
