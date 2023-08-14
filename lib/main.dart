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
  String myHand = '👊';

  void selectHand(String slectedHand) {
    myHand = slectedHand;
    setState(() {});
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
              myHand,
              style: const TextStyle(
                fontSize: 100,
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
