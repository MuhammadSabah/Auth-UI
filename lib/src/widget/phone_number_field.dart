import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({super.key, required this.phoneController});

final TextEditingController phoneController;
  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  Country? _country;
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
            return 'Phone number required';
          }
          return null;
        },
        controller: widget.phoneController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        autofocus: false,
        keyboardType: TextInputType.phone,
        obscureText: false,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelText: 'Phone Number',
          prefix: GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                onSelect: (Country country) {
                  setState(() {
                    _country = country;
                  });
                  return FocusManager.instance.primaryFocus?.unfocus();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 8.0, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Text(
                      _country == null
                          ? ' '
                          : '+${_country!.phoneCode} ${_country!.flagEmoji}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          counterText: ' ',
          hintText: _country?.example,
          // isCollapsed: true,
        ),
      ),
    );
  }
}
