
import 'package:flutter/material.dart';

class ColumnInfo extends StatelessWidget {
  const ColumnInfo({super.key, required this.title, required this.info, this.infoStyle});
  final String title;
  final String? info;
  final TextStyle? infoStyle;
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return info == null
        ? const SizedBox()
        : Column(
            children: [
              Text(
                title,
                style: styleText.bodySmall,
              ),
              SelectableText(
                info!,
                style: infoStyle ?? styleText.titleMedium,
              ),
              const SizedBox(height: 20),
            ],
          );
  }
}