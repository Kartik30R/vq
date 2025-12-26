

import 'package:vq/domain/entity/achievement_entity.dart';

abstract class AchievementRepository {
  Future<List<AchievementEntity>> getAchievements();
  Future<void> saveAchievements(List<AchievementEntity> data);
}
