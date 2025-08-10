import 'package:flutter/material.dart';

import '../theming/app_sizer.dart';
import 'app_text.dart';

class RetryTile extends StatelessWidget {
  final String errorMessage;
  final VoidCallback retryMethod;
  const RetryTile({
    super.key,
    required this.errorMessage,
    required this.retryMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: AppText(errorMessage)),
          SizedBox(height: 12.h),
          ElevatedButton(onPressed: retryMethod, child: const Text('Retry')),
        ],
      ),
    );
  }
}
