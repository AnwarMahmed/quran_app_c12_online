import 'package:flutter/material.dart';
import 'package:test1/prsentation/screens/home/tabs/hadith_tabs/hadith_tabs.dart';

class HadithTitleWidget extends StatelessWidget {
  Hadith hadith;

  HadithTitleWidget({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        child: Center(
            child: Text(
          hadith.title,
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
    );
  }
}
