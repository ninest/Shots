import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/components/settings/on_off_toggle.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/providers/settings_provider.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // not listening because Hive (and valueListenableBuilder) rebuilds everything for us
    SettingsProvider settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);

    return ScrollableTemplate(
      showBackButton: true,
      title: AppStrings.settingsRouteTitle,
      children: <Widget>[
        OnOffToggle(
          title: AppStrings.nsfw,
          enabled: settingsProvider.nsfw,
          onTap: () {
            SettingsProvider settingsProvider =
                Provider.of<SettingsProvider>(context, listen: false);
            if (settingsProvider.nsfw)
              SettingsService.disableNsfw();
            else
              SettingsService.enableNsfw();
          },
        ).sliver(),
        explanation(AppStrings.nsfwExplanation),

        // extra spacing required to differentiate sections
        SizedBox(height: Values.mainPadding * 2).sliver(),

        OnOffToggle(
          title: AppStrings.highPerformance,
          enabled: settingsProvider.highPerformanceAnimation,
          onTap: () {
            SettingsProvider settingsProvider =
                Provider.of<SettingsProvider>(context, listen: false);
            if (settingsProvider.highPerformanceAnimation)
              SettingsService.disableHighPerformanceAnimations();
            else
              SettingsService.enableHighPerformanceAnimations();
          },
        ).sliver(),
        explanation(AppStrings.performanceExplanation),

        // extra spacing required to differentiate sections
        SizedBox(height: Values.mainPadding * 2).sliver(),
      ],
    ).scaffold();
  }

  Widget explanation(String text) {
    return MarkdownBody(
      data: text,
      styleSheet: MarkdownStyleSheet(
        p: TextStyles.settingExplanation,
      ),
    ).sliver();
  }
}
