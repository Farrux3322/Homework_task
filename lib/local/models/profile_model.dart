class ProfileModel {
  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.newPassword,required this.newEmail
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String newPassword;
  final String newEmail;

  ProfileModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? newPassword,
    String? newEmail,
  }) {
    return ProfileModel(
        newPassword: newPassword ?? this.newPassword,
        newEmail: newEmail ?? this.newEmail,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password);
  }


  bool canSaveData(){
    if(email.length<7) return false;
    if(firstName.length<3) return false;
    if(lastName.length<3) return false;
    if(password.length<6) return false;
    return true;
  }

}


