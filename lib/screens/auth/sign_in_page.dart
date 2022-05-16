import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/slide_route_builder.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/screens/auth/sign_up_page.dart';
import 'package:covid_app/screens/main_page.dart';
import 'package:covid_app/view_models/auth_view_model.dart';
import 'package:covid_app/widgets/auth_hedaer.dart';
import 'package:covid_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel _authViewModel = Provider.of<AuthViewModel>(context);
    final _key = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              const AuthHeaderWidget(),
              TextFieldWidget(
                controller: _emailController ?? TextEditingController(),
                onChange: (value) {},
                label: "Email",
              ),
              TextFieldWidget(
                controller: _passwordController ?? TextEditingController(),
                onChange: (value) {},
                obscureText: true,
                label: "Password",
              ),
              _authViewModel.requestState == RequestState.LOADING
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : OutlinedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          _authViewModel
                              .signIn(
                            _emailController?.text ?? "",
                            _passwordController?.text ?? "",
                          )
                              .then((value) {
                            if (_authViewModel.requestState ==
                                RequestState.LOADED) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  SlidePageRoute(page: const MainPage()),
                                  (route) => false);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  _authViewModel.errMsg,
                                  style: AppStyle.kBodyText.copyWith(
                                    color: AppStyle.white,
                                  ),
                                ),
                                duration: const Duration(seconds: 1),
                              ));
                            }
                          });
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 60,
                        ),
                        primary: AppStyle.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(
                          color: AppStyle.purple,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: AppStyle.kHeading6,
                      ),
                    ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, SlidePageRoute(page: const SignUpPage()));
                },
                child: Text("Belum punya akun?", style: AppStyle.kBodyText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
