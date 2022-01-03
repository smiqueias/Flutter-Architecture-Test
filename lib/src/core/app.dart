import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter architecture test",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
