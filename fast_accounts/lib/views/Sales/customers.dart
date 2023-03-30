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

//Tax Info
  final TextEditingController _ntnNumberController = TextEditingController();
  final TextEditingController _salesTaxController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();

  //Terms
  final TextEditingController _paymentTermDaysController =
      TextEditingController();
  final TextEditingController _creditLimitController = TextEditingController();
  final TextEditingController _openingDateController = TextEditingController();
  final TextEditingController _openingBalanceController =
      TextEditingController();
  final TextEditingController _discountController = TextEditingController();

  //Notes
  final TextEditingController _notesController = TextEditingController();

  //Additional Fields
  final TextEditingController _fieldAController = TextEditingController();
  final TextEditingController _fieldBController = TextEditingController();
  final TextEditingController _fieldCController = TextEditingController();
  final TextEditingController _fieldDController = TextEditingController();
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();
  final TextEditingController _field4Controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Widget createTextFormField(
      TextEditingController textController, String? label, String? hintText) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(title: const Text("Customers")),
        drawer: const NavigationDrawerWidget(),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
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
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'This Field Cannot be Empty';
                            }
                            return null;
                          },
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
                          child: createTextFormField(
                              _titleController, "Title", "Title"))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(_firstNameController,
                              "First Name", "First Name")),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              _lastNameController, "Last Name", "Last Name")),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              _emailController, "Email", "Email")),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              _phoneController, 'Phone', 'Phone')),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: createTextFormField(
                          _accountNoController, "Account No", "Account No")),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              _websiteController, "Website", "Website")),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              _mobileController, "Mobile", "Mobile")),
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
                  Material(
                    elevation: 5,
                    child: SizedBox(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBarView(
                          children: [
                            //Address Info Page
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _billingAddressController,
                                            "Billing Address",
                                            "Billing Address")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _cityController, "City", "City")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _provinceController,
                                            "Province",
                                            "Province")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _postalCodeController,
                                            "Postal Code",
                                            "Postal Code")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _countryController,
                                            "Country",
                                            "Country")),
                                  ],
                                ),
                              ],
                            ),
                            //Tax Info Page
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _ntnNumberController,
                                            "NTN Number",
                                            "NTN Number")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _salesTaxController,
                                            "Sales Tax Number",
                                            "Sales Tax Number")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _cnicController, "CNIC", "CNIC")),
                                  ],
                                ),
                              ],
                            ),
                            //Terms Page
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _paymentTermDaysController,
                                            "Payment Term Days",
                                            "0")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _creditLimitController,
                                            "Credit Limit",
                                            "0.00")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _openingDateController,
                                            "Opening Date",
                                            "27/03/2023")),
                                  ],
                                ),
                              ],
                            ),
                            //Notes Page
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _notesController,
                                           
                                            minLines: 5,
                                            maxLines: 7,
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              border: OutlineInputBorder(),
                                              hintText: "Notes",
                                              labelText: "Notes",
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            //Additional Fields Page
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _field1Controller,
                                            "Field 1",
                                            "Field 1")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _fieldAController,
                                            "Field A",
                                            "Field A")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _field2Controller,
                                            "Field 2",
                                            "Field 2")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _fieldBController,
                                            "Field B",
                                            "Field B")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _field3Controller,
                                            "Field 3",
                                            "Field 3")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _fieldCController,
                                            "Field C",
                                            "Field C")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _field4Controller,
                                            "Field 4",
                                            "Field 4")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: createTextFormField(
                                            _fieldDController,
                                            "Field D",
                                            "Field D")),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
