import 'package:bobtail_cuisines/src/custom_widgets/bobtail_image_provider.dart';
import 'package:flutter/material.dart';
import 'bobtail_cuisine_placeholder.dart';

/// If no size given, will expand to fill available space
class BobtailCuisineCircularImage extends StatelessWidget {
  final String? url;
  final double? size;
  final Widget placeholder;

  const BobtailCuisineCircularImage({
    this.url,
    Key? key,
    this.size,
    this.placeholder = const BobtailCuisinePlaceholder(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (size != null) {
      return Container(
        color: Colors.transparent,
        height: size,
        width: size,
        child: _buildInner(context),
      );
    }

    return _buildInner(context);
  }

  Widget _buildInner(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final radius = maxWidth / 2;
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: BobtailImageProvider(
            url: url,
            placeholderWidgetBuilder: (context, url) => placeholder,
            errorWidgetBuilder: (context, url, error) => placeholder,
          ),
        );
      },
    );
  }
}
