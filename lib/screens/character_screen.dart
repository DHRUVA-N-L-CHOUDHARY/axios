import 'package:axios_flutter_2/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  final String title;
  final String imgurl;
  final String description;
  CharacterScreen({
    super.key,
    required this.title,
    required this.imgurl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "MARVEL APP",
          style: TextStyle(
            fontFamily: "BentonSans",
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 12,
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: "BentonSans",
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight / 25,
            ),
            Image.network(
              "$imgurl.jpg",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth / 15),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "BentonSans",
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ));
              },
              child: const Text(
                "Search Again",
                style: TextStyle(
                  fontFamily: "BentonSans",
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
