import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:auth_page/utils/global_theme.dart';

class PizzaCalc extends StatefulWidget {
  const PizzaCalc({Key? key}) : super(key: key);

  @override
  _PizzaCalcState createState() => _PizzaCalcState();
}

enum Sauces { spicy, barbeku, withoutSauce }

class _PizzaCalcState extends State<PizzaCalc> {
  Sauces? currSauce = Sauces.spicy;
  bool switchForCheese = true;
  double _sliderVal = 5;
  bool superSlim = false;
  int cost = 0;

  int _stoimost() {
    int addCoast = _sliderVal.round();

    switch (addCoast) {
      case 0:
        addCoast += 100;
        break;
      case 5:
        addCoast += 200;
        break;
      case 10:
        addCoast += 300;
        break;
      case 15:
        addCoast += 400;
        break;
    }

    //доп стоимость за вид соуса
    switch (currSauce) {
      case Sauces.spicy:
        addCoast += 50;
        break;
      case Sauces.barbeku:
        addCoast += 70;
        break;
      case Sauces.withoutSauce:
        addCoast += 0;
        break;
      default:
        break;
    }

    cost = addCoast + 200;

    if (superSlim) cost += 100;
    if (switchForCheese) cost += 100;

    return cost;
  }

  //ф-я подписи слайдера
  String sizePizzaText(sliderVal) {
    String backed = '${sliderVal.round() + 20} cm';
    if (sliderVal == 0) {
      backed = "Little ${_sliderVal.round() + 20} cm";
    }
    if (sliderVal == 15) {
      backed = "Huge ${_sliderVal.round() + 20} cm";
    }
    return backed;
  }

  void chooseSauce(Sauces? val) {
    setState(() {
      currSauce = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: 'Pizza Calc',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ]),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 50,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                //картинка пиццы
                Container(
                  alignment: Alignment.topCenter,
                  child: const Image(
                    width: 100,
                    image: AssetImage('assets/pizza_animation.gif'),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Setup your pizza',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      SlidingSwitch(
                        value: false,
                        width: 300,
                        onChanged: (bool val) {
                          superSlim = val;
                          setState(() {
                            _stoimost();
                          });
                        },
                        height: 34,
                        animationDuration: const Duration(milliseconds: 50),
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        textOff: "Classic pastry",
                        textOn: "Super slim",
                        colorOn: const Color(0xffffffff),
                        colorOff: const Color(0xffffffff),
                        background: Colors.grey,
                        buttonColor: Theme.of(context).colorScheme.primary,
                        inactiveColor: const Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 25),
                        child: Text('Размер:',
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.left),
                      ),
                      Slider(
                        activeColor: Theme.of(context).colorScheme.primary,
                        inactiveColor: Colors.grey,
                        value: _sliderVal,
                        max: 15,
                        divisions: 3,
                        label: sizePizzaText(_sliderVal),
                        onChanged: (double val) {
                          setState(() {
                            _sliderVal = val;
                            _stoimost();
                          });
                        },
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 15, bottom: 5),
                        child: Text('Sauce:',
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.left),
                      ),
                      RadioListTile<Sauces>(
                        activeColor: Theme.of(context).colorScheme.primary,
                        title: const Text(
                          'Spicy',
                          style: TextStyle(color: blackColor),
                        ),
                        value: Sauces.spicy,
                        groupValue: currSauce,
                        onChanged: chooseSauce,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -3.0),
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          //width: 200,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      RadioListTile<Sauces>(
                        activeColor: Theme.of(context).colorScheme.primary,
                        title: const Text(
                          'Barbekue',
                          style: TextStyle(color: blackColor),
                        ),
                        value: Sauces.barbeku,
                        groupValue: currSauce,
                        onChanged: chooseSauce,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -3.0),
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          width: 200,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      RadioListTile<Sauces>(
                        activeColor: Theme.of(context).colorScheme.primary,
                        title: const Text(
                          'Without sauce',
                          style: TextStyle(color: blackColor),
                        ),
                        value: Sauces.withoutSauce,
                        groupValue: currSauce,
                        onChanged: chooseSauce,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -3.0),
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          width: 200,
                          height: 1,
                          color: Colors.black,
                          margin: const EdgeInsets.only(bottom: 10),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.local_pizza_outlined,
                              color: blackColor,
                            ),
                            const Text(
                              'Extra cheese',
                              style: TextStyle(color: blackColor),
                            ),
                            Switch(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                value: switchForCheese,
                                onChanged: (val) {
                                  setState(() {
                                    switchForCheese = !switchForCheese;
                                    _stoimost();
                                  });
                                }),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 300,
                        child: const Text('Price:',
                            style: TextStyle(
                                fontSize: 18,
                                color: blackColor,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: 300,
                        height: 34,
                        decoration: const BoxDecoration(
                            color: whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(36))),
                        child: Center(
                          child: Text(
                            '${_stoimost().toString()} rub',
                            style: const TextStyle(
                                color: blackColor, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 30),
                        width: 154,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Order',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
