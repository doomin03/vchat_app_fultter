import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vchat_app_fultter/ui/theme/default_theme.dart';
import 'package:vchat_app_fultter/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: DefaultTheme.theme,
          routerConfig: router.config(),
        );
      },
    );
  }
}
