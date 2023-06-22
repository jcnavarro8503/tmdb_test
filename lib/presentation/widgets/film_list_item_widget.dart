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

    return Padding(
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
            onTap: () => widget.showDetails!,
            contentPadding: const EdgeInsets.all(5),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            title: Text(
              widget.film.name,
              style: AppStyle.mediumBlackText,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                widget.film.description,
                style: AppStyle.smallBlackText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
