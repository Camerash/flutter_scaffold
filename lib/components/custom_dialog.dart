import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/extensions/widgets.dart';

class DialogButtonData {
  const DialogButtonData({
    required this.text,
    required this.onPressed,
    this.isPrimary = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.title,
    this.content,
    this.actions = const [],
    this.gap = 16,
  });

  final Widget? title;
  final Widget? content;
  final List<DialogButtonData> actions;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.horizontal,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              if (title != null) title!,
              if (content != null) content!,
              if (actions.isNotEmpty)
                Row(
                  children: actions
                      .map((action) {
                        return Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: MaterialStateProperty.all(
                                action.isPrimary
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.grey,
                              ),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: action.onPressed,
                            child: Text(action.text),
                          ),
                        );
                      })
                      .toList()
                      .intersperse(const SizedBox(width: 8)),
                ),
            ].intersperse(SizedBox(height: gap)),
          ),
        ),
      ),
    );
  }
}
