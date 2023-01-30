import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inpttxt;
  final double inptwidth;
  final double inptheight;
  final Function? press;
  final TextStyle style;
  final Color? color;
  const CustomButton({
    super.key,
    required this.inpttxt,
    this.inptwidth = 204,
    this.inptheight = 28,
    this.press,
    required this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: press as void Function()?,
        child: Container(
          height: inptheight,
          width: inptwidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Center(
            child: Text(inpttxt, style: style),
          ),
        ),
      ),
    );
  }
}
