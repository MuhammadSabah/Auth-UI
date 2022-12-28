import 'package:flutter/material.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/screen/login_screen.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/bottom_rich_text.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/confirm_button.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/name_field.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/password_field.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/phone_number_field.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/widget/wave_clipper.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
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
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.235,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Positioned(
                left: 35,
                top: 50,
                child: Text(
                  'Create Account',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  NameField(
                      nameController: widget.firstNameController,
                      labelText: 'First Name'),
                  const SizedBox(height: 4),
                  NameField(
                      nameController: widget.lastNameController,
                      labelText: 'Last Name'),
                  const SizedBox(height: 4),
                  PhoneNumberField(phoneController: widget.phoneController),
                  const SizedBox(height: 4),
                  PasswordField(
                      labelText: 'Password',
                      passwordController: widget.passwordController),
                  const SizedBox(height: 4),
                  PasswordField(
                      labelText: 'Confirm Password',
                      passwordController: widget.confirmPasswordController),
                  const SizedBox(height: 20),
                  ConfirmButton(
                    title: "Sign up",
                    callBack: () {},
                  ),
                  const SizedBox(height: 25),
                  BottomRichText(
                    detailText: 'Already have an account? ',
                    clickableText: 'Login',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
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
        ],
      ),
    );
  }
}
