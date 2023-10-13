import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedCont extends StatelessWidget {
  final Widget? childcont;
  final Function()? ontapcont;

  final double? hcont;
  final Color? colorcont;
  final Gradient? gradientcont;
  final List<BoxShadow>? shadowcont;
  final BoxBorder? bordercont;
  const SharedCont(
      {super.key,
      this.childcont,
      this.ontapcont,
      this.hcont,
      this.colorcont,
      this.gradientcont,
      this.shadowcont,
      this.bordercont});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapcont,
      child: Container(
        width: 64.w,
        height: hcont,
        decoration: BoxDecoration(
            gradient: gradientcont,
            color: colorcont,
            borderRadius: BorderRadius.circular(32),
            boxShadow: shadowcont,
            border: bordercont),
        child: childcont,
      ),
    );
  }
}
