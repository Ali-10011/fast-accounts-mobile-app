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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        drawer: Drawer(
          child: ListView(children: [
            const ListTile(
              title: Text('FAST ACCOUNTS'),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            ExpansionTile(
              title: const Text("Bank"),
              leading: const Icon(Icons.account_balance), //add icon
              childrenPadding:
                  const EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: const Text("Account Balances"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  title: const Text("Bank Payments"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Bank Receipts"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Transfers"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Reconcile"),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
            ExpansionTile(
              title: const Text("Sales"),
              leading: const Icon(Icons.attach_money), //add icon
              childrenPadding:
                  const EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: const Text("Invoices"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  title: const Text("Receipts"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Sales All"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Transfers"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Orders"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Customers"),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
            ExpansionTile(
              title: const Text("Purchases"),
              leading: const Icon(Icons.money_outlined), //add icon
              childrenPadding:
                  const EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: const Text("Bills"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  title: const Text("Payments"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Purchases All"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("PO"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  title: const Text("Suppliers"),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
            ExpansionTile(
              title: const Text("Inventory"),
              leading: const Icon(Icons.inventory_outlined), //add icon
              childrenPadding:
                  const EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: const Text("Products"),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart),
              title: const Text('Projects'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Reports'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Analytical Reports'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.token_outlined),
              title: const Text('Generate Token'),
              onTap: () {},
            ),
          ]),
        ),
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
