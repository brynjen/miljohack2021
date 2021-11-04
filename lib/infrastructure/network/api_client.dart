import 'dart:developer';
import 'dart:io';

class ApiClient {
  final HttpClient httpClient = HttpClient();
  final String url = 'http://127.0.0.1';

  Future<void> sendToken({required String token}) async {
    try {
      final response =
          await httpClient.getUrl(Uri.parse('$url?device_token=$token'));
      log('Sent token');
    } catch (e) {
      log('Failed to push: $e');
    }
  }
}
