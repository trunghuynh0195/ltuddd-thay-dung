import 'package:flutter/material.dart';
import 'package:flutter_application_1/enum/gender.dart';
import 'package:flutter_application_1/screens/result_screen.dart';
import 'package:flutter_application_1/util/app_text_style.dart';
import 'package:flutter_application_1/util/calculate.dart';

class CalculatorBMI extends StatefulWidget {
  const CalculatorBMI({Key? key}) : super(key: key);

  @override
  _CalculatorBMIState createState() => _CalculatorBMIState();
}

class _CalculatorBMIState extends State<CalculatorBMI> {
  Gender? selectedGender;
  int height = 182;
  int weight = 66;
  int age = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111328),
      appBar: AppBar(
        backgroundColor: AppTextStyle.backgroundDarkColor,
        centerTitle: true,
        title: const Text("BMI CALCULATOR"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _gender(),
        _sliderHeight(),
        _setWeigthAge(),
        _confirmButton(),
      ],
    );
  }

  Widget _gender() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  selectedGender = null;
                });
              },
              onTap: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: selectedGender == Gender.male
                      ? AppTextStyle.enableButtonColor
                      : AppTextStyle.containerColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.male,
                      size: 80,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "MALE",
                      style: AppTextStyle.nameTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  selectedGender = null;
                });
              },
              onTap: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: selectedGender == Gender.female
                      ? AppTextStyle.enableButtonColor
                      : AppTextStyle.containerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.female,
                      size: 80,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "FEMALE",
                      style: AppTextStyle.nameTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sliderHeight() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: AppTextStyle.containerColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HEIGHT',
              style: AppTextStyle.nameTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  height.toString(),
                  style: AppTextStyle.numberSliderTextStyle
                      .copyWith(color: Colors.white),
                ),
                const Text(
                  'cm',
                  style: AppTextStyle.nameTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: const Color(0xFF8D8E98),
                thumbColor: const Color(0xFFEB1555),
                overlayColor: const Color(0x29EB1555),
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 15.0,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 30.0,
                ),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 0.0,
                max: 250.0,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setWeigthAge() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 15.0, right: 15, left: 15, bottom: 5),
              decoration: BoxDecoration(
                color: AppTextStyle.containerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "WEIGTH",
                    style: AppTextStyle.nameTextStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: AppTextStyle.numberSliderTextStyle
                        .copyWith(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        elevation: 0.0,
                        constraints: const BoxConstraints.tightFor(
                          width: 56.0,
                          height: 56.0,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF4C4F5E),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      RawMaterialButton(
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        elevation: 0.0,
                        constraints: const BoxConstraints.tightFor(
                          width: 56.0,
                          height: 56.0,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF4C4F5E),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 5),
              decoration: BoxDecoration(
                color: AppTextStyle.containerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "AGE",
                    style: AppTextStyle.nameTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: AppTextStyle.numberSliderTextStyle
                        .copyWith(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        elevation: 0.0,
                        constraints: const BoxConstraints.tightFor(
                          width: 56.0,
                          height: 56.0,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF4C4F5E),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      RawMaterialButton(
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        elevation: 0.0,
                        constraints: const BoxConstraints.tightFor(
                          width: 56.0,
                          height: 56.0,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF4C4F5E),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _confirmButton() {
    return GestureDetector(
      onTap: () {
        Calculate calc = Calculate(height: height, weight: weight);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              bmiResult: calc.calcBMI(),
              resultText: calc.getResult(),
              interpret: calc.getInterpret(),
              resultColor: calc.getColor(),
            ),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 60.0,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          "CALCULATE",
          style: AppTextStyle.kLargeButTextStyle.copyWith(color: Colors.white),
        ),
        color: AppTextStyle.resultButtonColor,
      ),
    );
  }
}
