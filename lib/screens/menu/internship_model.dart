class Internship {
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
  bool? haveRemuneration;
  String? remuneration;
  int? ownerEnterprise;
  String? ownerName;

  Internship(
      {this.id,
      this.startDate,
      this.endDate,
      this.name,
      this.description,
      this.typeOfWorkDay,
      this.requirements,
      this.challenges,
      this.profile,
      this.durationMonths,
      this.haveRemuneration,
      this.remuneration,
      this.ownerEnterprise,
      this.ownerName});
}
