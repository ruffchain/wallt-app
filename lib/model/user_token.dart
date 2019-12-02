class UserToken {
  String name;
  String type;
  String amount;

  UserToken({
    this.name,
    this.type,
    this.amount,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      name: json['token'],
      type: json['tokentype'],
      amount: json['amount'],
    );
  }
}
