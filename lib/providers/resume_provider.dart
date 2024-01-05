import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:knovator/models/resume_item_model.dart';

class ResumeProvider extends ChangeNotifier {
  final List<ResumeItemModel> resumeItems = [];

  void addItem(ResumeItemModel item) {
    resumeItems.add(item);
    log(resumeItems.length.toString());
    notifyListeners();
  }

  void updateItem(int index, ResumeItemModel newItem) {
    resumeItems[index] = newItem;
    notifyListeners();
  }

  void deleteItem(int index) {
    resumeItems.removeAt(index);
    notifyListeners();
  }

  void reorderItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = resumeItems.removeAt(oldIndex);
    resumeItems.insert(newIndex, item);
    notifyListeners();
  }
}
