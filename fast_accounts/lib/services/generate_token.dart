import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fast_accounts/secret.dart';
import 'dart:convert';

//Function to get a token
Future<String> getToken() async {
  var body =
      jsonEncode({"SecretKey": secretKey, "SecretPassword": secretPassword});
  try {
    var response = await http.post(Uri.parse("$apiUrl/authorize/token"),
        headers: {"Content-Type": "application/json"}, body: body);
    var jsonMap = json.decode(response.body);
    if (jsonMap['Code'] != "200") {
      throw HttpException(jsonMap['Message']);
    } else {
      return jsonMap['Token'];
    }
  } on SocketException {
    throw const SocketException("No Internet connection ");
  } on FormatException {
    throw const FormatException("Bad response format ");
  }
}
