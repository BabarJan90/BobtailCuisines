import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BobtailFormBuidler extends FormBuilder {
  const BobtailFormBuidler({
    Key? key,
    required Widget child,
    void Function()? onChanged,
    AutovalidateMode? autovalidateMode,
    Future<bool> Function()? onWillPop,
    Map<String, dynamic> initialValue = const <String, dynamic>{},
    bool skipDisabled = false,
    bool enabled = true,
  }) : super(
          key: key,
          child: child,
          autovalidateMode: autovalidateMode,
          initialValue: initialValue,
          enabled: enabled,
          onChanged: onChanged,
          onWillPop: onWillPop,
          skipDisabled: skipDisabled,
        );

  @override
  BobtailFormBuidlerState createState() => BobtailFormBuidlerState();
}

class BobtailFormBuidlerState extends FormBuilderState {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: super.build(context),
    );
  }
}
