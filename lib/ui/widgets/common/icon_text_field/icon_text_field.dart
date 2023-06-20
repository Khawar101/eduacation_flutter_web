// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'icon_text_field_model.dart';

class IconTextField extends StackedView<IconTextFieldModel> {
  IconTextField(
      {super.key,
      //   this.shape,
      // this.padding,
      // this.variant,
      // this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.titleText,
      this.icon,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator,
      this.border,
      this.enabledBorder,
      this.focusedBorder,
      this.disabledBorder,
      this.hintStyle,
      this.inputFormaters,
      this.textAlign,
      this.onChanged,
      this.initValue});

  TextAlign? textAlign;
  List<TextInputFormatter>? inputFormaters;
  // WidgetShape? shape;

  // WidgetPadding? padding;

  // WidgetVariant? variant;

  // WidgetFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  String? titleText;
  IconData? icon;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;
  void Function(String)? onChanged;
  String? initValue;

  InputBorder? border;
  InputBorder? enabledBorder;
  InputBorder? focusedBorder;
  InputBorder? disabledBorder;
  InputBorder? errorBorder;
  //this.focusedErrorBorder,
  //this.disabledBorder,
  //this.enabledBorder,

  GestureTapCallback? onTap;

  TextStyle? hintStyle;

  @override
  Widget builder(
    BuildContext context,
    IconTextFieldModel viewModel,
    Widget? child,
  ) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  @override
  IconTextFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      IconTextFieldModel();
  _buildTextFormFieldWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText ?? "",
          style: GoogleFonts.ibmPlexSans(
              color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: width,
          margin: margin,
          child: TextFormField(
            onTap: onTap,
            onChanged: onChanged,
            initialValue: initValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            focusNode: focusNode,
            style: _setFontStyle(),
            obscureText: isObscureText!,
            textAlign: textAlign ?? TextAlign.start,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            inputFormatters: inputFormaters,
            maxLines: maxLines ?? 1,
            decoration: _buildDecoration(),
            validator: validator,
          ),
        ),
      ],
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: hintStyle ?? _setFontStyle(),
      border: border ?? _setBorderStyle(),
      enabledBorder: enabledBorder ?? _setBorderStyle(),
      focusedBorder: focusedBorder ?? _setBorderStyle(),
      disabledBorder: disabledBorder ?? _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      // filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Roboto',
    );
  }

  // ignore: unused_element
  _setOutlineBorderRadius() {
    return BorderRadius.circular(
      10.00,
    );
  }

  _setBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10.00,
      ),
      borderSide: BorderSide(
          color: const Color(0xff4873a6).withOpacity(0.7), width: 1.0),
    );
  }
}

_setFillColor() {
  return Colors.white;
}

_setPadding() {}
