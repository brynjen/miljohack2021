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
      log('Sent token:${response.statusCode} - ${response.body}');
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
    await Future.delayed(const Duration(seconds: 3));
    return [
      MailPackage(
          id: 'test1',
          shopName: 'Multicom AS',
          delivery: 'Frakt er bestilt - 4. november',
          time: '13:44'),
      MailPackage(
          id: 'test2',
          shopName: 'Zalando AS',
          delivery: 'Pakken er på vei - 3. november',
          time: '18:55'),
      MailPackage(
          id: 'test3',
          shopName: 'Komplett ASA',
          delivery: 'Pakken er på vei - 3. november',
          time: '11:05'),
    ];
  }
}
