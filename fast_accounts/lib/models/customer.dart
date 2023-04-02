import 'package:fast_accounts/secret.dart';

class Customer {
  String businessName;
  String? title;
  String? firstName;
  String? lastName;
  String? accountNo;
  String? email;
  String? smsMobile;
  String? mobile;
  String? phone;
  String? website;
  String? billingAddress;
  String? city;
  String? province;
  String? postalCode;
  String? country;
  String? ntnNumber;
  String? cnic;
  String? salesTaxNumber;
  String? paymentTerms;
  String? creditLimit;
  String? notes;
  String? openingDate;
  String? openingBalance;
  String? field1;
  String? field2;
  String? field3;
  String? field4;
  String? fieldA;
  String? fieldB;
  String? fieldC;
  String? fieldD;
  String? isSupplier;
  String? group;
  String? discount;
  String? currencyCode;
  String? exchangeRate;

  Customer(
      {required this.businessName,
      this.title,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.phone,
      required this.accountNo,
      this.website,
      this.billingAddress,
      this.city,
      this.province,
      this.postalCode,
      this.country,
      this.ntnNumber,
      this.salesTaxNumber,
      this.cnic,
      this.paymentTerms,
      this.creditLimit,
      this.openingDate,
      this.openingBalance,
      this.discount,
      this.isSupplier,
      this.notes,
      this.field1,
      this.field2,
      this.field3,
      this.field4,
      this.fieldA,
      this.fieldB,
      this.fieldC,
      this.fieldD});
  Map<dynamic, dynamic> toJson() => {
        "ApiToken": token,
        "BusinessName": businessName,
        "Title": title,
        "FirstName": firstName,
        "LastName": lastName,
        "AccountNo": accountNo,
        "Email": email,
        "SMSMobile": smsMobile,
        "Mobile": mobile,
        "Phone": phone,
        "Website": website,
        "BillingAddress": billingAddress,
        "City": city,
        "Province": province,
        "PostalCode": postalCode,
        "Country": country,
        "NTNNumber": ntnNumber,
        "CNIC": cnic,
        "SalesTaxNumber": salesTaxNumber,
        "PaymentTerms": paymentTerms,
        "CreditLimit": creditLimit,
        "Notes": notes,
        "OpeningDate": openingDate,
        "OpeningBalance": openingBalance,
        "Field1": field1,
        "Field2": field2,
        "Field3": field3,
        "Field4": field4,
        "FieldA": fieldA,
        "FieldB": fieldB,
        "FieldC": fieldC,
        "FieldD": fieldD,
        "IsSupplier": isSupplier,
        "Discount": discount,
        "Group": "G1",
        "CurrencyCode": "PKR",
        "ExchangeRate": "1"
      };
}
