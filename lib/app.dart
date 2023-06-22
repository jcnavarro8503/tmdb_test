import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tmdb_test/application/index.dart';
import 'package:tmdb_test/presentation/index.dart';
import 'package:tmdb_test/tools/index.dart';

class TmdbApp extends StatefulWidget {
  const TmdbApp({Key? key}) : super(key: key);

  @override
  TmdbAppState createState() => TmdbAppState();
}

class TmdbAppState extends State<TmdbApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FilmsCubit()),
        ],
        child: MaterialApp(
          title: 'TMDB test',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: AppColors.secondaryColor,
            ),
            primaryColor: AppColors.secondaryColor,
          ),
          onGenerateRoute: (RouteSettings settings) => getRoute(settings),
          home: const FilmsPage(),
          supportedLocales: L10n.all,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
      ),
    );
  }
}
