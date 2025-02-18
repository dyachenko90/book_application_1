import 'package:book_application_1/widgets/auth/auth_widget.dart';
import 'package:book_application_1/widgets/card_book/card_book_widget.dart';
import 'package:book_application_1/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.amber,
            unselectedItemColor: Colors.black54,
            selectedItemColor: const Color.fromARGB(255, 55, 33, 164),
          ),
        ),
        routes: {
          '/auth': (context) => AuthWidget(title: 'home'),
          '/main_screen': (context) => MainScreenWidget(),
        },
        home: AuthWidget(title: 'home'),
        onGenerateRoute: (settings) {
          if (settings.name == '/main_screen/card_book') {
            final args = settings.arguments as Map<String, dynamic>?;

            if (args == null ||
                !args.containsKey('id') ||
                !args.containsKey('title')) {
              return _errorPage('Ошибка: Данные книги не переданы');
            }

            final int id = args['id'];
            final String title = args['title'];

            return MaterialPageRoute(
              builder: (context) => CardBookWidget(bookId: id, title: title),
            );
          }

          return _errorPage('Page not found');
        });
  }

  MaterialPageRoute _errorPage(String message) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
            child: Text(message,
                style: TextStyle(fontSize: 18, color: Colors.red))),
      ),
    );
  }
}
