import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vq/core/constants/api_constants.dart';
import 'package:vq/data/model/achievement_model.dart';

class AchievementRemoteDS {
  Future<List<AchievementModel>> fetchAchievements() async {
    final res = await http.get(
      Uri.parse(AppConstant.baseurl),
      headers: {'Content-Type': 'application/json'},
    );

    final List data = jsonDecode(res.body);
    return data.map((e) => AchievementModel.fromJson(e)).toList();
  }
}
