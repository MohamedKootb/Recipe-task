import 'package:flutter/material.dart';

/// Wrap your material app with this widget to ensure proper sizing
class AppSizerInitializer extends StatelessWidget {
  final Widget child;
  const AppSizerInitializer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    AppSizer._initialize(context);
    return child;
  }
}

class AppSizer {
  // Change the default size to your design screen size
  static const _defaultSize = Size(393, 852);

  final BuildContext _context;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _scaleText;
  static late double _textScaleFactor;

  AppSizer._initialize(this._context) {
    final size = MediaQuery.sizeOf(_context);
    _screenWidth = size.width;
    _screenHeight = size.height;
    _scaleText = _screenWidth / _defaultSize.width;
    _textScaleFactor = MediaQuery.textScalerOf(_context).scale(1.0);
  }

  static Future<void> ensureScreenSize() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.deferFirstFrame();

    await Future.doWhile(() {
      final window = binding.platformDispatcher.implicitView;

      if (window == null || window.physicalSize.isEmpty) {
        return Future.delayed(const Duration(milliseconds: 10), () => true);
      }

      return false;
    });

    binding.allowFirstFrame();
  }
}

extension Responsive on num {
  double get w {
    return this / AppSizer._defaultSize.width * AppSizer._screenWidth;
  }

  double get h {
    return this / AppSizer._defaultSize.height * AppSizer._screenHeight;
  }

  double get fromWidth => this / 100 * AppSizer._screenWidth;

  double get fromHeight => this / 100 * AppSizer._screenHeight;

  double get sp => this * AppSizer._scaleText * AppSizer._textScaleFactor;
}
