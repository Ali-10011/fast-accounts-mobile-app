import 'package:fast_accounts/views/Sales/customers.dart';
import 'package:fast_accounts/views/dashboard.dart';
import 'package:fast_accounts/views/generate_token.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

//function to generate Navigation Drawer Tiles
  Widget drawerTile(
      {required String title,
      required int index,
      required BuildContext context,
      IconData? icon}) {
    return ListTile(
        title: Text(title),
        onTap: () => selectedItem(context, index),
        leading: (icon == null) ? null : Icon(icon));
  }

//function to Navigat based on choice
  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const DashBoard(),
        ));
        break;
      case 11:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Customers(),
        ));
        break;
      case 20:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const GenerateToken(),
        ));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
          child: ListTile(
            title: Center(
                child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'FAST ',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.050)),
                  TextSpan(
                      text: 'ACCOUNTS',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: MediaQuery.of(context).size.width * 0.050)),
                ],
              ),
            )),
          ),
        ),
        drawerTile(
            title: "Dashboard",
            index: 0,
            context: context,
            icon: Icons.dashboard),
        ExpansionTile(
          title: const Text("Bank"),
          leading: const Icon(Icons.account_balance), //add icon
          childrenPadding: const EdgeInsets.only(left: 60), //children padding
          children: [
            drawerTile(title: "Account Balances", index: 1, context: context),
            drawerTile(title: "Bank Payments", index: 2, context: context),
            drawerTile(title: "Bank Receipts", index: 3, context: context),
            drawerTile(title: "Transfers", index: 4, context: context),
            drawerTile(title: "Reconcile", index: 5, context: context),
          ],
        ),
        ExpansionTile(
          title: const Text("Sales"),
          leading: const Icon(Icons.attach_money), //add icon
          childrenPadding: const EdgeInsets.only(left: 60), //children padding
          children: [
            drawerTile(title: "Invoices", index: 6, context: context),
            drawerTile(title: "Recepits", index: 7, context: context),
            drawerTile(title: "Sales All", index: 8, context: context),
            drawerTile(title: "Transfers", index: 9, context: context),
            drawerTile(title: "Orders", index: 10, context: context),
            drawerTile(title: "Customers", index: 11, context: context),
          ],
        ),
        ExpansionTile(
          title: const Text("Purchases"),
          leading: const Icon(Icons.money_outlined), //add icon
          childrenPadding: const EdgeInsets.only(left: 60), //children padding
          children: [
            drawerTile(title: "Bills", index: 12, context: context),
            drawerTile(title: "Payments", index: 13, context: context),
            drawerTile(title: "Purchase All", index: 14, context: context),
            drawerTile(title: "PO", index: 15, context: context),
            drawerTile(title: "Suppliers", index: 16, context: context),
          ],
        ),
        ExpansionTile(
          title: const Text("Inventory"),
          leading: const Icon(Icons.inventory_outlined), //add icon
          childrenPadding: const EdgeInsets.only(left: 60), //children padding
          children: [
            drawerTile(title: "Products", index: 17, context: context),
          ],
        ),
        drawerTile(
            title: "Projects",
            index: 18,
            context: context,
            icon: Icons.pie_chart),
        drawerTile(
            title: "Reports", index: 19, context: context, icon: Icons.report),
        drawerTile(
            title: "Analytical Reports",
            index: 1,
            context: context,
            icon: Icons.analytics),
        drawerTile(
            title: "Generate Token",
            index: 20,
            context: context,
            icon: Icons.token_outlined),
      ]),
    );
  }
}
