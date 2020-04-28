import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/providers/settings_provider.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // not listening because Hive (and valueListenableBuilder) rebuilds everything
    // for us
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context, listen: false);

    return ScrollableTemplate(
      showBackButton: true,
      title: Strings.settingsRouteTitle,
      children: <Widget>[
        OnOffToggle(
          title: "NSFW",
          enabled: settingsProvider.nsfw,
        ).sliver()
      ],
    ).scaffold();
  }
}

class OnOffToggle extends StatelessWidget {
  const OnOffToggle({Key key, this.title, this.enabled = false}) : super(key: key);
  final String title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: Values.mainPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text(title), Text(enabled ? "On" : "Off")],
        ),
      ),
      onTap: () {
        SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
        if (settingsProvider.nsfw)
          SettingsService.disableNsfw();
        else
          SettingsService.enableNsfw();
      },
    );
  }
}
