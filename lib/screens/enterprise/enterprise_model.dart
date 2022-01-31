class EnterpriseM{
  int? id;
  String? name;
  String? cellphone;
  String? description;
  String? website;
  int? contactId;
  String? email;
  double? latitude;
  double? longitude;

  EnterpriseM({
    this.id,
    this.email,
    this.cellphone,
    this.contactId,
    this.name,
    this.longitude,
    this.latitude,
    this.description,
    this.website
  });

  @override
  String toString() {
    return '$id $cellphone $email $website $latitude $longitude $name $description $contactId';
  }

}