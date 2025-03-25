import 'package:dio/dio.dart';

//Dio Helper That's Connect and Talk to API.
class DioHelper {
  static late Dio dio;
  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  static init() {
    dio = Dio(
      BaseOptions(
        //Here the URL of API.
        baseUrl:"https://healthcare.runasp.net/api/",
        receiveDataWhenStatusError: true,
        // connectTimeout: Duration(seconds: 10),
        // receiveTimeout: Duration(seconds: 10),
        // sendTimeout: Duration(seconds: 10),
      ),
    );

  }


  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    Map<String,dynamic>?data,
    Options ?options,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'content-lang':"en"
      };
      final Response response = await dio.get(
        url,
        data: data,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
        options: options
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  static Future<Response> postData({
    required String url,
    Map<String, dynamic> ?data,
    FormData ?formData,
    Map<String, dynamic>? queryParameters,

    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {

      dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'content-lang':"en"
      };
      final Response response = await dio.post(
        url,
        data: data??formData,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }  catch (e) {
      rethrow;
    }

  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> putData({
    required String url,
    Map<String, dynamic> ?data,
    String? token,
    FormData ?formData,
    Map<String, dynamic>? queryParameters,

    //bool files = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'content-lang':"en"
      };
      final Response response = await dio.put(
        url,
        data: data??formData,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,

        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    String ?token,
    bool files = false,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'content-lang':"en"
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

  //This Function that's Used To Delete Data to API based on URL(End Points) and Headers.
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    //String lang = 'en',
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'content-lang':"en"
      };
      final Response response = await dio.delete(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}




