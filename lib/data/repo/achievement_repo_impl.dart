import 'package:vq/data/datasource/achievement_local_ds.dart';
import 'package:vq/data/datasource/achievement_remote_ds.dart';
import 'package:vq/data/model/achievement_model.dart';
import 'package:vq/domain/entity/achievement_entity.dart';

class AchievementRepositoryImpl {
  final _remote = AchievementRemoteDS();
  final _local = AchievementLocalDS();

  Future<List<AchievementEntity>> getAchievements() async {
    final cached = _local.getCached();
    if (cached.isNotEmpty) {
      return cached.map((e) => e.toEntity()).toList();
    }

    final remote = await _remote.fetchAchievements();
    await _local.cacheAll(remote);
    return remote.map((e) => e.toEntity()).toList();
  }

  Future<void> save(AchievementEntity entity) async {
    await _local.update(AchievementModel.fromEntity(entity));
  }
}
