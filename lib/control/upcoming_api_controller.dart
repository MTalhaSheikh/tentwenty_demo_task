import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../data/models/upcoming_movies_api_model.dart';

class ApiController {

  Future<UpComingApiModel> getApiData() async {
    const apiUrl =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=93adf2f46c9055080f4690b7b3bdd363';
    late UpComingApiModel upComingApiData;
    try {
      http.Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        upComingApiData = UpComingApiModel.fromJson(jsonMap);
      }
    } on Exception {
      debugPrint("Failed to load data");
    }
    return upComingApiData;
  }

}