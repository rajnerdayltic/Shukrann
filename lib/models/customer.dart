class CustomerModel {
  CustomerModel(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.password});
  String email;
  String firstName;
  String lastName;
  String password;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'username': email,
    });

    return map;
  }
}

// class Coupon {
//   String email;
//   bool enabled;
//   String description, code;

//   Coupon();

//   Coupon.fromJSON(Map jsonMap) {
//     email = jsonMap['email'].toString();
//     description = jsonMap['description'];
//     code = jsonMap['code'];
//   }
// }
