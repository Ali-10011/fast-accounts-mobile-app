import 'package:fast_accounts/views/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastAccounts',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const LoadingScreen(),
    );
  }
}
