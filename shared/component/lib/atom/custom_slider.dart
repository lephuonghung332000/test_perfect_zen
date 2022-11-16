import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class CustomSlider extends StatefulWidget {
  final Widget? beginIcon;
  final Widget? endIcon;
  final double? max;
  final double? min;
  final int? sliderWidth;
  final Color? inactiveColor;
  final Color? activeColor;
  final Function(double)? onChanged;
  final String? label;
  final double? initialValue;
  final double? value;

  const CustomSlider({
    Key? key,
    this.beginIcon,
    this.endIcon,
    this.max,
    this.min,
    this.sliderWidth,
    this.inactiveColor,
    this.activeColor,
    this.onChanged,
    this.label,
    this.initialValue,
    this.value,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    double selectedValue = widget.initialValue ?? 5;
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.beginIcon ?? SvgPicture.asset(AssetsPath.icVolumeOff),
        SizedBox(
          width: size.width - 70,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              overlayShape: SliderComponentShape.noOverlay,
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            ),
            child: Slider(
              max: widget.max ?? 100.0,
              min: widget.max ?? 0.0,
              inactiveColor: widget.inactiveColor ?? Colors.white,
              activeColor: widget.activeColor ?? StaticColors.active_duration,
              label: widget.label ??
                  S.current.mins(selectedValue.toInt().toString()),
              onChanged: (e) {
                setState(() {
                  selectedValue = e;
                });
                widget.onChanged?.call(e);
              },
              value: widget.value ?? selectedValue,
            ),
          ),
        ),
        widget.endIcon ?? SvgPicture.asset(AssetsPath.icVolumeMax),
      ],
    );
  }
}
