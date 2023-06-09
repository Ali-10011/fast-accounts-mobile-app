import 'package:fast_accounts/models/customer.dart';
import 'package:fast_accounts/services/add_customer.dart';
import 'package:fast_accounts/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fast_accounts/widgets/custom_snackbar.dart';
import 'package:fast_accounts/widgets/loading_dialog.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../secret.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  //Customer Details
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
  bool isSupplier = false;
  bool isFiler = false;

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

  //Global Form Key
  final formKey = GlobalKey<FormState>();

  //Default Date
  String selectedDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.parse(DateTime.now().toString()));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: const Text("Customers")),
          drawer: const NavigationDrawerWidget(),
          body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    //Form Pertaining Customer Details
                    _formCustomerDetails(),

                    //Tab Bar Titles
                    _tabBarPagesTitle(),

                    //Tab Bar View Pages
                    _tabBarPagesContent(context),

                    //Add New customer Button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            _addNewClick(context);
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add New"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF3C835E)))),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

//Returns Part of Form that Pertains Customer Details
  Widget _formCustomerDetails() {
    return Column(children: [
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                controller: _businessNameController,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'This Field Cannot be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  suffixText: '*',
                  suffixStyle: TextStyle(
                    color: Colors.red,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(),
                  hintText: "e.g. 1st4connect",
                  labelText: "Business Name",
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: createTextFormField(
                  textController: _titleController,
                  label: "Title",
                  hintText: "e.g. Mr."))
        ],
      ),
      Row(
        children: [
          Expanded(
              flex: 1,
              child: createTextFormField(
                  textController: _firstNameController,
                  label: "First Name",
                  hintText: "e.g. Waheed")),
          Expanded(
              flex: 1,
              child: createTextFormField(
                  textController: _lastNameController,
                  label: "Last Name",
                  hintText: "e.g. Anjum")),
        ],
      ),
      Row(
        children: [
          Expanded(
              flex: 1,
              child: createTextFormField(
                  textController: _emailController,
                  label: "Email",
                  hintText: 'e.g.info@examplemail.com')),
          Expanded(
              flex: 1,
              child: createTextFormField(
                  textController: _phoneController,
                  label: 'Phone',
                  hintText: 'e.g.042-111-008-339',
                  keyboard: TextInputType.phone)),
        ],
      ),
      Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                    controller: _accountNoController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'This Field Cannot be Empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(),
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      hintText: "e.g. 1006",
                      labelText: "Account No",
                    )),
              )),
        ],
      ),
      Row(
        children: [
          Expanded(
              flex: 1,
              child: createTextFormField(
                  textController: _websiteController,
                  label: "Website",
                  hintText: "e.g.www.example.com")),
          Expanded(
            flex: 1,
            child: createTextFormField(
                textController: _mobileController,
                label: "Mobile",
                hintText: "e.g. 923084443779",
                keyboard: TextInputType.phone,
                format: r'^\d{0,11}'),
          ),
        ],
      ),
    ]);
  }

//Returns Tab Bar Titles
  Widget _tabBarPagesTitle() {
    return Material(
      elevation: 0,
      child: SizedBox(
        height: 50,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            indicator: BoxDecoration(color: Colors.blue),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
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
    );
  }

//Returns all the Content for Tab Bar Pages
  Widget _tabBarPagesContent(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      child: Container(
        color: Colors.white,
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
                              textController: _billingAddressController,
                              label: "Billing Address",
                              hintText:
                                  "e.g.43-B Abubakar Block New Garden Town")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _cityController,
                              label: "City",
                              hintText: "e.g.Lahore")),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _provinceController,
                              label: "Province",
                              hintText: "e.g.Punjab")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _postalCodeController,
                              label: "Postal Code",
                              hintText: "e.g.54000",
                              keyboard: TextInputType.number)),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _countryController,
                              label: "Country",
                              hintText: "e.g.Pakistan")),
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
                              textController: _ntnNumberController,
                              label: "NTN Number",
                              hintText: "e.g.123456-7")),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _salesTaxController,
                              label: "Sales Tax Number",
                              hintText: "e.g.123456-7")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _cnicController,
                              label: "CNIC",
                              hintText: "e.g.12345-1234577-9",
                              keyboard: TextInputType.number)),
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
                              textController: _paymentTermDaysController,
                              label: "Payment Term Days",
                              hintText: "e.g. 18",
                              keyboard: TextInputType.number)),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _creditLimitController,
                              label: "Credit Limit",
                              hintText: "e.g. 50000",
                              keyboard: TextInputType.number)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: TextFormField(
                              onTap: () {
                                _selectDate(context);
                              },
                              focusNode: AlwaysDisabledFocusNode(),
                              controller: _openingDateController,
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
                                hintText: "YYYY-MM-DD",
                                labelText: "Opening Date",
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _openingBalanceController,
                              label: "Opening Balance",
                              hintText: "e.g.1000",
                              keyboard: TextInputType.number)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: createTextFormField(
                            textController: _discountController,
                            label: "Discount",
                            hintText: "e.g.10",
                            keyboard: TextInputType.number),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Filer: "),
                      Checkbox(
                        value: isFiler,
                        onChanged: (bool? value) {
                          setState(() {
                            isFiler = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Supplier: "),
                      Checkbox(
                        value: isSupplier,
                        onChanged: (bool? value) {
                          setState(() {
                            isSupplier = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              //Notes Page
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        expands: true,
                        controller: _notesController,
                        minLines: null,
                        maxLines: null,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          border: OutlineInputBorder(),
                          hintText: "e.g.Important Contact",
                          labelText: "Notes",
                        ),
                      ),
                    ),
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
                              textController: _field1Controller,
                              label: "Field 1",
                              hintText: "e.g. FA")),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _fieldAController,
                              label: "Field A",
                              hintText: "e.g. F A")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _field2Controller,
                              label: "Field 2",
                              hintText: "e.g. FB")),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _fieldBController,
                              label: "Field B",
                              hintText: "e.g. F B")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _field3Controller,
                              label: "Field 3",
                              hintText: "e.g. FC")),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _fieldCController,
                              label: "Field C",
                              hintText: "e.g. F C")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _field4Controller,
                              label: "Field 4",
                              hintText: "e.g. FD")),
                      Expanded(
                          flex: 1,
                          child: createTextFormField(
                              textController: _fieldDController,
                              label: "Field D",
                              hintText: "e.g. F D")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//"Add New" Button Click Event
  void _addNewClick(BuildContext context) {
    if (token == null) {
      roundSnackbar(
          buildContext: context,
          snackbarColor: Colors.red,
          snackbarMessage: "Get a Token First !",
          textColor: Colors.white);
    } else {
      if (formKey.currentState!.validate()) {
        showLoaderDialog(context);
        _addCustomer();
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }
  }

//Date Picker Utility
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate =
            DateFormat('yyyy-MM-dd').format(DateTime.parse(picked.toString()));
        _openingDateController.text = selectedDate;
        _openingDateController.selection = TextSelection.fromPosition(
            TextPosition(
                offset: _openingDateController.text.length,
                affinity: TextAffinity.upstream));
      });
    }
  }

//Method that hits the API and resolves response from it
  void _addCustomer() async {
    Customer customer = Customer(
        businessName: _businessNameController.value.text,
        title: _titleController.value.text,
        firstName: _firstNameController.value.text,
        lastName: _lastNameController.value.text,
        email: _emailController.value.text,
        phone: _phoneController.value.text,
        mobile: _phoneController.value.text,
        accountNo: (isSupplier == true)
            ? "${_accountNoController.value.text}S"
            : _accountNoController.value.text,
        website: _websiteController.value.text,
        billingAddress: _billingAddressController.value.text,
        city: _cityController.value.text,
        province: _provinceController.value.text,
        postalCode: _postalCodeController.value.text,
        country: _countryController.value.text,
        ntnNumber: _ntnNumberController.value.text,
        salesTaxNumber: _salesTaxController.value.text,
        cnic: _cnicController.value.text,
        paymentTerms: _paymentTermDaysController.value.text,
        creditLimit: _creditLimitController.value.text,
        openingDate: selectedDate,
        openingBalance: _openingBalanceController.value.text,
        discount: _discountController.value.text,
        isSupplier: (isSupplier == true) ? "yes" : "no",
        notes: _notesController.value.text,
        field1: _field1Controller.value.text,
        field2: _field2Controller.value.text,
        field3: _field3Controller.value.text,
        field4: _field4Controller.value.text,
        fieldA: _fieldAController.value.text,
        fieldB: _fieldBController.value.text,
        fieldC: _fieldCController.value.text,
        fieldD: _fieldDController.value.text);
    String message;

    try {
      message = await addCustomer(customer);
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
        snackbarMessage: message,
        textColor: Colors.white);
  }

  Widget createTextFormField(
      {required TextEditingController textController,
      String? label,
      String? hintText,
      TextInputType? keyboard,
      String? format}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: TextFormField(
        keyboardType: keyboard ?? TextInputType.text,
        inputFormatters: (format != null)
            ? [FilteringTextInputFormatter.allow(RegExp(format))]
            : null,
        controller: textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: label,
        ),
      ),
    );
  }
}

//Utility
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
