import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_test/application/index.dart';
import 'package:tmdb_test/presentation/index.dart';
import 'package:tmdb_test/tools/index.dart';

class FilmsPage extends StatefulWidget {
  static const routeName = 'fimls_page';
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
          if (state.selectedFilm != null) {
            Navigator.of(context).pushNamed(AppRoutes.detailsRoute);
          }
        }
      },
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
                  child: Text('Películas'),
                ),
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  context.read<FilmsCubit>().getFilms();
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.fimls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FilmListItemWidget(
                      film: state.fimls[index],
                      showDetails: () {
                        context.read<FilmsCubit>().showDetails(state.fimls[index].id);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
