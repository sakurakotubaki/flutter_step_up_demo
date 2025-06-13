# flutter_step_up_demo

**add flutter_riverpod**

```sh
flutter pub add \
flutter_riverpod \
riverpod_annotation \
dev:riverpod_generator \
dev:build_runner \
dev:custom_lint \
dev:riverpod_lint
```

**add freezed**

```sh
flutter pub add \
  freezed_annotation \
  json_annotation \
  --dev build_runner \
  --dev freezed \
  --dev json_serializable
```

**generate code**

```sh
flutter pub run build_runner watch --delete-conflicting-outputs
```