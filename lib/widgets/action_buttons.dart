import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        final loading = state is PostLoadingState;
        final bloc = context.read<PostBloc>();
        return Wrap(
          spacing: 12,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: loading ? null : () => bloc.add(PostLoadEvent()),
              icon: const Icon(Icons.download),
              label: const Text('Жүктеу'),
            ),
            OutlinedButton.icon(
              onPressed: loading ? null : () => bloc.add(PostClearEvent()),
              icon: const Icon(Icons.delete_outline),
              label: const Text('Тазалау'),
            ),
          ],
        );
      },
    );
  }
}
