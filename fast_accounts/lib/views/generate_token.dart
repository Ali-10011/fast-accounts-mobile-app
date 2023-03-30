import 'package:fast_accounts/services/generate_token.dart';
import 'package:flutter/material.dart';
import 'package:fast_accounts/widgets/navigation_drawer.dart';
import 'package:fast_accounts/secret.dart';

class GenerateToken extends StatefulWidget {
  const GenerateToken({super.key});

  @override
  State<GenerateToken> createState() => _GenerateTokenState();
}

class _GenerateTokenState extends State<GenerateToken> {
  

  //Loading Dialog
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
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
      Navigator.of(context, rootNavigator: true).pop('dialog');
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
    Navigator.of(context, rootNavigator: true).pop('dialog');
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Generate Token")),
        drawer: const NavigationDrawerWidget(),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                showLoaderDialog(context);
                _generateToken();
              },
              child: const Text('Get Token')),
        ),
      ),
    );
  }
}
