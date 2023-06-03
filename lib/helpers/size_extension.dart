import 'dart:ui' as ui;

final double screenWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
final double screenHeight = ui.window.physicalSize.height / ui.window.devicePixelRatio;

extension SizerExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * screenHeight / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * screenWidth / 100;

  double get size => this * screenWidth / 420 ;
}
