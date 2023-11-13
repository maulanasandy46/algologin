import 'dart:developer';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "https://reqres.in/";

  // _setHeaders() => {
  //     'Content-type': 'application/x-www-form-urlencoded;charset=UTF-8',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //     // 'Charset': 'utf-8',
  //     "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  //     // "Access-Control-Allow-Credentials":
  //     //     true, // Required for cookies, authorization headers with HTTPS
  //     "Access-Control-Allow-Headers":
  //         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  //     // "Access-Control-Allow-Methods": "POST, OPTIONS"
  //   };

  postData(apiUrl, data) async {
    final fullUrl = _url + apiUrl;
    log("Call $fullUrl");
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  getData(apiUrl) async {
    final fullUrl = _url + apiUrl;
    log("Call $fullUrl");
    return await http.post(Uri.parse(fullUrl));
  }
}
