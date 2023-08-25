import 'package:flutter/material.dart';
import 'package:proba/scr/config/app_theme.dart';
import 'package:proba/scr/providers/login_form_provider.dart';
import 'package:proba/scr/widgets/button_auth.dart';
import 'package:proba/scr/widgets/custom_circle_avatar.dart';
import 'package:proba/scr/widgets/navigation_bar_bottom.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginFormProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Профиль'),
          centerTitle: true,
        ),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 38,
                ),
                const CustomCircleAvatar(),
                NameOfUserText(
                    text: 'Добрый день, ${authProvider.user.nickname}'),
                EmailOfUserText(email: authProvider.user.email),
                ButtonAuth(
                  alignment: Alignment.centerLeft,
                  textStyle: AppTheme().textStyleExit,
                  colorButton: Colors.white,
                  text: '  Выйти',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'auth');
                  },
                ),
              ],
            )),
        bottomNavigationBar: const NavigationBarBottom());
  }
}

class EmailOfUserText extends StatelessWidget {
  final String email;
  const EmailOfUserText({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Text(email,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
                color: Color(0xff929292))));
  }
}

class NameOfUserText extends StatelessWidget {
  final String text;
  const NameOfUserText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          text,
          style: AppTheme().textStyleName,
        ));
  }
}
