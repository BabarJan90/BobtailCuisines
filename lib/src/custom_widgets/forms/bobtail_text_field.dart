import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BobtailTextField extends StatelessWidget {
  final Key? key;
  final String name; //key for the field
  final String? hintText;
  final bool? enabled;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;

  //Behavioural
  final FormFieldValidator<String>? validator;
  final Function(String?)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final Function()? onTap;
  //Decoration
  final String? errorText;
  final TextStyle? errorTextStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextAlign textAlign;

  final bool isDense;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final AutovalidateMode autovalidateMode;

  const BobtailTextField({
    this.key,
    required this.name,
    required String labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.controller,
    this.initialValue,
    this.errorText,
    this.errorTextStyle,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.focusNode,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.textAlign = TextAlign.start,
    this.isDense = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never,
    TextStyle? labelTextStyle,
    String? helpText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = FormBuilder.of(context);
    assert(state != null, "Could not find the FormBuilder");
    return FormBuilderTextField(
      name: name,
      focusNode: focusNode,
      enabled: enabled ?? true,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      initialValue: initialValue,
      textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign,
      autofocus: false,
      autovalidateMode: autovalidateMode,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onTap: onTap,
      decoration: InputDecoration(
          isDense: isDense,
          hintText: hintText,
          // labelText: labelText,
          suffix: suffix,
          suffixIcon: suffixIcon,
          suffixText: suffixText,
          prefix: prefix,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          errorText: errorText,
          errorStyle: errorTextStyle,
          counterText: '',
          border: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)),
      style: Theme.of(context).textTheme.bodyText1,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
