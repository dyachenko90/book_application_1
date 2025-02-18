
import 'package:flutter/material.dart';

const testStyle = TextStyle(fontSize: 16);



class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key, required String title});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('Залогінтеся'),
      ),
      body: const SingleChildScrollView(
      child: _Header(),
      )
      );
  }
  }

  class _Header extends StatelessWidget {
    const _Header({super.key});
  
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            _Form(),
            SizedBox(height: 25),
            Text('Щоб скористатися можливостями редагування й оцінювання на TMDB, а також отримувати персональні рекомендації, вам потрібно увійти у свій обліковий запис. Якщо ви не маєте облікового запису, його реєстрація безплатна та проста. Клацніть нижче, щоб почати.',
            style: testStyle,
            ),
            SizedBox(height: 15),
            ElevatedButton(
                style: ButtonStyle(
                padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)),
                backgroundColor: WidgetStateProperty.all(Colors.amberAccent),
                foregroundColor: WidgetStateProperty.all(Colors.black87)
              ),
              onPressed: () {}, 
              child: const Text('Зареєструватись')),
            SizedBox(height: 15),
            Text('Якщо ви зареєструвалися, але не отримали електронного листа з підтвердженням, клацніть тут, щоб надіслати його знову.',
            style: testStyle,
            ),
            SizedBox(height: 15),
            ElevatedButton(
                style: ButtonStyle(
                padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)),
                backgroundColor: WidgetStateProperty.all(Colors.amberAccent),
                foregroundColor: WidgetStateProperty.all(Colors.black87)
              ),
              onPressed: () {}, 
              child: const Text('Відправити')),
          ],
        ),
      );
    }
  }

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    
      if (login == 'ad' && password =='ad') {
      errorText = null;
      Navigator.of(context).pushNamed('/main_screen');
    } else {
      errorText = 'Не вірний логін або пароль';
    }
    setState(() {});
  }

    void _resetPassword() {

    print('Reset password');
  }

  void _onChanged(String string) {
    print(string);
  }

  
  @override
  Widget build(BuildContext context) {

    const borderDecoration = InputDecoration(
      hintStyle: TextStyle(color: Colors.black54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding: EdgeInsets.all(10.0)
      );

      final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[ 
          SizedBox(height: 1), 
          Text(
     errorText, 
           style: TextStyle(color: Colors.red)
        )],
        SizedBox(height: 10),
        Text(
          "Ім'я користувача",
          style: testStyle,
        ),
        TextField(
          onChanged: _onChanged,
          enableInteractiveSelection: true,
          enableSuggestions: true,
          decoration: borderDecoration.copyWith(
            hintText: "Ваше ім'я",
          ),
          controller: _loginTextController,

        ),
        SizedBox(height: 15),
        Text(
          'Пароль',
          style: testStyle,
          ),
        TextField(
          controller: _passwordTextController,
          decoration: borderDecoration.copyWith(
            hintText: 'Ваш пароль',
          ),
          obscuringCharacter: ')',
          obscureText: true,
        ),
        SizedBox(height: 15),
        Row(
          children: [
            TextButton(
              onPressed: _auth,
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)),
                backgroundColor: WidgetStateProperty.all(Colors.amberAccent),
                foregroundColor: WidgetStateProperty.all(Colors.black87)
              ),
              child: const Text('Увійти')
            ),
            SizedBox(width: 10),
            TextButton(
              onPressed: _resetPassword, 
                style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(Colors.black87),
              ),
              child: const Text('Скинути пароль'),
            ),
          ],
        ),
      ],
    );
  }
}
