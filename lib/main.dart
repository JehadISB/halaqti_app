// in the name of allah the most gracious the most merciful
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:halaqti_app/features/auth/presentation/pages/login_screen.dart';
import 'package:halaqti_app/generated/l10n.dart';


void main() {
  runApp(const HalaqtiApp());
}

class HalaqtiApp extends StatelessWidget {
  const HalaqtiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("ar"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Alexandria"),

    );
  }
}
