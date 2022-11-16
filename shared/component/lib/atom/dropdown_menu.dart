import 'package:flutter/material.dart';
import 'atom.dart';
import 'package:core/core.dart';

class DropdownMenu extends StatelessWidget {
  final Function onTap;
  final String hint;
  final TextEditingController controller;
  final String errorMessage;
  final bool allowNull;
  final String? initialValue;

  const DropdownMenu({
    super.key,
    required this.onTap,
    required this.hint,
    required this.controller,
    required this.errorMessage,
    required this.allowNull,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: allowNull ? (e) {} : _selectValidator,
      hint: hint,
      isDropDown: true,
      onTap: () async {
        onTap.call();
      },
      controller: controller,
      showCursor: false,
    );
  }

  String? _selectValidator(String? input) {
    if (Validator.select(input ?? '')) {
      return null;
    } else {
      return errorMessage;
    }
  }
}
