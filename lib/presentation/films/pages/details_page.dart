import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_test/application/index.dart';
import 'package:tmdb_test/tools/index.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = 'details_page';
  const DetailsPage({Key? key}) : super(key: key);

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint(state.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilmsCubit, FilmsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FilmsStandardState) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: AppColors.primaryColor,
                title: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text('Detalles'),
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      state.selectedFilm!.name,
                      style: AppStyle.mediumBlackText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      state.selectedFilm!.description,
                      style: AppStyle.regularBlackText,
                    ),
                  )
                ],
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
