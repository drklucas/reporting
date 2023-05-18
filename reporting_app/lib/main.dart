import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reporting_app/providers/provider.dart' as pv;

import 'package:reporting_app/routes/router.dart';

import 'package:reporting_app/views/mobile/welcome/screens/welcome.screen.dart';

void main() {
  runApp(const MyApp(true));
}

class MyApp extends StatelessWidget {
  final bool isMobile; 
   const MyApp(this.isMobile, {super.key});

  @override
  Widget build(BuildContext context) {
       
    return MultiProvider(
      providers: pv.Provider.items(), 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reporting Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomeScreen(),
        routes: isMobile ? AppRouter.mobileRoutes() : AppRouter.webRoutes()
      ),
    );
  }
}
