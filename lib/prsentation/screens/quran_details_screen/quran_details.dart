import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/core/assets_manager.dart';
import 'package:test1/prsentation/screens/home/tabs/quran_tabs/quran_tabs.dart';
import 'package:test1/prsentation/screens/quran_details_screen/widgets/verses_widget.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraItem suraItem = ModalRoute.of(context)?.settings.arguments as SuraItem;
    if (verses.isEmpty) readQuranFile(suraItem.index + 1);
    return Stack(
      children: [
        Image.asset(AssetsManager.mainBgLight),
        Scaffold(
            appBar: AppBar(
              title: Text(suraItem.suraNames),
            ),
            body: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) =>
                        VersesWidget(verse: verses[index]),
                    itemCount: verses.length)),
      ],
    );
  }

  void readQuranFile(int index) async {
    String fileContent = await rootBundle.loadString('assets/files/$index.txt');

    setState(() {
      verses = fileContent.trim().split('\n');
    });
  }
}
