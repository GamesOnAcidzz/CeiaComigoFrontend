import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4a5f00),
      surfaceTint: Color(0xff506600),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5f7900),
      onPrimaryContainer: Color(0xffe7ffa0),
      secondary: Color(0xff576335),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd8e6ac),
      onSecondaryContainer: Color(0xff5b6739),
      tertiary: Color(0xff006532),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff058142),
      onTertiaryContainer: Color(0xffd7ffdb),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffafaec),
      onSurface: Color(0xff1b1c14),
      onSurfaceVariant: Color(0xff454838),
      outline: Color(0xff757967),
      outlineVariant: Color(0xffc5c8b3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3128),
      inversePrimary: Color(0xffb4d25b),
      primaryFixed: Color(0xffcfef74),
      onPrimaryFixed: Color(0xff161f00),
      primaryFixedDim: Color(0xffb4d25b),
      onPrimaryFixedVariant: Color(0xff3b4d00),
      secondaryFixed: Color(0xffdbe9af),
      onSecondaryFixed: Color(0xff161f00),
      secondaryFixedDim: Color(0xffbfcd95),
      onSecondaryFixedVariant: Color(0xff404b20),
      tertiaryFixed: Color(0xff91f8ac),
      onTertiaryFixed: Color(0xff00210c),
      tertiaryFixedDim: Color(0xff75db92),
      onTertiaryFixedVariant: Color(0xff005227),
      surfaceDim: Color(0xffdbdbce),
      surfaceBright: Color(0xfffafaec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e7),
      surfaceContainer: Color(0xffefefe1),
      surfaceContainerHigh: Color(0xffe9e9db),
      surfaceContainerHighest: Color(0xffe3e3d6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2d3b00),
      surfaceTint: Color(0xff506600),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5d7600),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff303a10),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff667242),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003f1d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff007e40),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffafaec),
      onSurface: Color(0xff10120a),
      onSurfaceVariant: Color(0xff343829),
      outline: Color(0xff515443),
      outlineVariant: Color(0xff6b6f5d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3128),
      inversePrimary: Color(0xffb4d25b),
      primaryFixed: Color(0xff5d7600),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff485c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff667242),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4e592c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff007e40),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006230),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc7c7ba),
      surfaceBright: Color(0xfffafaec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e7),
      surfaceContainer: Color(0xffe9e9db),
      surfaceContainerHigh: Color(0xffddded0),
      surfaceContainerHighest: Color(0xffd2d2c5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff243000),
      surfaceTint: Color(0xff506600),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3d4f00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff263007),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff424e22),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003417),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005529),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffafaec),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2e1f),
      outlineVariant: Color(0xff474b3b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3128),
      inversePrimary: Color(0xffb4d25b),
      primaryFixed: Color(0xff3d4f00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2a3700),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff424e22),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2c370d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005529),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003b1b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb9baad),
      surfaceBright: Color(0xfffafaec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f2e4),
      surfaceContainer: Color(0xffe3e3d6),
      surfaceContainerHigh: Color(0xffd5d5c8),
      surfaceContainerHighest: Color(0xffc7c7ba),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb4d25b),
      surfaceTint: Color(0xffb4d25b),
      onPrimary: Color(0xff283500),
      primaryContainer: Color(0xff5f7900),
      onPrimaryContainer: Color(0xffe7ffa0),
      secondary: Color(0xffbfcd95),
      onSecondary: Color(0xff2a340b),
      secondaryContainer: Color(0xff424d22),
      onSecondaryContainer: Color(0xffb1be87),
      tertiary: Color(0xff75db92),
      onTertiary: Color(0xff003919),
      tertiaryContainer: Color(0xff058142),
      onTertiaryContainer: Color(0xffd7ffdb),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff12140c),
      onSurface: Color(0xffe3e3d6),
      onSurfaceVariant: Color(0xffc5c8b3),
      outline: Color(0xff8f937f),
      outlineVariant: Color(0xff454838),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d6),
      inversePrimary: Color(0xff506600),
      primaryFixed: Color(0xffcfef74),
      onPrimaryFixed: Color(0xff161f00),
      primaryFixedDim: Color(0xffb4d25b),
      onPrimaryFixedVariant: Color(0xff3b4d00),
      secondaryFixed: Color(0xffdbe9af),
      onSecondaryFixed: Color(0xff161f00),
      secondaryFixedDim: Color(0xffbfcd95),
      onSecondaryFixedVariant: Color(0xff404b20),
      tertiaryFixed: Color(0xff91f8ac),
      onTertiaryFixed: Color(0xff00210c),
      tertiaryFixedDim: Color(0xff75db92),
      onTertiaryFixedVariant: Color(0xff005227),
      surfaceDim: Color(0xff12140c),
      surfaceBright: Color(0xff383a31),
      surfaceContainerLowest: Color(0xff0d0f08),
      surfaceContainerLow: Color(0xff1b1c14),
      surfaceContainer: Color(0xff1f2018),
      surfaceContainerHigh: Color(0xff292b22),
      surfaceContainerHighest: Color(0xff34362c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc9e96f),
      surfaceTint: Color(0xffb4d25b),
      onPrimary: Color(0xff1f2900),
      primaryContainer: Color(0xff7f9b2a),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd5e3a9),
      onSecondary: Color(0xff1f2902),
      secondaryContainer: Color(0xff899663),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff8bf2a6),
      onTertiary: Color(0xff002d13),
      tertiaryContainer: Color(0xff3ba360),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff12140c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdec8),
      outline: Color(0xffb1b49f),
      outlineVariant: Color(0xff8f927f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d6),
      inversePrimary: Color(0xff3c4e00),
      primaryFixed: Color(0xffcfef74),
      onPrimaryFixed: Color(0xff0d1300),
      primaryFixedDim: Color(0xffb4d25b),
      onPrimaryFixedVariant: Color(0xff2d3b00),
      secondaryFixed: Color(0xffdbe9af),
      onSecondaryFixed: Color(0xff0d1300),
      secondaryFixedDim: Color(0xffbfcd95),
      onSecondaryFixedVariant: Color(0xff303a10),
      tertiaryFixed: Color(0xff91f8ac),
      onTertiaryFixed: Color(0xff001506),
      tertiaryFixedDim: Color(0xff75db92),
      onTertiaryFixedVariant: Color(0xff003f1d),
      surfaceDim: Color(0xff12140c),
      surfaceBright: Color(0xff44453c),
      surfaceContainerLowest: Color(0xff060803),
      surfaceContainerLow: Color(0xff1d1e16),
      surfaceContainer: Color(0xff272920),
      surfaceContainerHigh: Color(0xff32332a),
      surfaceContainerHighest: Color(0xff3d3f35),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdcfd80),
      surfaceTint: Color(0xffb4d25b),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb0ce58),
      onPrimaryContainer: Color(0xff080d00),
      secondary: Color(0xffe8f6bb),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbbc991),
      onSecondaryContainer: Color(0xff080d00),
      tertiary: Color(0xffc0ffcb),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff71d78e),
      onTertiaryContainer: Color(0xff000f04),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff12140c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeff2dc),
      outlineVariant: Color(0xffc1c5af),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d6),
      inversePrimary: Color(0xff3c4e00),
      primaryFixed: Color(0xffcfef74),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb4d25b),
      onPrimaryFixedVariant: Color(0xff0d1300),
      secondaryFixed: Color(0xffdbe9af),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbfcd95),
      onSecondaryFixedVariant: Color(0xff0d1300),
      tertiaryFixed: Color(0xff91f8ac),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff75db92),
      onTertiaryFixedVariant: Color(0xff001506),
      surfaceDim: Color(0xff12140c),
      surfaceBright: Color(0xff4f5147),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f2018),
      surfaceContainer: Color(0xff2f3128),
      surfaceContainerHigh: Color(0xff3b3c33),
      surfaceContainerHighest: Color(0xff46483e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(0xffffa93e),
    value: Color(0xffffa93e),
    light: ColorFamily(
      color: Color(0xff885200),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffa93e),
      onColorContainer: Color(0xff6d4100),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff885200),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffa93e),
      onColorContainer: Color(0xff6d4100),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff885200),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffa93e),
      onColorContainer: Color(0xff6d4100),
    ),
    dark: ColorFamily(
      color: Color(0xffffcf9d),
      onColor: Color(0xff482900),
      colorContainer: Color(0xffffa93e),
      onColorContainer: Color(0xff6d4100),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffcf9d),
      onColor: Color(0xff482900),
      colorContainer: Color(0xffffa93e),
      onColorContainer: Color(0xff6d4100),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffcf9d),
      onColor: Color(0xff482900),
      colorContainer: Color(0xffffa93e),
      onColorContainer: Color(0xff6d4100),
    ),
  );

  /// Custom Color 2
  static const customColor2 = ExtendedColor(
    seed: Color(0xff94dfff),
    value: Color(0xff94dfff),
    light: ColorFamily(
      color: Color(0xff006782),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff94dfff),
      onColorContainer: Color(0xff00647f),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff006782),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff94dfff),
      onColorContainer: Color(0xff00647f),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff006782),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff94dfff),
      onColorContainer: Color(0xff00647f),
    ),
    dark: ColorFamily(
      color: Color(0xffe0f4ff),
      onColor: Color(0xff003545),
      colorContainer: Color(0xff94dfff),
      onColorContainer: Color(0xff00647f),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffe0f4ff),
      onColor: Color(0xff003545),
      colorContainer: Color(0xff94dfff),
      onColorContainer: Color(0xff00647f),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffe0f4ff),
      onColor: Color(0xff003545),
      colorContainer: Color(0xff94dfff),
      onColorContainer: Color(0xff00647f),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    customColor1,
    customColor2,
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
