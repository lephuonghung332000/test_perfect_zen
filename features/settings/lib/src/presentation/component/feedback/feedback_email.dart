import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

class EmailFeedback extends StatelessWidget {
  final Key? keyEmail;
  final Function(String)? onTextChanges;
  final TextEditingController? controllers;

  const EmailFeedback({
    this.onTextChanges,
    Key? key,
    this.keyEmail,
    this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 0),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.send,
          key: keyEmail,
          controller: controllers,
          onChanged: onTextChanges,
          maxLines: 1,
          style: CustomTextStyle.BODY_14,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: S.current.thought_email,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ));
  }
}
