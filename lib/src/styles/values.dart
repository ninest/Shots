class Values {
  /// Basic font size, used in search boxes and buttons mainly
  static double get em => 19;

  /// Padding used when a specified padding is not known
  static double get mainPadding => 31;

  /// button padding
  static double get buttonHorizontalPadding => 15.0;
  static double get buttonVerticalPadding => 13.0;

  /// Border radius to use app-wide
  static double get borderRadius => 8.0;

  /// opacity uses app-wide
  static double get containerOpacity => 0.3;

  // animation duration in milliseconds (for inputs like selectables or toggles)
  static int get durationMs => 200;

  // for any disabled items (buttons, text)
  static double get disabledOpacity => 0.4;
}
