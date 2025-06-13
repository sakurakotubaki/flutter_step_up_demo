import 'package:dio/dio.dart';
import 'package:flutter_step_up_demo/freezed/model/user_model.dart';

class UserApi {
  final Dio _dio;

  UserApi([Dio? dio])
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://jsonplaceholder.typicode.com',
              connectTimeout: const Duration(seconds: 3), // 5 seconds
              receiveTimeout: const Duration(seconds: 3), // 3 seconds
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          );

  Future<List<UserModel>> getUsers() async {
    try {
      List<UserModel> users = [];
      final response = await _dio.get('/users');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        users = data.map((user) => UserModel.fromJson(user)).toList();
        return users;
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load users: ${e.message}');
    }
  }
}
