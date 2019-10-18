class UserToken {
  String name;
  String type;
  double amount;
  double value;

  UserToken({this.name, this.type, this.amount, this.value});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      name: json['token'],
      type: json['tokentype'],
      // amount: json['amount'],
      value: json['value'].toDouble(),
    );
  }
}
