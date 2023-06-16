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

class TagModalBottomSheet extends ConsumerWidget {
  const TagModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(tagNotifierProvider.notifier).watchTags();
      return null;
    }, []);

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
      body: ref.watch(tagNotifierProvider).maybeWhen(
            loadInProgress: (tags) => const CircularProgressIndicator(),
            loadSuccess: (tags) => ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 0.1),
              itemCount: tags.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final tag = tags[index];
                return CheckboxListTile(
                  activeColor: $styles.primaryThemeColor,
                  checkboxShape: const CircleBorder(),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (_) {
                    ref.read(storyFormNotifierProvider.notifier).toggleTag(tag);
                  },
                  value: ref.watch(storyFormNotifierProvider
                      .select((value) => value.selectedTags.contains(tag))),
                  title: Row(
                    children: [
                      Text(tag.title),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () => ref
                            .read(tagNotifierProvider.notifier)
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
  const TagActionAlertDialog({Key? key}) : super(key: key);

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
                .read(tagNotifierProvider.notifier)
                .addTag(controller.value.text);
            context.router.pop();
          },
          child: const Text('DONE'),
        ),
      ],
    );
  }
}
