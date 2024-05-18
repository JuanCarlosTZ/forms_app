import 'package:flutter/material.dart';
import 'package:forms_app/config/helper/helper.dart';

enum CustomInputType { text, email, password }

class CustomInputTextFormField extends StatelessWidget {
  final GlobalKey<FormFieldState>? fieldKey;
  final String label;
  final String? hintText;
  final Function(String value) onChange;
  final bool isRequired;
  final CustomInputType type;
  final String? error;
  const CustomInputTextFormField({
    super.key,
    required this.label,
    this.hintText,
    required this.onChange,
    this.isRequired = false,
    this.type = CustomInputType.text,
    required this.fieldKey,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final customBorder =
        OutlineInputBorder(borderRadius: BorderRadius.circular(40));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        key: fieldKey,
        decoration: InputDecoration(
          border: customBorder,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label),
              isRequired
                  ? Icon(
                      Icons.star,
                      color: Colors.red.shade800,
                      size: 10,
                    )
                  : const SizedBox()
            ],
          ),
          hintText: hintText,
          isDense: true,
          errorText: error,
        ),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return 'Required';
          }
          if (!isRequired && (value == null || value.isEmpty)) {
            return null;
          }
          if (type == CustomInputType.text && value!.length <= 3) {
            return 'Length must be more than 3';
          }
          if (type == CustomInputType.email && !validateEmail(value!)) {
            return 'Must be valid email';
          }
          if (type == CustomInputType.password && value!.length <= 6) {
            return 'Length must be more than 6';
          }

          return null;
        },
        onChanged: (value) {
          fieldKey?.currentState?.validate();
          onChange(value);
        },
        obscureText: type == CustomInputType.password,
      ),
    );
  }
}
