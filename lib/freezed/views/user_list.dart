import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_step_up_demo/freezed/provider/user_async_notifier.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userAsyncNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod')),
      body: switch (users) {
        AsyncData(:final value) => ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final user = value[index];
            return ListTile(title: Text(user.name), subtitle: Text(user.email));
          },
        ),
        AsyncError(:final error) => Text('error: $error'),
        _ => const Text('loading'),
      },
    );
  }
}
