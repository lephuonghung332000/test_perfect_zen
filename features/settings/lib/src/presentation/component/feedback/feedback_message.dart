import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

class MessageFeedBack extends StatelessWidget {
  final Key? keyMessage;
  final Function(String)? onTextChange;
  final TextEditingController? controller;

  const MessageFeedBack({
    this.onTextChange,
    Key? key,
    this.keyMessage,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 0),
        child: TextFormField(
          key: keyMessage,
          controller: controller,
          onChanged: onTextChange,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 10,
          style: CustomTextStyle.BODY_14,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: S.current.thought_feedback,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ));
  }
}
