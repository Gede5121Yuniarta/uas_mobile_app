// class UserDTO {
//   final int? id;
//   final String? name;
//   final String? email;
//   final int? type;
//   final String? token;
//   final String? createdAt;
//   final String? updatedAt;

//   UserDTO({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.type,
//     required this.token,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory UserDTO.fromJson(Map<String, dynamic> json) {
//     return UserDTO(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       type: json['type'],
//       token: json['token'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }

class UserDTO {
  int? id;
  String? name;
  String? email;
  String? googleId;
  String? type;
  DateTime? emailVerifiedAt;
  String? password;
  // String? apiToken;
  String? token;
  DateTime? rentalDeadline;
  String? brandName;
  String? rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDTO({
    this.id,
    this.name,
    this.email,
    this.googleId,
    this.type,
    this.emailVerifiedAt,
    this.password,
    // this.apiToken,
    this.token,
    this.rentalDeadline,
    this.brandName,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      googleId: json['google_id'],
      type: json['type'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      password: json['password'],
      // apiToken: json['api_token'],
      token: json['token'],
      rentalDeadline: json['rental_deadline'] != null
          ? DateTime.parse(json['rental_deadline'])
          : null,
      brandName: json['brand_name'],
      rememberToken: json['remember_token'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'google_id': googleId,
      'type': type,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'password': password,
      // 'api_token': apiToken,
      'token': token,
      'rental_deadline': rentalDeadline?.toIso8601String(),
      'brand_name': brandName,
      'remember_token': rememberToken,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}