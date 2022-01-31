class Review{
  int? owner;
  String? reviewerName;
  int? reviewer;
  int? rating;
  String? description;

  Review({
    this.reviewerName,
    this.owner,
    this.reviewer,
    this.description,
    this.rating
  });

  @override
  String toString() {
    return '$owner $reviewerName $reviewer $description $rating';
  }

}