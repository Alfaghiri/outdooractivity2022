// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'HikingData.dart';

class HikingApi {
  static Future<List<HikingData>> getplaces() async {
    final url =
        'https://raw.githubusercontent.com/Alfaghiri/OutdoorActivity/master/Hiking.json';

    try {
      final response = await http.get(Uri.parse(url));
      final body = json.decode(response.body);
      return body.map<HikingData>(HikingData.fromJson).toList();
    } on Error catch (error) {
      // code will go here
      print(error);
      return null;
    } on HttpException catch (ex) {
      print('http');
      print(ex);
      print('exception');
      return null;
    } on Object catch (error) {
      print(error);
      return null;
    }
  }
}
