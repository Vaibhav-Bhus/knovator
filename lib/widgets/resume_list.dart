import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knovator/providers/resume_provider.dart';
import 'package:provider/provider.dart';


class ResumeList extends StatelessWidget {
  const ResumeList({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);

    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        resumeProvider.reorderItems(oldIndex, newIndex);
      },
      children: List.generate(resumeProvider.resumeItems.length, (index) {
        log(resumeProvider.resumeItems.length.toString());
        return ResumeItemModelTile(
          index: index,
          key: ValueKey(resumeProvider.resumeItems[index]),
        );
      }),
    );
  }
}

class ResumeItemModelTile extends StatelessWidget {
  final int index;

  const ResumeItemModelTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final resumeItemModel = resumeProvider.resumeItems[index];
    return ListTile(
      key: ValueKey(resumeItemModel),
      title: Text(resumeItemModel.title),
      subtitle: Text(resumeItemModel.content),
      onTap: () {
        context.go('/', extra: index);
        
      },
    );
  }
}
