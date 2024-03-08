import 'dart:io';

import 'package:http/http.dart' as http;

class Server {
  multipartRequest(endPoint, String? filepath) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    HttpClient client = HttpClient();
    try {
      var request;
      request = http.MultipartRequest('POST', Uri.parse(endPoint!))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('image_file', filepath!));
      return await request.send();
    } catch (error) {
      print(error);
      return null;
    } finally {
      client.close();
    }
  }
}
