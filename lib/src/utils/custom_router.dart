import 'package:bobtail_cuisines/src/custom_widgets/bobtail_text_widgets/bobtail_bold_black_text.dart';
import 'package:bobtail_cuisines/src/screens/cuisines/cuisine_view.dart';
import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case CuisineView.id:
        return MaterialPageRoute(builder: (_) => const CuisineView());
      default:
        _errorRoute(setting.name);
    }
  }

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              backgroundColor: BobtailCustomColors.backgroundColor,
              appBar: AppBar(title: const BobtailBoldBlackText('NO ROUTE')),
              body: Center(
                child: BobtailBoldBlackText('NO ROUT DEFINED $name'),
              ),
            ));
  }
}
