import 'package:fast_accounts/views/Sales/Customers/customers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void navigateToDashboard() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Customers(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    navigateToDashboard();
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'FAST ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: ((MediaQuery.of(context).size.width *
                                          0.070) >
                                      50)
                                  ? 50
                                  : MediaQuery.of(context).size.width * 0.070)),
                      TextSpan(
                          text: 'ACCOUNTS',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: ((MediaQuery.of(context).size.width *
                                          0.070) >
                                      50)
                                  ? 50
                                  : MediaQuery.of(context).size.width * 0.070)),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                const SpinKitThreeBounce(
                  color: Colors.blue,
                  size: 30.0,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
