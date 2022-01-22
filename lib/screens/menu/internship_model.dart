class Internship{
  int? id;
  String? startDate;
  String? endDate;
  String? name;
  String? description;
  String? typeOfWorkDay;
  List<String>? requirements;
  List<String>? challenges;
  String? profile;
  int? durationMonths;
  String? remuneration;
  int? ownerEnterprise;
  String? ownerName;

  Internship({
    this.id,
    this.startDate,
    this.endDate,
    this.name,
    this.description,
    this.typeOfWorkDay,
    this.requirements,
    this.challenges,
    this.profile,
    this.durationMonths,
    this.remuneration,
    this.ownerEnterprise
  });

  void setOwnerName(){
    ownerName = 'Netflix';
  }

}