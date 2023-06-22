import 'package:flutter/material.dart';
import 'package:tmdb_test/presentation/index.dart';
import 'package:tmdb_test/tools/index.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder? builder, RouteSettings? settings})
      : super(builder: builder!, settings: settings!);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse) {
      return super.buildTransitions(context, animation, secondaryAnimation, child);
    }
    return FadeTransition(opacity: animation, child: child);
  }
}

MaterialPageRoute getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.detailsRoute:
      return MyCustomRoute(
        builder: (_) => const DetailsPage(),
        settings: settings,
      );

    default:
      return MyCustomRoute(
        builder: (_) => const FilmsPage(),
        settings: settings,
      );
  }
}
