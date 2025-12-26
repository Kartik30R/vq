import 'package:hive/hive.dart';
import 'package:vq/core/constants/api_constants.dart';
import 'package:vq/data/model/achievement_model.dart';

class HiveBoxes {
  HiveBoxes._();


  static Box<AchievementModel> get achievements =>
      Hive.box<AchievementModel>(AppConstant.achievementBox);
}
