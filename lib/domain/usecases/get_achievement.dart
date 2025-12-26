import 'package:vq/data/repo/achievement_repo_impl.dart';
import 'package:vq/domain/entity/achievement_entity.dart';

class GetAchievements {
  final AchievementRepositoryImpl repo;
  GetAchievements(this.repo);

  Future<List<AchievementEntity>> call() {
    return repo.getAchievements();
  }
}
