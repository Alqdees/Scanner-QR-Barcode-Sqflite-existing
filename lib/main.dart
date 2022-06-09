import 'package:flutter/material.dart';
import 'package:scanner_qr_barcode/AddData.dart';
import 'package:scanner_qr_barcode/Home.dart';

void main()  async {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();

}

class _MyApp extends State<MyApp>{


  @override
  initState(){
    super.initState();
    const Home();
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const Home(),
      routes: {"AddData":(context) => const AddData()},
    );

  }
}