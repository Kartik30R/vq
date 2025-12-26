import 'package:hive/hive.dart';
import 'package:vq/domain/entity/achievement_entity.dart';

part 'achievement_model.g.dart';

@HiveType(typeId: 0)
class AchievementModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String imageUrl;

  @HiveField(4)
  bool isFavorite;

  @HiveField(5)
  bool isNew;

  AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    this.isNew = true,
  });

 factory AchievementModel.fromJson(Map<String, dynamic> json) {
  return AchievementModel(
    id: json['id']?.toString() ?? '',
    title: json['title_key']?.toString() ?? '',           
    description: json['description_key']?.toString() ?? '', 
    imageUrl: json['image_key']?.toString() ?? '',       
  );
}


  AchievementEntity toEntity() => AchievementEntity(
        id: id,
        title: title,
        description: description,
        imageUrl: imageUrl,
        isFavorite: isFavorite,
        isNew: isNew,
      );

  static AchievementModel fromEntity(AchievementEntity e) {
    return AchievementModel(
      id: e.id,
      title: e.title,
      description: e.description,
      imageUrl: e.imageUrl,
      isFavorite: e.isFavorite,
      isNew: e.isNew,
    );
  }
}
