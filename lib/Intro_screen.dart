import 'package:axios_flutter_2/Api_fetch.dart';
import 'package:axios_flutter_2/Search_screen.dart';
import 'package:axios_flutter_2/Widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _controller = TextEditingController();
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: getProportionateScreenHeight(100),
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
              height: getProportionateScreenHeight(100),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: getProportionateScreenHeight(70),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        fontFamily: "BentonSans",
                      ),
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                          fontFamily: "BentonSans",
                        ),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 20.0),
                        ),
                        hintText: 'Enter a Character name...',
                      ),
                    ),
                    // Update search results based on the user's input
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  String sp = _controller.text;
                  // print("$sp");
                  var response = await BaseClient()
                      .get(
                          "$sp&apikey=70012023d1a3cd4fc190b9934437d42b&hash=aa9a93889872cae506a1605a14a362aa")
                      .catchError((err) {});
                  if (response == null) return ;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return MyWidget(
                        description: response["data"]["results"][0]
                                ["description"]
                            .toString(),
                        imgurl: response["data"]["results"][0]["thumbnail"]
                                ["path"]
                            .toString(),
                        title:
                            response["data"]["results"][0]["name"].toString(),
                      );
                    },
                  ));
                },
                child: Container(
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                  ),
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
