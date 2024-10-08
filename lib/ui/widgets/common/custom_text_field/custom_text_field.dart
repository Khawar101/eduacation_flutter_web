// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../common/ui_helpers.dart';
import 'custom_text_field_model.dart';

class CustomTextField extends StackedView<CustomTextFieldModel> {
  TextAlign? textAlign;
  List<TextInputFormatter>? inputFormaters;
  void Function(String)? onChanged;

  // WidgetShape? shape;

  // WidgetPadding? padding;

  // WidgetVariant? variant;

  // WidgetFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  double? height;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  bool number = true;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  String? titleText;

  bool? isMandate;

  String? validationText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;
  var initialValue;

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
  CustomTextField({
    super.key,
    //   this.shape,
    // this.padding,
    // this.variant,
    // this.fontStyle,
    this.alignment,
    this.width,
    this.height,
    this.margin,
    this.controller,
    this.focusNode,
    this.number = true,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.titleText,
    this.isMandate,
    this.validationText,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.hintStyle,
    this.inputFormaters,
    this.initialValue,
    this.textAlign,
    this.onChanged,
    FormFieldValidator<String>? validator,
  });

  @override
  Widget builder(
    BuildContext context,
    CustomTextFieldModel viewModel,
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
  CustomTextFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomTextFieldModel();
  _buildTextFormFieldWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText.toString(),
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  )
                ],
              )
            : Container(),
        verticalSpaceTiny,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: width ?? double.infinity,
          margin: margin,
          child: TextFormField(
            onChanged: onChanged,
            onTap: onTap,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            focusNode: focusNode,
            style: _setFontStyle(),
            obscureText: isObscureText!,
            textAlign: textAlign ?? TextAlign.start,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            maxLines: maxLines ?? 1,
            decoration: _buildDecoration(),
            initialValue: initialValue,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
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
      filled: true,
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

  _setFillColor() {
    return Colors.white;
  }

  _setPadding() {
    return const EdgeInsets.symmetric(horizontal: 10, vertical: 14.5);
  }
}
