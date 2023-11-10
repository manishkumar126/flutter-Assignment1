import 'package:flutter/material.dart';
import 'dart:math';
import 'secondScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color buttonColor = Colors.blue;
  Color paragraphColor = Colors.black;
  String originalParagraphText = 'This is a paragraph of text. You can add more details here.';
  String paragraphText = 'This is a paragraph of text. You You can add more details here.';

  void changeColorsAndText() {
    setState(() {
      buttonColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      paragraphColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      paragraphText = 'This is a new paragraph text. You can customize it as needed.';
    });
  }

  void changeTextOnly() {
    setState(() {
      paragraphText = 'The text was changed by clicking the button.';
    });
  }

  void revertText() {
    setState(() {
      paragraphText = originalParagraphText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Flutter Assignment!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: paragraphColor,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              paragraphText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: paragraphColor),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Go to Second Screen',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: changeColorsAndText,
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Change Colors and Text',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: changeTextOnly,
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Change Text Only',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: revertText,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Revert Text',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}