import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    super.didUpdateProvider(provider, previousValue, newValue, container);

    if (newValue is AsyncData<User>) {
      log(
        '${provider.name ?? provider.runtimeType}, $previousValue, $newValue',
      );
    }
  }

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    super.didDisposeProvider(provider, container);
  }
}
