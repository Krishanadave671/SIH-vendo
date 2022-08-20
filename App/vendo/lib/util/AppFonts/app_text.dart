import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/styles.dart';
import 'package:vendo/util/colors.dart';

const TextAlign kcStartText = TextAlign.start;

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  late final int? isSingleLined;

  AppText.headingOne(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = heading1Style.copyWith(color: color);

  AppText.headingTwo(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = heading2Style.copyWith(color: color);

  AppText.headingThree(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = heading3Style.copyWith(color: color);

  AppText.headline(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = headlineStyle.copyWith(color: color);

  AppText.subheading(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = subheadingStyle.copyWith(color: color);

  AppText.caption(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = captionStyle.copyWith(color: color);

  AppText.overline(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = overlineStyle.copyWith(color: color);

  AppText.tiny(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = tinyStyle.copyWith(color: color);

  AppText.body1(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = body1Style.copyWith(color: color);

  AppText.body2(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = body2Style.copyWith(color: color);

  AppText.body(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = bodyStyle.copyWith(color: color);

  AppText.buttonText(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcLightGreyBackground})
      : style = bodyStyle.copyWith(color: color);

  AppText.containerText(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcLightGreyBackground})
      : style = bodyStyle.copyWith(color: color);

  AppText.bodyBold(this.text,
      {this.textAlign,
      this.isSingleLined,
      Color color = colors.kcPrimaryTextColor})
      : style = bodyBoldStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    late TextOverflow overflow;
    if (isSingleLined == null || 0 == isSingleLined!) {
      overflow = TextOverflow.clip;
    } else if (isSingleLined == 1) {
      overflow = TextOverflow.fade;
    } else {
      overflow = TextOverflow.ellipsis;
    }

    return Text(
      text,
      style: style.copyWith(),
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
