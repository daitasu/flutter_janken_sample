import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: JankenPage());
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String computerHand = '👊';
  String myHand = '👊';
  String result = '引き分け';

  void selectHand(String slectedHand) {
    myHand = slectedHand;
    generateComputeHand();
    Judge();
    setState(() {});
  }

  void Judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == '👊' && computerHand == '🦞' ||
        myHand == '🦞' && computerHand == '🖐' ||
        myHand == '🖐' && computerHand == '👊') {
      result = '勝ち';
    } else {
      result = '負け';
    }
    ;
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '👊';
      case 1:
        return '🦞';
      case 2:
        return '🖐';
      default:
        return '🖐';
    }
  }

  void generateComputeHand() {
    computerHand = randomNumberToHand(Random().nextInt(3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              computerHand,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              myHand,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      selectHand('👊');
                    },
                    child: const Text('👊')),
                OutlinedButton(
                    onPressed: () {
                      selectHand('🦞');
                    },
                    child: const Text('🦞')),
                OutlinedButton(
                    onPressed: () {
                      selectHand('🖐');
                    },
                    child: const Text('🖐')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
