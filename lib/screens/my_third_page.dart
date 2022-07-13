import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_exam/global_widgets/my_custom_app_bar.dart';
import 'package:second_exam/global_widgets/my_custom_button.dart';
import 'package:second_exam/utils/colors.dart';
import 'package:second_exam/utils/icons.dart';
import 'package:second_exam/utils/styles.dart';

class MyThirdPage extends StatefulWidget {
  const MyThirdPage({Key? key}) : super(key: key);

  @override
  State<MyThirdPage> createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {
  final TextEditingController cardController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String cardText = "";
  String dateText = "";

  @override
  void dispose() {
    cardController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: MyCustomAppBar(
        title: "Back",
        titleColor: Colors.yellowAccent,
        onTap: () {},
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Card",
                style: MyTextStyle.interSemiBold600
                    .copyWith(fontSize: 16, color: MyColors.C_CCCCCC),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      child: Image.asset(MyIcons.thirdImage1),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    right: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          MyIcons.thirdImage2,
                          width: 70,
                          height: 30,
                          color: MyColors.white,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              MyIcons.thirdImage0,
                              width: 30,
                              height: 25,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "VALID\nTHRU",
                                      style: MyTextStyle.interRegular400
                                          .copyWith(
                                              color: MyColors.white,
                                              fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        dateText,
                                        style:
                                            MyTextStyle.interBold700.copyWith(
                                          fontSize: 24,
                                          color: MyColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 80,
                                  height: 1,
                                  color: MyColors.white,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          cardText,
                          style: MyTextStyle.interBold700.copyWith(
                            fontSize: 24,
                            color: MyColors.white,
                          ),
                        ),
                        Container(
                          height: 1,
                          color: MyColors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "Card number",
                style: MyTextStyle.interSemiBold600
                    .copyWith(fontSize: 16, color: MyColors.C_CCCCCC),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        onChanged: (v) {
                          setState(() {
                            cardText = v;
                          });
                        },
                        cursorHeight: 30,
                        style: MyTextStyle.interBold700.copyWith(
                          fontSize: 24,
                          color: MyColors.black,
                        ),
                        decoration: InputDecoration.collapsed(hintText: ""),
                      ),
                    ),
                    Image.asset(
                      MyIcons.thirdImage2,
                      width: 70,
                      height: 30,
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: MyColors.black,
              ),
              SizedBox(height: 20),
              Text(
                "Expire date",
                style: MyTextStyle.interSemiBold600
                    .copyWith(fontSize: 16, color: MyColors.C_CCCCCC),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: 150,
                child: TextField(
                  maxLength: 5,
                  inputFormatters: [CardExpirationFormatter()],
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    setState(() {
                      dateText = v;
                    });
                  },
                  cursorHeight: 30,
                  style: MyTextStyle.interBold700.copyWith(
                    fontSize: 24,
                    color: MyColors.black,
                  ),
                  decoration: InputDecoration.collapsed(hintText: ""),
                ),
              ),
              Container(
                height: 1,
                width: 150,
                color: MyColors.black,
              ),
              MyCustomButton(
                onTap: () {},
                text: "Add",
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
