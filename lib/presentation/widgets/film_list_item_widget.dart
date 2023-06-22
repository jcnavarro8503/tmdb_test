import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tmdb_test/domain/index.dart';
import 'package:tmdb_test/tools/index.dart';

class FilmListItemWidget extends StatefulWidget {
  final FilmEntity film;
  final String? baseLogoPath;
  final String? baseImagesPath;
  final double padding;
  final OnTap? showDetails;

  const FilmListItemWidget({
    Key? key,
    required this.film,
    this.baseLogoPath = '',
    this.baseImagesPath = '',
    this.padding = 0,
    this.showDetails,
  }) : super(key: key);

  @override
  FilmListItemWidgetState createState() => FilmListItemWidgetState();
}

class FilmListItemWidgetState extends State<FilmListItemWidget> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        if (widget.showDetails != null) {
          widget.showDetails!();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.padding,
          right: widget.padding,
          bottom: widget.padding + 10,
          left: widget.padding,
        ),
        child: Card(
          elevation: 5,
          color: AppColors.lightColor,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(5),
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              leading: Container(
                width: size.width * .2,
                height: size.width * .2,
                color: AppColors.lightColor,
                child: widget.film.posterPath.isNotEmpty
                    ? FadeInImage(
                        image:
                            NetworkImage('${AppEndpoints.tmdbMediaBase}${widget.film.posterPath}'),
                        placeholder: const AssetImage('assets/no_image.jpg'),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/no_image.jpg',
                        fit: BoxFit.cover,
                      ),
              ),
              title: Text(
                widget.film.title,
                style: AppStyle.mediumBlackText,
              ),
              subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.film.releaseDate,
                        style: AppStyle.regularBlackText,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          widget.film.overview,
                          style: AppStyle.smallBlackText,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Icons.group),
                                const SizedBox(width: 3),
                                Text(widget.film.popularity.toString()),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Icons.line_axis),
                                const SizedBox(width: 3),
                                Text(widget.film.voteAverage.toString()),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Icons.thumb_up),
                                const SizedBox(width: 3),
                                Text(widget.film.voteCount.toString()),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
