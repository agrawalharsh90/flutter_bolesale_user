import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.validators,
      this.showObscureText = false,
      this.fieldHeader,
      this.initialValue,
      this.isEditable = true,
      this.suffixIcon,
      this.maxLength,
      this.textInputType = TextInputType.emailAddress,
      this.focusNode,
      this.onChanged,
      this.inputFormatters,
      this.color = Styles.WHITE_COLOR,
      this.borderColor = Styles.PRIMARY_COLOR,
      this.titleColor = Styles.WHITE_COLOR});

  final FocusNode focusNode;
  final FormFieldValidator<String> validators;
  final bool showObscureText;
  final String fieldHeader;
  final String initialValue;
  final bool isEditable;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final Function onChanged;
  final Color color;
  final Color borderColor;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtil.instance.setHeight(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil.instance.setWidth(25)),
            child: Text(fieldHeader,
                style: TextStyle(fontSize: 16, color: titleColor)),
          ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(15),
          ),
          textField(),
        ],
      ),
    );
  }

  Widget textField() {
    return Container(
      constraints: BoxConstraints(
        minHeight: ScreenUtil.instance.setHeight(50.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setWidth(30.0),
      ),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          boxShadow: kElevationToShadow[4]),
      child: TextFormField(
        focusNode: focusNode,
        onChanged: onChanged,
        textAlign: TextAlign.start,
        keyboardType: textInputType,
        initialValue: initialValue,
        validator: validators,
        inputFormatters: inputFormatters,
        obscureText: showObscureText,
        enabled: isEditable,
        maxLength: maxLength,
        maxLines: showObscureText ? 1 : null,
        style: TextStyle(
          fontSize: 16,
          color: Styles.BLACK_COLOR.withOpacity(0.5),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          errorStyle: TextStyle(
            fontSize: 10,
            color: Styles.RED_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
