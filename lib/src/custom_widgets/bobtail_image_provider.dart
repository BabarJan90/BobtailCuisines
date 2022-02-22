import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'bobtail_cuisine_placeholder.dart';

class BobtailImageProvider extends StatelessWidget {
  final String? url;
  final BoxFit boxFit;
  final PlaceholderWidgetBuilder? placeholderWidgetBuilder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final LoadingErrorWidgetBuilder? errorWidgetBuilder;
  final int fadeDurationInMilliseconds;

  const BobtailImageProvider({
    this.url,
    Key? key,
    this.boxFit = BoxFit.cover,
    this.placeholderWidgetBuilder,
    this.progressIndicatorBuilder,
    this.fadeDurationInMilliseconds = 0,
    this.errorWidgetBuilder,
  })  : assert(placeholderWidgetBuilder == null || progressIndicatorBuilder == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(url != null || placeholderWidgetBuilder != null);
    if (url == null) return placeholderWidgetBuilder!(context, '' /*NOT USING IT*/);
    return CachedNetworkImage(
      fit: boxFit,
      imageUrl: url!,
      fadeInDuration: Duration(milliseconds: fadeDurationInMilliseconds),
      fadeOutDuration: Duration(milliseconds: fadeDurationInMilliseconds),
      placeholder: _loader,
      progressIndicatorBuilder: progressIndicatorBuilder,
      errorWidget: errorWidgetBuilder ?? (context, url, error) => const BobtailCuisinePlaceholder(),
    );
  }

  Widget _loader(BuildContext context, String url) {
    return const Center(
      child: CircularProgressIndicator(
        color: BobtailCustomColors.darkYellow,
      ),
    );
  }
}
