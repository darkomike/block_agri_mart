import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      required this.height,
      this.buttonOutlineColor,
      this.buttonBackgroundColor, this.titleStyle,
      this.borderRadius,
      this.elevation,
      required this.width,
      this.onHover,
      this.onPressed})
      : super(key: key);

  final String title;
  final double height;
  final double width;
  final double? elevation;
  final double? borderRadius;
  final Color? buttonOutlineColor;
  final TextStyle? titleStyle; 
  final Color? buttonBackgroundColor;

  final Function()? onPressed;
  final Function(bool)? onHover;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onHover: onHover,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation ?? 2),
              side: MaterialStateProperty.all(
                BorderSide(color: buttonOutlineColor ?? Colors.green.shade100),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  buttonBackgroundColor ?? Theme.of(context).backgroundColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10)))),
          onPressed: onPressed,
          child: Text(title, style: titleStyle ?? Theme.of(context).textTheme.headline6,)),
    );
  }
}
