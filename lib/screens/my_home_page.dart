import 'package:flutter/material.dart';
import 'package:second_exam/global_widgets/my_custom_button.dart';
import 'package:second_exam/screens/my_first_page.dart';
import 'package:second_exam/screens/my_second_page.dart';
import 'package:second_exam/screens/my_third_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter N5 Exam 2, Starter project"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCustomButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const MyFirstPage();
                }));
              },
              text: "First Page",
            ),
            MyCustomButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const MySecondPage();
                }));
              },
              text: "Second Page",
            ),
            MyCustomButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const MyThirdPage();
                }));
              },
              text: "Third Page",
            ),
          ],
        ),
      ),
    );
  }
}
