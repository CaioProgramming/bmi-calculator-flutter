import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/utils/ColorHelper.dart';
import 'package:bmi_calculator/components/IncreaseDecreaseCard.dart';
import 'package:bmi_calculator/Person.dart';
import 'package:bmi_calculator/screens/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/BMICard.dart';
import '../components/HeightSlider.dart';
import '../components/IconContent.dart';

class InputPage extends StatefulWidget {
  final Color maincolor;
  final Person person;
  InputPage(this.maincolor, this.person);

  @override
  _InputPageState createState() => _InputPageState(maincolor, this.person);
}

class _InputPageState extends State<InputPage> {
  Color color;
  Person person;

  _InputPageState(this.color, this.person);
  void updateWeight() {
    setState(() {
      if (person.weight == null)
        person.weight = 0.0 + 0.5;
      else
        person.weight = person.weight + 0.5;
    });
  }

  void decreaseWeight() {
    setState(() {
      if (person.weight == null)
        person.weight = 60.0 - 0.5;
      else
        person.weight = person.weight - 0.5;
    });
  }

  void updateAge() {
    setState(() {
      if (person.age == null)
        person.age = 0 + 1;
      else
        person.age++;
    });
  }

  void decreaseAge() {
    setState(() {
      if (person.age == null)
        person.age = 0;
      else
        person.age--;
    });
  }

  Color cardColor() {
    return darkColor(15);
  }

  bool canShowResults() => person.statusComplete();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                      onTap: () {
                        updateSelection('Male');
                      },
                      color: checkCard('Male'),
                      cardChild: IconContent(FontAwesomeIcons.mars, 'Male',
                          defineIconColor('Male'))),
                ),
                Expanded(
                  child: BMICard(
                      onTap: () {
                        updateSelection('Female');
                      },
                      color: checkCard('Female'),
                      cardChild: IconContent(FontAwesomeIcons.venus, 'Female',
                          defineIconColor('Female'))),
                ),
              ],
            ),
            Expanded(
                child: BMICard(
              color: checkCard(),
              cardChild: HeightSlider(person, color),
            )),
            Row(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                    color: checkCard(),
                    cardChild: IncreaseDecreaseCard(
                      showasInt: false,
                      color: checkCard(),
                      increaseClick: () {
                        updateWeight();
                      },
                      decreaseClick: () {
                        decreaseWeight();
                      },
                      label: 'Weight',
                      initialValue: personweight(),
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    color: checkCard(),
                    cardChild: IncreaseDecreaseCard(
                      showasInt: true,
                      color: checkCard(),
                      increaseClick: () {
                        updateAge();
                      },
                      decreaseClick: () {
                        decreaseAge();
                      },
                      label: 'Age',
                      initialValue: personage(),
                    ),
                  ),
                ),
              ],
            ),
            BottomButton(visible: canShowResults(),onTap: () {calculateResults();},title: 'CALCULATE',)
          ],
        ),
      ),
    );
  }

  double personage() => person.age != null ? person.age.toDouble() : 0;

  double personweight() => person.weight != null ? person.weight : 0;

  void calculateResults() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ResultPage(cardColor(),person)));
  }

  Color darkColor(int amount) {
    return ColorHelper().darken(color, amount);
  }

  Color lightColor(int amount) {
    return ColorHelper().brighten(color, amount);
  }

  void updateSelection(String selection) {
    setState(() {
      person.gender = selection;
    });
  }

  Color checkCard([String gender]) {
    return (person.gender != null && person.gender == gender)
        ? lightColor(10)
        : cardColor();
  }

  Color defineIconColor(String gender) => (person.gender == gender) ? Colors.white : lightColor(10);


}


