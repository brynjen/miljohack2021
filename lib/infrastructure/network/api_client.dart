import 'dart:developer';

import 'package:http/http.dart' as http;

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
}
