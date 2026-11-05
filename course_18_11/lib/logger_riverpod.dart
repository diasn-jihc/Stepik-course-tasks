import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user.dart';

final class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    super.didUpdateProvider(context, previousValue, newValue);

    if (newValue is AsyncData<User>) {
      log(
        '${context.provider.name ?? context.provider.runtimeType}, $previousValue, $newValue',
      );
    }
  }
}
