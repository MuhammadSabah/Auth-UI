import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key, required this.passwordController, required this.labelText});
  final TextEditingController passwordController;
  final String labelText;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
        Radius.circular(10),
      )),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Password Required';
          }
          return null;
        },
        controller: widget.passwordController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        autofocus: false,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscureText,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: widget.labelText,
          counterText: ' ',
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: _obscureText == false
                    ? FaIcon(
                        FontAwesomeIcons.eyeSlash,
                        color: Colors.grey.shade500,
                        size: 18,
                      )
                    : FaIcon(
                        FontAwesomeIcons.eye,
                        color: Colors.grey.shade500,
                        size: 18,
                      ),
              ),
            ],
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 4),
        ),
      ),
    );
  }
}
