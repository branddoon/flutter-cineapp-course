import 'package:cineapp/config/router/router.dart';
import 'package:cineapp/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async{
  await dotenv.load(fileName: '.env');
  runApp( 
    ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Cine app',
      theme: AppTheme().getTheme()
    );
  }
}
