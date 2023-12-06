import 'dart:convert';

import 'package:flutter/services.dart';

// Read a json file from the assets folder and return a list of dynamic objects
Future<List<dynamic>> readJsonFile(String file) async {
  final jsonString = await rootBundle.loadString(file);
  List<dynamic> jsonList = json.decode(jsonString);
  return jsonList;
}
