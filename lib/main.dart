import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vq/core/constants/api_constants.dart';
import 'package:vq/data/model/achievement_model.dart';
import 'package:vq/presentation/provider/achievement_provider.dart';
 import 'package:vq/presentation/view/achievement_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AchievementModelAdapter());
  await Hive.openBox<AchievementModel>(AppConstant.achievementBox);
 
  runApp(
    ChangeNotifierProvider(
      create: (_) => AchievementProvider()..load(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AchievementScreen(),
      ),
    ),
  );
}
