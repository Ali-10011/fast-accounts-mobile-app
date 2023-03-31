import 'package:fast_accounts/services/generate_token.dart';
import 'package:fast_accounts/widgets/custom_snackbar.dart';
import 'package:fast_accounts/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fast_accounts/widgets/navigation_drawer.dart';
import 'package:fast_accounts/secret.dart';

class GenerateToken extends StatefulWidget {
  const GenerateToken({super.key});

  @override
  State<GenerateToken> createState() => _GenerateTokenState();
}

class _GenerateTokenState extends State<GenerateToken> {

//Function to get Token and Handle Response
  void _generateToken() async {
    try {
      token = await getToken();
      if (!mounted) return;
    } on Exception catch (e) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      roundSnackbar(
          buildContext: context,
          snackbarColor: Colors.red,
          snackbarMessage: e.toString(),
          textColor: Colors.white);

      return;
    }
    if (!mounted) return;
    Navigator.of(context, rootNavigator: true).pop('dialog');
    roundSnackbar(
        buildContext: context,
        snackbarColor: Colors.green,
        snackbarMessage: "Token Generated",
        textColor: Colors.white);
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
