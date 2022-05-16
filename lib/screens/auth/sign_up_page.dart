import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/slide_route_builder.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/models/user.dart';
import 'package:covid_app/screens/main_page.dart';
import 'package:covid_app/view_models/auth_view_model.dart';
import 'package:covid_app/widgets/auth_hedaer.dart';
import 'package:covid_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _addressController;
  TextEditingController? _phoneController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
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
                controller: _nameController ?? TextEditingController(),
                onChange: (value) {},
                label: "Nama",
              ),
              TextFieldWidget(
                controller: _emailController ?? TextEditingController(),
                onChange: (value) {},
                label: "Email",
              ),
              TextFieldWidget(
                controller: _phoneController ?? TextEditingController(),
                onChange: (value) {},
                label: "Phone",
              ),
              TextFieldWidget(
                controller: _addressController ?? TextEditingController(),
                onChange: (value) {},
                label: "Adress",
              ),
              TextFieldWidget(
                controller: _passwordController ?? TextEditingController(),
                obscureText: true,
                onChange: (value) {},
                label: "Password",
              ),
              _authViewModel.requestState == RequestState.LOADING
                  ? const Center(child: CircularProgressIndicator())
                  : OutlinedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          UserModel user = UserModel(
                            name: _nameController?.text,
                            email: _emailController?.text,
                            address: _addressController?.text,
                            phone: _phoneController?.text,
                          );

                          await _authViewModel
                              .signUp(user, _passwordController!.text)
                              .then((value) {
                            if (_authViewModel.requestState ==
                                RequestState.LOADED) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                SlidePageRoute(page: const MainPage()),
                                (route) => false,
                              );
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
                        "Sign Up",
                        style: AppStyle.kHeading6,
                      ),
                    ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("Sudah punya akun?", style: AppStyle.kBodyText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
