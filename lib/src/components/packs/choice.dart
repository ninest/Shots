import 'package:flutter/material.dart';

import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/services/sound_service.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class Choice extends StatelessWidget {
  const Choice({Key key, this.index, this.provider}) : super(key: key);
  final PacksProvider provider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Values.animationDuration,
        margin: const EdgeInsets.only(bottom: Values.mainPadding * .5),
        padding: const EdgeInsets.all(Values.mainPadding * .67),
        decoration: BoxDecoration(
          color: AppColors.choiceCard,
          borderRadius: BorderRadius.circular(Values.borderRadius),
          border: Border.all(
            // erased width change so buttons won't shake on click
            width: Values.borderWidth,
            color: provider.selected.contains(index)
                ? AppColors.acceptColor
                : AppColors.borderColor.withOpacity(Values.borderOpacity),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // Expand to get whole available space
                Expanded(
                  child: Text(
                    provider.all[index].name,
                    // if NSFW, make it red
                    style: provider.all[index].nsfw
                        ? TextStyles.packName.c(AppColors.rejectColor)
                        : TextStyles.packName,

                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${provider.all[index].cards.length} cards",
                  style: TextStyles.body1.s(0.8 * Values.em),
                ),
              ],
            ),
            SizedBox(height: Values.mainPadding * .5),
            Text(provider.all[index].description,
                style: TextStyles.packDescription),
          ],
        ),
      ),
      onTap: () {
        provider.toggle(index);
        // play pop button sound
        SoundService.pop(secondary: true);
      },
    );
  }
}
