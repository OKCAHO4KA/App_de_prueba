import 'package:flutter/material.dart';
import 'package:proba/scr/config/app_theme.dart';
import 'package:proba/scr/pages/authorization_page.dart';
import 'package:proba/scr/pages/home_page.dart';
import 'package:proba/scr/providers/items_bottom_provider.dart';
import 'package:proba/scr/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ItemsBottomProvider(),
        ),
        ChangeNotifierProvider(create: (context) => LoginFormProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'auth',
          routes: {
            'auth': (context) => AuthorizationPage(),
            'home': (context) => const HomePage(),
          },
          theme: AppTheme().myTheme,
          title: 'Material App',
          home: AuthorizationPage()),
    );
  }
}
