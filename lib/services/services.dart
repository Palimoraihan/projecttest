import 'dart:convert';
import 'dart:developer';

import 'package:github_app/model/model.dart';
import 'package:http/http.dart' as http;

class ApiServices{
Future<MainModel> myServer(String text) async {
  final url = Uri.parse('https://api.github.com/search/repositories?q=$text');
    final response = await http.get(url);
        log(response.body);
      if(response.statusCode==200){
        return MainModel.fromJson(json.decode(response.body));
      }
      else{
        throw Exception('erorr');
      }
  }
}