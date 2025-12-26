import 'package:hive/hive.dart';
 import 'package:vq/core/hive/hive_box.dart';
import 'package:vq/data/model/achievement_model.dart';

class AchievementLocalDS {
  final Box<AchievementModel> box =
     HiveBoxes.achievements;

  List<AchievementModel> getCached() => box.values.toList();

  Future<void> cacheAll(List<AchievementModel> list) async {
    for (final item in list) {
      await box.put(item.id, item);
    }
  }

  Future<void> update(AchievementModel model) async {
    await box.put(model.id, model);
  }
}
