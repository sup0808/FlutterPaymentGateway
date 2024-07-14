import 'package:flutter/material.dart';
import 'package:flutter_razarpay/PaymentGateway/razarpay_screen.dart';

import 'PaymentGateway/upi_india_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}


class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Payment Gateway"),
     ),
     body : Container(
       alignment: Alignment.center,
       child: Column(
         children: [
           RazarpayScreen(),
           UpiIndiaScreen()

         ],
       ),
     )
   );
  }
}
