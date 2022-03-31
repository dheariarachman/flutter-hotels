import 'dart:convert';

import 'package:bwa_cozy/models/spaces.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Future<List<Space>> getRecommendedSpaces() async {
    try {
      var result = await http
          .get(Uri.parse("https://bwa-cozy.herokuapp.com/recommended-spaces"));

      if (result.statusCode == 200) {
        List data = jsonDecode(result.body);

        List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();

        return spaces;
      }
      throw 'Data not found';
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
