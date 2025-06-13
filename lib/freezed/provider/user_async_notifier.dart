import 'package:flutter_step_up_demo/freezed/model/user_api.dart';
import 'package:flutter_step_up_demo/freezed/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_async_notifier.g.dart';

@riverpod
class UserAsyncNotifier extends _$UserAsyncNotifier {
  @override
  Future<List<UserModel>> build() {
    return getUsers();
  }

  Future<List<UserModel>> getUsers() async {
    try {
      final userApi = ref.read(userApiProvider);
      final users = await userApi.getUsers();
      return users;
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
