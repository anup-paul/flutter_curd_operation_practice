import 'dart:convert';

import 'package:curd_testing/models/user.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final baseUrl = 'http://10.0.2.2:3000/';

  Future<AriticalFetch> getData() async {
    String url = baseUrl + 'article';
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    AriticalFetch data = AriticalFetch.fromJson(jsonDecode(response.body));
    return data;
  }

  Future postData({data}) async {
    String url = baseUrl + 'articles';
    print(url);
    http.Response response = await http.post(Uri.parse(url), body: data);
    print(response.body);
  }

  Future deleteData({id}) async {
    String url = baseUrl + 'article/' + id;
    print(url);
    http.Response response = await http.delete(Uri.parse(url));
    print(response.body);
  }
}
