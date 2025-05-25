import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_10calculator/components/mybutton.dart';

import 'package:math_expressions/math_expressions.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 9),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                userInput.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              answer.toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 171, 230, 44),
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MyButton(
                                title: "AC",
                                onPres: () {
                                  userInput = '';
                                  answer = '';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '+/-',
                                onPres: () {
                                  userInput += '+/-';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '%',
                                onPres: () {
                                  userInput += '%';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '/',
                                color: Colors.orange,
                                onPres: () {
                                  userInput += '/';
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              MyButton(
                                title: "9",
                                onPres: () {
                                  userInput += '9';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '8',
                                onPres: () {
                                  userInput += '8';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '7',
                                onPres: () {
                                  userInput += '7';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '+',
                                color: Colors.orange,
                                onPres: () {
                                  userInput += '+';
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              MyButton(
                                title: "6",
                                onPres: () {
                                  userInput += '6';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '5',
                                onPres: () {
                                  userInput += '5';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '4',
                                onPres: () {
                                  userInput += '4';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '-',
                                color: Colors.orange,
                                onPres: () {
                                  userInput += '-';
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              MyButton(
                                title: "1",
                                onPres: () {
                                  userInput += '1';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '2',
                                onPres: () {
                                  userInput += '2';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '3',
                                onPres: () {
                                  userInput += '3';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '*',
                                color: Colors.orange,
                                onPres: () {
                                  userInput += '*';
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              MyButton(
                                title: ".",
                                onPres: () {
                                  userInput += '.';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '0',
                                onPres: () {
                                  userInput += '0';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: 'Dl',
                                onPres: () {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: '=',
                                color: Colors.orange,
                                onPres: () {
                                  equalPress();
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}






































//  Text("Hello Abdal Bhai",style: TextStyle(fontSize: 25,color: greencolor ),),
//               Text("Hello Abdal Bhai",style: TextStyle(fontSize: 25,color: greencolor),),
//               Text("Hello Abdal Bhai",style: TextStyle(fontSize: 25,color: Colors.red),),
//               Text("Hello Abdal Bhai",style: TextStyle(fontSize: 25,color: greycolor,),),
//               Text("Hello Abdal Bhai",style: headingtextsyle,)
           