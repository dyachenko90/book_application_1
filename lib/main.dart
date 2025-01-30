import 'package:book_application_1/widgets/auth/auth_widget.dart';
import 'package:book_application_1/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.amber,
          unselectedItemColor: Colors.black54,
          selectedItemColor: const Color.fromARGB(255, 124, 99, 248),
        )
      ),
      routes: {
        '/auth': (context) => AuthWidget(title: 'home',),
        '/main_screen': (context) => MainScreenWidget(),

      },
      home: AuthWidget(title: 'home'),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
      },
    );
  }
}


