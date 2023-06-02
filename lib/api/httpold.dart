
// import 'package:dio/dio.dart';
// import 'package:singleapiapp/api/apiexceptions.dart';
// import 'package:singleapiapp/api/urls.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart' as prefix;

// String dioErrorHandle(DioError error) {
//   switch (error.type) {
//     case DioErrorType.response:
//       switch (error.response?.statusCode) {
//         case 400:
//           throw BadRequestException(error.response?.statusCode.toString());
//         case 401:
//           throw UnauthorisedException(error.response?.statusCode.toString());
//         case 403:
//           throw UnauthorisedException(error.response?.statusCode.toString());
//         case 404:
//           throw NotFoundException(error.response?.statusCode.toString());
//         case 500:
//           throw InternalServerError(error.response?.statusCode.toString());
//         default:
//           throw FetchDataException(
//               'Error occured while Communication with Server with StatusCode : ${error.response?.statusCode}');
//       }

//     case DioErrorType.sendTimeout:
//     case DioErrorType.receiveTimeout:
//       return "request_time_out";

//     default:
//       return "connect_to_server_fail ${error.message}";
//   }
// }

// class HTTPManager {
//   prefix.FlutterSecureStorage flutterSecureStorage =
//       const prefix.FlutterSecureStorage();
//   BaseOptions baseOptions = BaseOptions(
//     baseUrl: APIurl.base_URL,
//     connectTimeout: 30000000,
//     receiveTimeout: 30000000,
//     sendTimeout: 30000000,
//     headers: {},
//     contentType: Headers.jsonContentType,
//     responseType: ResponseType.json,
//   );

//   ///Post method
//   Future<dynamic> post({
//     required String url,
//     dynamic data,
//     Options? options,
//   }) async {
//     Dio dio = Dio(baseOptions);
//     String? token = await flutterSecureStorage.read(key: 'token');
//     dio.options.headers.addAll({
//       'session_token': '$token',
//       "Connection": "Keep-Alive",
//       "Keep-Alive": "timeout=30, max=10000000"
//     });
//     try {
//       final response = await dio.post(
//         url,
//         data: data,
//         options: options,
//       );
//       return response.data;
//     } on DioError catch (error) {
//       return {"message": dioErrorHandle(error)};
//     }
//   }

//   ///Get method http Manager
//   Future<dynamic> get({
//     required String url,
//     Map<String, dynamic>? params,
//     Options? options,
//   }) async {
//     Dio dio = Dio(baseOptions);
//     String? token = await flutterSecureStorage.read(key: 'token');
//     // log("sessiontoken from the backend $token");
//     dio.options.headers.addAll({
//       'session_token': '$token',
//       "Connection": "Keep-Alive",
//       "Keep-Alive": "timeout=5, max=1000"
//     });
//     try {
//       final response = await dio.get(
//         url,
//         queryParameters: params,
//         options: options,
//       );
//       return response.data;
//     } on DioError catch (error) {
//       return {"message": dioErrorHandle(error)};
//     }
//   }

//   Future<dynamic> noTokenGet({
//     required String url,
//     Map<String, dynamic>? params,
//     Options? options,
//   }) async {
//     Dio dio = Dio(baseOptions);
//     try {
//       final response = await dio.get(
//         url,
//         queryParameters: params,
//         options: options,
//       );
//       return response.data;
//     } on DioError catch (error) {
//       return {"message": dioErrorHandle(error)};
//     }
//   }

//   Future<dynamic> noTokenPost({
//     required String url,
//     dynamic data,
//     Options? options,
//   }) async {
//     Dio dio = Dio(baseOptions);
//     try {
//       final response = await dio.post(
//         url,
//         data: data,
//         options: options,
//       );
//       return response.data;
//     } on DioError catch (error) {
//       return {"message": dioErrorHandle(error)};
//     }
//   }

//   factory HTTPManager() {
//     return HTTPManager._internal();
//   }

//   HTTPManager._internal();
// }

// HTTPManager httpManager = HTTPManager();
