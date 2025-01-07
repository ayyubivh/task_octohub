class RegistrationRequest {
  final String userName;
  final String emailId;
  final String password;
  final String mobile;
  final Company company;
  final Address address;

  RegistrationRequest({
    required this.userName,
    required this.emailId,
    required this.password,
    required this.mobile,
    required this.company,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        'AdminRegister': {
          'UserName': userName,
          'EmailID': emailId,
          'Password': password,
          'MobileNo': mobile,
          'TwoFactorEnabled': true,
        },
        'Company': [company.toJson()],
        'Addresses': [address.toJson()],
      };
}

class Company {
  final String companyName;
  final String companyCountry;
  final String companyTaxNo;

  Company({
    required this.companyName,
    required this.companyCountry,
    required this.companyTaxNo,
  });

  Map<String, dynamic> toJson() => {
        'Date': DateTime.now().toIso8601String(),
        'MasterID': '',
        'UserName': '',
        'CompanyName': companyName,
        'CompanyCountry': companyCountry,
        'CompanyTaxNo': companyTaxNo,
        'CompanyKey': null,
        'CompanyTaxDoc': '',
        'CompanyTransactionVoucherPrefix': 'TCF',
        'DatabaseCreate': true,
      };
}

class Address {
  final String address1;
  final String country;
  final String state;
  final String city;
  final String zipCode;
  final double latitude;
  final double longitude;

  Address({
    required this.address1,
    required this.country,
    required this.state,
    required this.city,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        'AddressID': 0,
        'AddressLabel': '',
        'AddressName': '',
        'Address1': address1,
        'Address2': '',
        'landmark': '',
        'Country': country,
        'State': state,
        'City': city,
        'District': '',
        'Mandal': '',
        'ZipCode': zipCode,
        'Latitude': latitude,
        'Longitude': longitude,
      };
}
