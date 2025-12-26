class AchievementEntity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  bool isFavorite;
  bool isNew;

  AchievementEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    this.isNew = true,
  });
}
