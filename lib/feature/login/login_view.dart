import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuntium/feature/login/login_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final counterProvider = StateNotifierProvider(
    (ref) => LoginProvider(),
  );

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      body: Text(count.toString()),
    );
  }
}
