import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proba/helpers/helper.dart';
import 'package:proba/scr/models/response_authorization.dart';
import 'package:proba/scr/pages/home_page.dart';
import 'package:proba/scr/widgets/snackbar_custom.dart';
import 'package:proba/scr/config/app_theme.dart';
import 'package:proba/scr/providers/login_form_provider.dart';
import 'package:proba/scr/widgets/button_auth.dart';
import 'package:provider/provider.dart';

class AuthorizationPage extends StatelessWidget {
  AuthorizationPage({super.key});
  TextEditingController emailLoginCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final FocusNode focusNode = FocusNode();
    final loginProvider = Provider.of<LoginFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(children: [
            SizedBox(
              height: size.height * 0.3,
            ),
            Form(
              key: loginProvider.formKey,
              child: Column(children: [
                TextFormField(
                    controller: emailLoginCtr,
                    validator: (value) {
                      if (value != null && value.length >= 3) return null;
                      return 'Введите логин или почту';
                    },
                    onTapOutside: (event) => focusNode.unfocus(),
                    focusNode: focusNode,
                    decoration:
                        const InputDecoration(hintText: 'Логин или почта')),
                const SizedBox(
                  height: 1,
                ),
                TextFormField(
                    controller: passwordCtr,
                    obscureText: loginProvider.isHidden,
                    validator: (value) {
                      if (value != null && value.length >= 8) return null;
                      return 'Пароль должен быть не менее 8 символов';
                    },
                    decoration: InputDecoration(
                        hintText: 'Пароль',
                        suffixIcon: IconButton(
                          icon: loginProvider.isHidden
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            loginProvider.isHidden = !loginProvider.isHidden;
                          },
                        ))),
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonAuth(
                  textStyle: AppTheme().textStyle,
                  text: loginProvider.isLoading ? 'Подождите' : 'Войти',
                  onPressed: loginProvider.isLoading
                      ? null
                      : () async {
                          ResponseAuthorization? responseAuth;

                          focusNode.unfocus();

                          if (!loginProvider.isValidForm()) return;
                          loginProvider.isLoading = true;

                          try {
                            responseAuth = await Helper.loginUser(
                                emailLoginCtr.value.text.trim(),
                                passwordCtr.value.text.trim());

                            if (responseAuth != null) {
                              loginProvider.user = responseAuth.user!;

                              Future.microtask(() => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage())));
                            } else {
                              loginProvider.isLoading = false;

                              return Future.microtask(() {
                                SnackBar snackBar2 =
                                    sB(context, 'Логин или пароль не верны');
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar2);
                              });
                            }
                          } on DioException catch (e) {
                            // ignore: avoid_print
                            print(e);
                          }
                          loginProvider.isLoading = false;
                        }),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonAuth(
                textStyle: AppTheme().textStyle,
                text: 'Зарегистрироваться',
                onPressed: () {},
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
