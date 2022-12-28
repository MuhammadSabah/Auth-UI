import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/screen/signup_screen.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/bottom_rich_text.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/confirm_button.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/password_field.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/phone_number_field.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/wave_clipper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.335,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Positioned(
                left: 35,
                top: 90,
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(22.0).copyWith(top: 0),
            child: Form(
              key: widget.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    PhoneNumberField(phoneController: widget.phoneController),
                    const SizedBox(height: 6),
                    PasswordField(
                        labelText: 'Password',
                        passwordController: widget.passwordController),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          text: 'Forget Password?',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 120),
                    ConfirmButton(
                      title: "Login",
                      callBack: () {},
                    ),
                    const SizedBox(height: 30),
                    BottomRichText(
                      detailText: 'New user? ',
                      clickableText: 'Sign up',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      color: Colors.black45,
                    ),
                    const SizedBox(height: 35),
                    Divider(
                      thickness: 1.5,
                      color: Colors.grey.shade900,
                      height: 0,
                      indent: 120,
                      endIndent: 120,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
