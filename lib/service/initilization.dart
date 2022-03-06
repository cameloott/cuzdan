import 'package:flutter/material.dart';
import 'package:cuzdan/core/constant/enum/preferences_keys_enum.dart';
import 'package:cuzdan/core/init/memory/preferences_manager.dart';
import 'package:cuzdan/ui/home/home_view.dart';

Widget initiator() {
  int isFirstEntry = PreferencesManager.instance.getIntVal(PreferencesKeys.IS_FIRST_ENTRY);
  if (isFirstEntry == -1) {
    PreferencesManager.instance.setIntVal(PreferencesKeys.IS_FIRST_ENTRY, 0);
    return HomeView();
  } else {
    return HomeView();
  }
}
