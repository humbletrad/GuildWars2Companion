import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guildwars2_companion/utils/urls.dart';

class CompanionHeader extends StatelessWidget {

  final Color color;
  final Color foregroundColor;
  final Widget child;
  final bool includeBack;
  final String wikiName;
  final bool includeShadow;

  CompanionHeader({
    @required this.child,
    this.color = Colors.red,
    this.foregroundColor = Colors.white,
    this.includeBack = false,
    this.includeShadow = true,
    this.wikiName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          if (includeShadow)
            BoxShadow(
              color: Colors.black38,
              blurRadius: 8.0,
            ),
        ],
      ),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          if (includeBack)
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Material(
                    color: Colors.transparent,
                    child: BackButton(
                      color: foregroundColor,
                    ),
                  ),
                ),
              ),
            ),
          if (wikiName != null)
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.wikipediaW,
                        color: foregroundColor,
                        size: 20.0,
                      ),
                      onPressed: () => Urls.launchUrl('https://wiki.guildwars2.com/index.php?search=${wikiName.replaceAll(' ', '+')}'),
                    ),
                  )
                ),
              ),
            ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 14.0),
              child: child,
            )
          ),
        ],
      )
    );
  }
}