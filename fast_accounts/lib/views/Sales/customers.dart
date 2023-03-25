// ignore_for_file: avoid_unnecessary_containers

import 'package:fast_accounts/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  //Billing Address
  final TextEditingController _billingAddressController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(title: const Text("Customers")),
        drawer: const NavigationDrawerWidget(),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _businessNameController,
                          // initialValue: widget.contactModel.name,

                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                            hintText: "Business Name",
                            labelText: "Business Name",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _titleController,
                          // initialValue: widget.contactModel.name,

                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                            hintText: "Title",
                            labelText: "Title",
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _firstNameController,
                          // initialValue: widget.contactModel.name,

                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                            hintText: "First Name",
                            labelText: "First Name",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _lastNameController,
                          // initialValue: widget.contactModel.name,

                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                            hintText: "Last Name",
                            labelText: "Last Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _emailController,
                          // initialValue: widget.contactModel.name,

                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                            hintText: "Email",
                            labelText: "Email",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _phoneController,
                          // initialValue: widget.contactModel.name,

                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                            hintText: "Phone",
                            labelText: "Phone",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _accountNoController,
                      // initialValue: widget.contactModel.name,

                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: OutlineInputBorder(),
                        hintText: "Account No",
                        labelText: "Account No",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _websiteController,
                          // initialValue: widget.contactModel.name,

                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                            hintText: "Website",
                            labelText: "Website",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _mobileController,
                          // initialValue: widget.contactModel.name,

                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                            hintText: "Mobile",
                            labelText: "Mobile",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    child: AppBar(
                      backgroundColor: Colors.white,
                      bottom: const TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.blue,
                        isScrollable: true,
                        tabs: [
                          Tab(
                            text: "Address Info",
                          ),
                          Tab(
                            text: "Tax Info",
                          ),
                          Tab(
                            text: "Terms",
                          ),
                          Tab(
                            text: "Notes",
                          ),
                          Tab(
                            text: "Additional Fields",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: _billingAddressController,
                                    // initialValue: widget.contactModel.name,

                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      border: OutlineInputBorder(),
                                      hintText: "Billing Address",
                                      labelText: "Billing Address",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: _cityController,
                                    // initialValue: widget.contactModel.name,

                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      border: OutlineInputBorder(),
                                      hintText: "City",
                                      labelText: "City",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: _provinceController,
                                    // initialValue: widget.contactModel.name,

                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      border: OutlineInputBorder(),
                                      hintText: "Province",
                                      labelText: "Province",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: _postalCodeController,
                                    // initialValue: widget.contactModel.name,

                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      border: OutlineInputBorder(),
                                      hintText: "Postal Code",
                                      labelText: "Postal Code",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: _countryController,
                                    // initialValue: widget.contactModel.name,

                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      border: OutlineInputBorder(),
                                      hintText: "Country",
                                      labelText: "Country",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // second tab bar viiew widget
                        Container(
                         
                          child: const Center(
                            child: Text(
                              'Tax Info',
                            ),
                          ),
                        ),
                        Container(
                          
                          child: const Center(
                            child: Text(
                              'Terms',
                            ),
                          ),
                        ),
                        Container(
                        
                          child: const Center(
                            child: Text(
                              'Notes',
                            ),
                          ),
                        ),
                        Container(
                        
                          child: const Center(
                            child: Text(
                              'Additional Fields',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
