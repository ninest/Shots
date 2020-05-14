import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/components/settings/on_off_toggle.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/providers/settings_provider.dart';
import 'package:shots/src/services/sound_service.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, child) => ScrollableTemplate(
        title: AppStrings.settingsRouteTitle,
        children: <Widget>[
          IgnorePointer(
            ignoring: !SoundService.available,
            child: Opacity(
              opacity:
                  SoundService.available ? 1 : Values.disabledButtonOpacity,
              child: OnOffToggle(
                title: "Audio",
                enabled: provider.audio,
                // toggle
                onTap: () => provider.audio ^= true,
              ),
            ),
          ).sliver(),
          OnOffToggle(
            title: "Nsfw content",
            enabled: provider.nsfw,
            // toggle
            onTap: () => provider.nsfw ^= true,
          ).sliver(),
        ],
      ).scaffold(),
    );
  }
}
