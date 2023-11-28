import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../models/jobs_model.dart';
import '../utils/app_constants.dart';


final clientProvider = Provider((ref) => Dio(
    BaseOptions(
        baseUrl: "http://pancakes-test.us-east-2.elasticbeanstalk.com"
    )
)
);





final repository =
Provider<RepositoryAPI>((ref) => RepositoryAPI(ref));





abstract class Repository {
  Future<dynamic> get(String path, Map<String,dynamic> queryParameters);
  Future<dynamic> post(String path,Map<String,dynamic> body, Map<String,dynamic> queryParameters);
  Future<dynamic> postFormData(String path,FormData body, Map<String,dynamic> queryParameters);
}



class RepositoryAPI implements Repository{
  final Ref ref;
  RepositoryAPI(this.ref);

  @override
  Future<dynamic> get(String path, Map<String,dynamic> queryParameters) async{
    //final String token = await ref.watch(diskDataProvider).getToken();
    final String baseUrl = "http://pancakes-test.us-east-2.elasticbeanstalk.com";
    try{
      Options requestOptions = Options();
      ref.watch(clientProvider).options.headers = {
        //"Authorization":"Bearer $token",
        "Host": baseUrl.replaceAll("http://", ""),
      };
      ref.watch(clientProvider).options.queryParameters = queryParameters;
      final Response response = await ref.watch(clientProvider).get(path);
      print(response);
      print("passed get method");
      print(response.statusMessage);
      return response.data;
    } on DioException catch (errorMessage) {
      throw Exception(errorMessage);
    }
  }

  @override
  Future post(String path, Map<String, dynamic> body, Map<String, dynamic> queryParameters) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future postFormData(String path, FormData body, Map<String, dynamic> queryParameters) {
    // TODO: implement postFormData
    throw UnimplementedError();
  }

}

