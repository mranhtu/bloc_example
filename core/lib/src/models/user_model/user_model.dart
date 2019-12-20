class UserModel {
  final String token;
  final String username;
  final String id;
  final String name;
  final String role;
  final String orgId;
  final String orgName;

  UserModel({
    this.token,
    this.username,
    this.id,
    this.name,
    this.role,
    this.orgId,
    this.orgName,
  });

  factory UserModel.fromJson(dynamic json) => UserModel(
    token: json["token"] as String,
    username: json["username"] as String,
    id: json["id"] as String,
    name: json["name"] as String,
    role: json["role"] as String,
    orgId: json["orgId"] as String,
    orgName: json["orgName"] as String,
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "username": username,
    "id": id,
    "name": name,
    "role": role,
    "orgId": orgId,
    "orgName": orgName,
  };
}
