import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/api_model.dart';


class API {
  Future<APIModel> fetch(String category) async {
    Uri url = Uri.parse(
        'https://ezel.s3.amazonaws.com//$category.json');
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      return APIModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('error');
    }
  }
}
