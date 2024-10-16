import 'package:flutter/material.dart';
import 'package:test1/prsentation/screens/home/tabs/hadith_tabs/hadith_tabs.dart';
import 'package:test1/prsentation/screens/home/tabs/quran_tabs/quran_tabs.dart';
import 'package:test1/prsentation/screens/home/tabs/radio_tabs/radio_tabs.dart';
import 'package:test1/prsentation/screens/home/tabs/sabh_tabs/sabh_tabs.dart';
import 'package:test1/prsentation/screens/home/tabs/settings_tabs/settings_tabs.dart';

import '../../../core/assets_manager.dart';
import '../../../core/color_manager.dart';
import '../../../core/strings_manager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTabs(),
    HadithTabs(),
    SabhTabs(),
    RadioTabs(),
    SettingsTabs()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AssetsManager.mainBgLight))),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.appTitle),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              print(selectedIndex);
              setState(() {});
            },
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: ColorsManager.goldColor,
                  icon: ImageIcon(AssetImage(AssetsManager.hadithIcon)),
                  label: StringsManager.quranLabel),
              BottomNavigationBarItem(
                  backgroundColor: ColorsManager.goldColor,
                  icon: ImageIcon(AssetImage(AssetsManager.quranIcon)),
                  label: StringsManager.hadithLabel),
              BottomNavigationBarItem(
                  backgroundColor: ColorsManager.goldColor,
                  icon: ImageIcon(AssetImage(AssetsManager.sebhaIcon)),
                  label: StringsManager.sebhalabel),
              BottomNavigationBarItem(
                  backgroundColor: ColorsManager.goldColor,
                  icon: ImageIcon(AssetImage(AssetsManager.radioIcon)),
                  label: StringsManager.radioLabel),
              BottomNavigationBarItem(
                  backgroundColor: ColorsManager.goldColor,
                  icon: Icon(Icons.settings),
                  label: StringsManager.settingsLabel)
            ],
          ),
          body: tabs[selectedIndex],
        ));
  }
}
