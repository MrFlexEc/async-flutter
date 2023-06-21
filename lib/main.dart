/*
Coded by: MrFlexEc
Supported by: Flutter
Supervised by: Edgardo Panchana
*/

import 'package:flutter/material.dart';
import 'package:practica_asincronia/services/mockapi.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimatedScreen(),
    );
  }
}

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  final MockApi _mockApi = MockApi();

  String numberGreen = '';
  String numberOrange = '';
  String numberRed = '';

  double containerGreen = 0.0;
  double containerOrange = 0.0;
  double containerRed = 0.0;

  Duration durationGreen = const Duration(seconds: 1);
  Duration durationOrange = const Duration(seconds: 3);
  Duration durationRed = const Duration(seconds: 10);

  void onPressedGreen() async {
    setState(() {
      containerGreen = 100.0;
    });
    final result = await _mockApi.getFerrariInteger();
    setState(() {
      containerGreen = 0.0;
      numberGreen = '$result';
    });
  }
  void onPressedOrange() async{
    setState(() {
      containerOrange = 100.0;
    });
    final result = await _mockApi.getHyundaiInteger();
    setState(() {
      containerOrange = 0.0;
      numberOrange = '$result';
    });
  }
  void onPressedRed() async{
    setState(() {
      containerRed = 100.0;
    });
    final result = await _mockApi.getHyundaiInteger();
    setState(() {
      containerRed = 0.0;
      numberRed = '$result';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asynchronous call - Lenny Alvarado'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: onPressedGreen, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)
                  ),
                  child: const SizedBox(
                    width: 50.0,
                    height: 70.0,
                    child: Center(
                      child: Icon(
                        Icons.bolt, 
                        color: Colors.black,
                        size: 30,
                      )
                    ),
                  )
                ),
                const SizedBox(height: 10,),
                AnimatedContainer(
                  width: containerGreen,
                  height: 10.0,
                  duration: durationGreen,
                  decoration: const BoxDecoration(color: Colors.green),
                ),
                const SizedBox(height: 10,),
                Text(numberGreen, style: const TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 20,), 
            Column(
              children: [
                ElevatedButton(
                  onPressed: onPressedOrange, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)
                  ),
                  child: const SizedBox(
                    width: 50.0,
                    height: 70.0,
                    child: Center(
                      child: Icon(
                        Icons.emoji_transportation_sharp, 
                        color: Colors.black,
                        size: 30,
                      )
                    ),
                  )
                ),
                const SizedBox(height: 10,),
                AnimatedContainer(
                  width: containerOrange,
                  height: 10.0,
                  duration: durationOrange,
                  decoration: const BoxDecoration(color: Colors.orange),
                ),
                const SizedBox(height: 10,),
                Text(numberOrange, style: const TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 20,),
            Column(
              children: [
                ElevatedButton(
                  onPressed: onPressedRed, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  child: const SizedBox(
                    width: 50.0,
                    height: 70.0,
                    child: Center(
                      child: Icon(
                        Icons.assist_walker, 
                        color: Colors.black,
                        size: 30,
                      )
                    ),
                  )
                ),
                const SizedBox(height: 10,),
                AnimatedContainer(
                  width: containerRed,
                  height: 10.0,
                  duration: durationRed,
                  decoration: const BoxDecoration(color: Colors.red),
                ),
                const SizedBox(height: 10,),
                Text(numberRed, style: const TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ]
        ),
      ),
    );
  }
}