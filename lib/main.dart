import 'package:flutter/material.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:groceryapp/pages/data_from_api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ReadData(),
      ),
    );
  }
}
