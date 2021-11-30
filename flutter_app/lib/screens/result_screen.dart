import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/app_text_style.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    required this.bmiResult,
    required this.resultText,
    required this.interpret,
    required this.resultColor,
  });

  final String bmiResult;
  final String resultText;
  final String interpret;
  final Color? resultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTextStyle.backgroundDarkColor,
      appBar: AppBar(
        backgroundColor: AppTextStyle.backgroundDarkColor,
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: AppTextStyle.resultTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration:  BoxDecoration(
                color: AppTextStyle.containerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: AppTextStyle.kResultTextStyle.copyWith(color: resultColor),
                  ),
                  Text(
                    bmiResult,
                    style: AppTextStyle.kBMITextStyle,
                  ),
                  Text(
                    interpret,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 60.0,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "RE-CALCULATE",
                style: AppTextStyle.kLargeButTextStyle
                    .copyWith(color: Colors.white),
              ),
              color: AppTextStyle.resultButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}
