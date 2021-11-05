import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:miljohack/domain/environment_details/area_score.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';

class ApiClient {
  final String host = '167.99.212.65';

  Future<bool> sendToken({required String token}) async {
    try {
      final uri = Uri.http(
          host, 'register-device', {'device_token': Uri.encodeFull(token)});
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Failed to push: $e');
      return false;
    }
  }

  Future<List<MailPackage>> loadPackages() async {
    final mailPackages = <MailPackage>[];
    final response = await http.get(Uri.http(
        host, 'packages', {'Content-Type': 'text/html; charset=utf-8'}));
    final output = jsonDecode(response.body);
    for (final package in (output as List<dynamic>)) {
      mailPackages.add(MailPackage.fromJson(package));
    }
    return mailPackages;
  }

  Future<void> optimizePackage({required int packageId}) async {
    final uri =
        Uri.http(host, 'optimize-package', {'package_id': '$packageId'});
    await http.get(uri);
  }

  Future<List<AreaScore>> leaderboard() async {
    final uri = Uri.http(host, 'leaderboard', {});
    final response = await http.get(uri);
    final areaScores = <AreaScore>[];
    final output = jsonDecode(response.body);
    final places = output as List<dynamic>;
    for (int i = 0; i < places.length; i++) {
      areaScores.add(AreaScore.fromJson(
          json: places[i], placement: i + 1, marked: i == 2));
    }
    return areaScores;
  }

  Future<void> unOptimizePackage({required int packageId}) async {
    final uri =
        Uri.http(host, 'unoptimize-package', {'package_id': '$packageId'});
    await http.get(uri);
  }
}
