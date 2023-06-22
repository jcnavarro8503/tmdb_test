import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_test/application/index.dart';
import 'package:tmdb_test/presentation/index.dart';
import 'package:tmdb_test/tools/index.dart';

class FilmsPage extends StatefulWidget {
  static const routeName = 'films_page';
  const FilmsPage({Key? key}) : super(key: key);

  @override
  FilmsPageState createState() => FilmsPageState();
}

class FilmsPageState extends State<FilmsPage> with WidgetsBindingObserver {
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
      listener: (context, state) {
        debugPrint('################ films state has changed ################');
        debugPrint(state.toString());

        if (state is FilmsStandardState) {
          if (state.selectedFilm.id != 0) {
            Navigator.of(context).pushNamed(AppRoutes.detailsRoute);
          }
        }
      },
      builder: (context, state) {
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
                child: Text('Películas'),
              ),
            ),
            body: (state is FilmsStandardState)
                ? RefreshIndicator(
                    onRefresh: () async {
                      context.read<FilmsCubit>().getFilms();
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.films.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FilmListItemWidget(
                          film: state.films[index],
                          showDetails: () {
                            context.read<FilmsCubit>().showDetails(state.films[index].id);
                          },
                        );
                      },
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
