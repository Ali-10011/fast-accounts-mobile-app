import 'package:flutter/material.dart';
import 'package:fast_accounts/widgets/navigation_drawer.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("DashBoard")),
      drawer: const NavigationDrawerWidget(),
      body: const Center(child: ElevatedButton(onPressed: null, child: Text("DashBoard")),),
    );
  }
}