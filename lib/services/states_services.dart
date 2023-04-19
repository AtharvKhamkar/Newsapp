import 'dart:convert';

import 'package:newsapp/models/businessModel.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/entertainmentModel.dart';
import 'package:newsapp/models/generalModel.dart';
import 'package:newsapp/services/api_uri.dart';

class StatesServices {
  Future<businessModel> fetchBusinessNews() async {
    final response = await http.get(Uri.parse(AppUrl.business));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return businessModel.fromJson(data);
    } else {
      throw Exception("Eroor");
    }
  }

  Future<entertainmentModel> fetchEntertainmentNews() async {
    final response = await http.get(Uri.parse(AppUrl.entertainment));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return entertainmentModel.fromJson(data);
    } else {
      throw Exception("Eroor");
    }
  }

  Future<generalModel> fetchGeneralNews() async {
    final response = await http.get(Uri.parse(AppUrl.general));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return generalModel.fromJson(data);
    } else {
      throw Exception("Eroor");
    }
  }
}
