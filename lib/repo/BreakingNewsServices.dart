import 'dart:convert';
import 'dart:io';
import 'package:nev_news_with_mvvm/models/NewsResponseModel.dart';
import 'package:nev_news_with_mvvm/network/ApiConstant.dart';
import 'package:http/http.dart' as http;
import 'package:nev_news_with_mvvm/network/ApiStatus.dart';

class BreakingNewsServices {

  static Future<Object> getBreakingNews() async {
    try {
      final queryParameters = {
        'country': 'in',
        'apiKey': '84b6730b5e9f4a48afa0b2b259d41f09',
      };

      var url = Uri.https(BASE_URL, 'v2/top-headlines', queryParameters);
      var response = await http.get(url);
      if (SUCCESS_CODE == response.statusCode) {
        final Map parsed = json.decode(response.body);
        NewsResponseModel responseModel = NewsResponseModel.fromJson(parsed);
        return Success(response: responseModel);
      }
      return Failure(
          code: USER_INVALID_RESPONSE,
          errorResponse: jsonDecode(response.body.toString())["message"]);
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }

}
