class User{
  int? id;
  String? cardId;
  String? city;
  String? bornDate;
  String? address;
  String? cellphone;
  String? bio;
  String? institution;
  String? studyField;
  List<dynamic>? certifications;
  List<dynamic>? languages;
  List<dynamic>? references;
  List<dynamic>? friends;
  int? user;
  String? firstName;
  String? lastName;
  String? email;
  String? username;

  User({
    this.id,
    this.address,
    this.bio,
    this.bornDate,
    this.cardId,
    this.cellphone,
    this.certifications,
    this.city,
    this.email,
    this.firstName,
    this.friends,
    this.institution,
    this.languages,
    this.lastName,
    this.references,
    this.studyField,
    this.user,
    this.username,
  });

  @override
  String toString() {
    return '$id $address $bio $bornDate $cardId $cellphone $certifications $city $email $firstName $friends $institution $languages $lastName $references $studyField $user $username';
  }

}