import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';

Future<T?> showTagModalBottomSheet<T>(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular($styles.corners.md),
      ),
    ),
    context: context,
    builder: (context) => const TagModalBottomSheet(),
  );
}

class TagModalBottomSheet extends ConsumerStatefulWidget {
  const TagModalBottomSheet({
    super.key,
  });

  @override
  ConsumerState<TagModalBottomSheet> createState() =>
      _TagModalBottomSheetState();
}

class _TagModalBottomSheetState extends ConsumerState<TagModalBottomSheet> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(tagFormNotifierProvider.notifier).watchTags());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tags',
          style: $styles.text.bodyBold.copyWith(height: 0),
        ),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const TagActionAlertDialog(),
            ),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: ref.watch(tagFormNotifierProvider).maybeWhen(
            loadInProgress: (tags) => const CircularProgressIndicator(),
            loadSuccess: (tags) => ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 0.1),
              itemCount: tags.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final storyFormState = ref.watch(storyFormNotifierProvider);
                final tag = tags[index];
                return CheckboxListTile(
                  checkboxShape: const CircleBorder(),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (_) {
                    ref.read(storyFormNotifierProvider.notifier).toggleTag(tag);
                  },
                  value: storyFormState.selectedTags.contains(tag),
                  title: Row(
                    children: [
                      Text(tag.title),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () => ref
                            .read(tagFormNotifierProvider.notifier)
                            .deleteTag(tag),
                      ),
                    ],
                  ),
                );
              },
            ),
            orElse: () => const SizedBox.shrink(),
          ),
    );
  }
}

class TagActionAlertDialog extends HookConsumerWidget {
  const TagActionAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return AlertDialog(
      title: Center(
        child: Text('New Tag', style: $styles.text.title1),
      ),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () => context.router.pop(),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(tagFormNotifierProvider.notifier)
                .addTag(controller.value.text);
            context.router.pop();
          },
          child: const Text('DONE'),
        ),
      ],
    );
  }
}
