import 'package:flutter/material.dart';
import 'package:test1/core/color_manager.dart';
class VersesWidget extends StatelessWidget {
  String verse;
   VersesWidget({super.key,required this.verse});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
        child: Text(verse,textDirection: TextDirection.rtl,textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodyMedium)
      ),
    );

  }
}
