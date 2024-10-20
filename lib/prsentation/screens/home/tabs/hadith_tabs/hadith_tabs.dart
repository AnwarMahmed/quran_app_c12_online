import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/core/assets_manager.dart';
import 'package:test1/prsentation/screens/home/tabs/hadith_tabs/widget/hadith_header_widget.dart';
import 'package:test1/prsentation/screens/home/tabs/hadith_tabs/widget/hadith_title.dart';

class HadithTabs extends StatefulWidget {
  HadithTabs({super.key});

  @override
  State<HadithTabs> createState() => _HadithTabsState();
}

class _HadithTabsState extends State<HadithTabs> {
  List<Hadith> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) readHadithFile();
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 1, child: Image.asset(AssetsManager.hadithHeaderImage)),
          HadithHeaderWidget(),
          Expanded(
              flex: 2,
              child: hadithList.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 3,
                        indent: 15,
                        endIndent: 15,
                      ),
                      itemBuilder: (context, index) =>
                          HadithTitleWidget(hadith: hadithList[index]),
                      itemCount: hadithList.length,
                    ))
        ],
      ),
    );
  }

  void readHadithFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadithItemList = fileContent.trim().split('#');

    for (int i = 0; i < hadithItemList.length; i++) {
      String hadithItem = hadithItemList[i];
      List<String> hadithLines = hadithItem.trim().split('\n');
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      String content = hadithLines.join('\n');
      Hadith hadith = Hadith(title: title, content: content);
      hadithList.add(hadith);
    }

    setState(() {});
  }
}

class Hadith {
  String title;
  String content;

  Hadith({required this.title, required this.content});
}
