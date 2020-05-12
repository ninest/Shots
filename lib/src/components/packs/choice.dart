import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/models/pack_model.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/services/sound_service.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class Choice extends StatelessWidget {
  const Choice({Key key, @required this.pack}) : super(key: key);
  final Pack pack;

  @override
  Widget build(BuildContext context) {
    // to check if pack is selected or unselected
    PacksProvider packsProvider =
        Provider.of<PacksProvider>(context, listen: true);
    bool selected = packsProvider.packSelected(pack);

    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: Values.durationMs),
        padding: EdgeInsets.all(Values.mainPadding * .67),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Values.borderRadius),
          border: Border.all(
            // erased width change so buttons won't move on click
            width: 2,
            color: selected ? AppColors.accent : AppColors.pageBorderColor,
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
                    pack.name,
                    // if NSFW, make it red
                    style: pack.nsfw
                        ? TextStyles.packName.c(AppColors.danger)
                        : TextStyles.packName,

                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${pack.cards.length} cards",
                  style: TextStyles.body1.s(0.8 * Values.em),
                ),
              ],
            ),
            SizedBox(height: Values.mainPadding / 2),
            Text(pack.description, style: TextStyles.packDescription),
          ],
        ),
      ),
      onTap: () {
        packsProvider.toggle(pack);
        // play pop button sound
        SoundService.pop(secondary: true);
      },
    );
  }
}
