import 'dart:convert';
import 'package:axios_flutter_2/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  late String character;

  Future<dynamic> getCharacter(String character) async {
    String baseUrl =
        'http://gateway.marvel.com/v1/public/characters?ts=1&name=$character&apikey=70012023d1a3cd4fc190b9934437d42b&hash=aa9a93889872cae506a1605a14a362aa';

    var url = Uri.parse(baseUrl);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);

        if (responseBody["data"]["count"] == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error:- Not found!"),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return CharacterScreen(
                  description: responseBody["data"]["results"][0]["description"]
                      .toString(),
                  imgurl: responseBody["data"]["results"][0]["thumbnail"]
                          ["path"]
                      .toString(),
                  title: responseBody["data"]["results"][0]["name"].toString(),
                );
              },
            ),
          );
        }
      } else {
        print("Failed");
        //throw exception and catch it in UI
      }
    }
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight / 8,
            ),
            const Text(
              "MARVEL",
              style: TextStyle(
                fontFamily: "BentonSans",
                color: Colors.white,
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight / 8,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenHeight / 25),
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: "BentonSans",
                    ),
                    controller: _controller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter a Character name...',
                      hintStyle: TextStyle(
                        fontFamily: "BentonSans",
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 3,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () async {
                  character = _controller.text.trim();
                  getCharacter(character);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight / 80),
                  child: const Center(
                    child: Text(
                      "Search",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "BentonSans",
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
