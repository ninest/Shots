import 'package:flutter/material.dart';
import 'package:shots/app/styles/colors.dart';
import 'package:shots/app/styles/values.dart';

class PackChoice extends StatelessWidget {
  final String name;
  final String filename;
  final bool selected;
  PackChoice({this.name, this.filename, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(Values.mainPadding / 1.5),
        margin: EdgeInsets.only(bottom: Values.mainPadding),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Values.borderRadius),
          border: Border.all(
            width: selected ? 2 : 1,
            color: selected ? Theme.of(context).accentColor : AppColors.pageBorderColor,
          ),
        ),
        child: Text(name),
      ),

      onTap: () {
        
      },
    );
  }
}
