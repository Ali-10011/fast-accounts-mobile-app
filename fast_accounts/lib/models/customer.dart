
import 'package:fast_accounts/secret.dart';

class Customers{
   String bussinessName;
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
   
  Customers({required this.bussinessName});
   Map<dynamic, dynamic> toJson() => {
    "ApiToken": token,
    "BusinessName": bussinessName,
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
    "SalesTaxNumber":salesTaxNumber,
    "PaymentTerms":paymentTerms,
    "CreditLimit": creditLimit,
    "Notes":notes,
    "OpeningDate": openingDate,
    "OpeningBalance": openingBalance,
    "Field1": field1,
    "Field2" :field2,
    "Field3":field3,
    "Field4": field4,
    "FieldA": fieldA,
    "FieldB": fieldB,
    "FieldC": fieldC,
    "FieldD": fieldD,
    "IsSupplier": isSupplier,
    "Group": group,
    "Discount": discount,
    "CurrencyCode": currencyCode,
    "ExchangeRate": exchangeRate
    
   };

}