import 'package:component/atom/custom_text_field.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

class ThemeName extends StatefulWidget {
  const ThemeName({
    Key? key,
    required this.onTextChange,
    this.initialValue,
  }) : super(key: key);

  final Function(String?) onTextChange;
  final String? initialValue;

  @override
  State<ThemeName> createState() => _ThemeNameState();
}

class _ThemeNameState extends State<ThemeName> {
  String? themeName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.theme_name,
          style: CustomTextStyle.TITLE_14.apply(color: StaticColors.gray),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          key: MeditationKey.meditationTitleTimerKey,
          initialValue: widget.initialValue,
          hint: S.current.enter_name,
          type: TextInputType.name,
          validator: _nameValidator,
          onChanged: (value) {
            setState(() {
              themeName = value;
            });
            if (themeName != null) widget.onTextChange.call(themeName);
          },
        ),
      ],
    );
  }

  String? _nameValidator(String? input) {
    if (Validator.name(input ?? '')) {
      return null;
    } else {
      return S.current.theme_name_must_be_1_30_characters;
    }
  }
}
