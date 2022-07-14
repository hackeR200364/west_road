class UserLogin {
  String? userName;
  String? PIN;

  UserLogin({
    required this.userName,
    required this.PIN,
  });
}

class APIModel {
  String? status;
  String? token;
  String? customerId;
  var customer;

  APIModel({
    required this.status,
    required this.customer,
    required this.customerId,
    required this.token,
  });
}
