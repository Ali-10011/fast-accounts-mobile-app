import 'package:fast_accounts/services/generate_token.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String? token;

  //Loading Dialog
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:const [
         CircularProgressIndicator(),
             Text("Processing...."),
        ],
      ),
    );  
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

//Function to get Token and Handle Response
  void _generateToken() async {
    try {
      token = await getToken();
      if (!mounted) return;
    } on Exception catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ));
      return;
    }
    if (!mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        "Token Generated",
        style: TextStyle(color: Colors.white),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showLoaderDialog(context);
          _generateToken();
        },
        icon: const Icon(Icons.token_outlined),
        label: const Text('Get Token'),
      ),
    );
  }
}
