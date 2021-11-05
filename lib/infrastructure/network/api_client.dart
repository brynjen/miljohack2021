import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:miljohack/domain/main/data/mail_package.dart';

class ApiClient {
  final String host = '167.99.212.65';

  Future<bool> sendToken({required String token}) async {
    try {
      final uri = Uri.http(
          host, 'notification', {'device_token': Uri.encodeFull(token)});
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
    try {
      for (final package in (output as List<dynamic>)) {
        mailPackages.add(MailPackage.fromJson(package));
      }
    } catch (e) {
      log('Failed: $e');
    }
    return mailPackages;
  }

  Future<void> optimizePackage({required int packageId}) async {
    final uri =
        Uri.http(host, 'optimize-package', {'package_id': '$packageId'});
    await http.get(uri);
    //await Future.delayed(const Duration(seconds: 4));
  }

  Future<void> unOptimizePackage({required int packageId}) async {
    final uri =
        Uri.http(host, 'unoptimize-package', {'package_id': '$packageId'});
    await http.get(uri);
    //await Future.delayed(const Duration(seconds: 4));
  }
}

// When optimizing - remember to fix bloc data
