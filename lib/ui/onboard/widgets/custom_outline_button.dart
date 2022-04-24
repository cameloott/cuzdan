import 'package:cuzdan/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

import '../../../core/init/theme/color_scheme_dark.dart';

class CustomOutlineButton extends BaseStateless {
  final String title;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? borderColor;
  const CustomOutlineButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonColor = Colors.transparent,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(context, 50),
      width: dynamicWidth(context, 125),
      child: ElevatedButton(
          child: Text(title),
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            onPrimary: Colors.white,
            side: BorderSide(
              color: borderColor!,
              width: 1,
            ),
          ),
          onPressed: onPressed),
    );
  }
}
