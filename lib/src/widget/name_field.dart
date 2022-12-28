import 'package:flutter/material.dart';

class NameField extends StatefulWidget {
  const NameField(
      {super.key, required this.nameController, required this.labelText});
  final TextEditingController nameController;
  final String labelText;
  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Name required';
          }
          return null;
        },
        controller: widget.nameController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        autofocus: false,
        keyboardType: TextInputType.text,
        obscureText: false,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 4),
          labelText: widget.labelText,
          counterText: ' ',
          // isCollapsed: true,
        ),
      ),
    );
  }
}
