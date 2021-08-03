import 'package:flutter/material.dart';
import 'package:leave_request/authentication/login.dart';
import 'package:provider/provider.dart';

import 'Home.dart';
import 'themeSettings/themeProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme ? dark : light,
            home: LogIn(),
          );
        },
      ),
    );
  }
}
