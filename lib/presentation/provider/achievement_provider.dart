import 'package:flutter/material.dart';
import 'package:vq/data/repo/achievement_repo_impl.dart';
import 'package:vq/domain/entity/achievement_entity.dart';
import 'package:vq/domain/usecases/get_achievement.dart';

class AchievementProvider extends ChangeNotifier {
  final repo = AchievementRepositoryImpl();
  late final getAchievements = GetAchievements(repo);

  List<AchievementEntity> achievements = [];

  Future<void> load() async {
    achievements = await getAchievements();
    _sort();
    notifyListeners();
  }

  void toggleFavorite(AchievementEntity item) {
    item.isFavorite = !item.isFavorite;
    repo.save(item);
    _sort();
    notifyListeners();
  }

  void markViewed(AchievementEntity item) {
    item.isNew = false;
    repo.save(item);
    notifyListeners();
  }

  void _sort() {
    achievements.sort((a, b) {
      if (a.isFavorite && !b.isFavorite) return -1;
      if (!a.isFavorite && b.isFavorite) return 1;
      return 0;
    });
  }
}
