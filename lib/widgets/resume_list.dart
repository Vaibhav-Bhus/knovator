import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knovator/providers/resume_provider.dart';
import 'package:knovator/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

class ResumeList extends StatelessWidget {
  const ResumeList({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);

    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        resumeProvider.reorderItems(oldIndex, newIndex);
        customToast('Resume item index changed');
      },
      children: List.generate(resumeProvider.resumeItems.length, (index) {
        debugPrint(resumeProvider.resumeItems.length.toString());
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
    return Dismissible(
      key: ValueKey(resumeItemModel),
      onDismissed: (direction) {
        context.read<ResumeProvider>().deleteItem(index);
      },
      child: ListTile(
        key: ValueKey(resumeItemModel),
        title: Text(resumeItemModel.title),
        subtitle: Text(resumeItemModel.content),
        onTap: () {
          context.go('/', extra: index);
        },
      ),
    );
  }
}
