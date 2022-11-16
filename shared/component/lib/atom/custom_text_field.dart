import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preferences/preferences.dart';
import 'dart:math' as math;

class CustomTextField extends StatelessWidget {
  final String hint;
  final Color? textColor;
  final Color? fillColor;
  final TextInputType? type;
  final TextAlign align;
  final int maxLines;
  final FocusNode? ownFocus;
  final FocusNode? nextFocus;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final Function? onTap;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final bool isReadOnly;
  final bool showCursor;
  final bool? isDropDown;
  final String? initialValue;

  const CustomTextField({
    super.key,
    required this.hint,
    this.type = TextInputType.name,
    this.isDropDown = false,
    this.isReadOnly = false,
    this.textColor,
    this.fillColor = Colors.white,
    this.showCursor = true,
    this.maxLines = 1,
    this.align = TextAlign.start,
    this.textCapitalization = TextCapitalization.sentences,
    this.ownFocus,
    this.nextFocus,
    this.validator,
    this.controller,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.textInputAction,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onTap: () async {
        onTap?.call();
      },
      showCursor: showCursor ? true : false,
      cursorColor: Colors.black,
      autocorrect: true,
      maxLength: maxLength,
      readOnly: isReadOnly,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
      maxLines: maxLines,
      controller: controller,
      keyboardType: type,
      textAlign: align,
      focusNode: ownFocus,
      validator: validator,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(nextFocus),
      onChanged: onChanged,
      decoration: InputDecoration(
        errorStyle: CustomTextStyle.BODY_14.apply(
          color: Colors.red,
        ),
        isDense: true,
        helperText: ' ',
        filled: true,
        errorMaxLines: 2,
        enabledBorder: _borderOutline(),
        focusedBorder: _borderOutline(),
        errorBorder: _borderOutline(),
        border: _borderOutline(),
        fillColor: fillColor,
        hintText: hint,
        hintStyle: CustomTextStyle.BODY_14.apply(
          color: StaticColors.place_holder,
        ),
        contentPadding: const EdgeInsets.fromLTRB(2, 16, 16, 16),
        prefixIcon: const SizedBox(
          width: 20,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          maxWidth: 15,
          minHeight: 2,
        ),
        suffixIcon: isDropDown!
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Transform.rotate(
                  angle: -90 * math.pi / 180,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                ),
              )
            : null,
      ),
    );
  }

  OutlineInputBorder _borderOutline() => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.white, width: 1),
      );
}
