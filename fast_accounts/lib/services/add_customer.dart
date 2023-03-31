import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fast_accounts/secret.dart';
import 'package:fast_accounts/models/customer.dart';

Future<String> addCustomer(Customer customer) async {


  try {
      var body = json.encode(customer.toJson());
  var response = await http.post(Uri.parse("$apiUrl/customer/add"),
      headers: {"Content-Type": "application/json"}, body: body);
    var jsonMap = json.decode(response.body);
    if (jsonMap['Code'] != "200") {
      throw HttpException(jsonMap['Message']);
    } 
    else
    {
    return(jsonMap['Message']);
    }
  } on SocketException {
    throw const SocketException("No Internet connection ");
  } on FormatException {
    throw const FormatException("Bad response format ");
  }

}
