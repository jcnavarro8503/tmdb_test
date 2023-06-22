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
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<FilmsCubit, FilmsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FilmsStandardState) {
          return WillPopScope(
            onWillPop: () async {
              context.read<FilmsCubit>().getFilms();
              return true;
            },
            child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: AppColors.primaryColor,
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(state.selectedFilm.title),
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      state.selectedFilm.releaseDate,
                      style: AppStyle.bigBlackText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: size.width,
                      color: AppColors.lightColor,
                      child: state.selectedFilm.posterPath.isNotEmpty
                          ? FadeInImage(
                              image: NetworkImage(
                                  '${AppEndpoints.tmdbMediaBase}${state.selectedFilm.posterPath}'),
                              placeholder: const AssetImage('assets/no_image.jpg'),
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/no_image.jpg',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.group),
                              const SizedBox(width: 3),
                              Text(state.selectedFilm.popularity.toString()),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.line_axis),
                              const SizedBox(width: 3),
                              Text(state.selectedFilm.voteAverage.toString()),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.thumb_up),
                              const SizedBox(width: 3),
                              Text(state.selectedFilm.voteCount.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      state.selectedFilm.overview,
                      style: AppStyle.regularBlackText,
                    ),
                  )
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
