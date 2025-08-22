import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4e6629),
      surfaceTint: Color(0xff4e6629),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcfeda1),
      onPrimaryContainer: Color(0xff374d14),
      secondary: Color(0xff236488),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc8e6ff),
      onSecondaryContainer: Color(0xff004c6d),
      tertiary: Color(0xff8b5023),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdcc6),
      onTertiaryContainer: Color(0xff6e390d),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff1a1c16),
      onSurfaceVariant: Color(0xff45483d),
      outline: Color(0xff75786c),
      outlineVariant: Color(0xffc5c8b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb4d088),
      primaryFixed: Color(0xffcfeda1),
      onPrimaryFixed: Color(0xff121f00),
      primaryFixedDim: Color(0xffb4d088),
      onPrimaryFixedVariant: Color(0xff374d14),
      secondaryFixed: Color(0xffc8e6ff),
      onSecondaryFixed: Color(0xff001e2e),
      secondaryFixedDim: Color(0xff93cdf6),
      onSecondaryFixedVariant: Color(0xff004c6d),
      tertiaryFixed: Color(0xffffdcc6),
      onTertiaryFixed: Color(0xff311300),
      tertiaryFixedDim: Color(0xffffb786),
      onTertiaryFixedVariant: Color(0xff6e390d),
      surfaceDim: Color(0xffdadbd0),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e9),
      surfaceContainer: Color(0xffeeefe3),
      surfaceContainerHigh: Color(0xffe8e9de),
      surfaceContainerHighest: Color(0xffe2e3d8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff273c03),
      surfaceTint: Color(0xff4e6629),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5c7537),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003a55),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff357398),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff592900),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9c5e30),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff10120c),
      onSurfaceVariant: Color(0xff34372d),
      outline: Color(0xff505448),
      outlineVariant: Color(0xff6b6e62),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb4d088),
      primaryFixed: Color(0xff5c7537),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff455c21),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff357398),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff145a7e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9c5e30),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7f461b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6c7bc),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e9),
      surfaceContainer: Color(0xffe8e9de),
      surfaceContainerHigh: Color(0xffddded2),
      surfaceContainerHighest: Color(0xffd1d2c7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1e3200),
      surfaceTint: Color(0xff4e6629),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff395016),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003046),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004e70),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4a2100),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff713b10),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2d23),
      outlineVariant: Color(0xff474b3f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb4d088),
      primaryFixed: Color(0xff395016),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff243901),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004e70),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003650),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff713b10),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff542600),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb8baaf),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f2e6),
      surfaceContainer: Color(0xffe2e3d8),
      surfaceContainerHigh: Color(0xffd4d5ca),
      surfaceContainerHighest: Color(0xffc6c7bc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb4d088),
      surfaceTint: Color(0xffb4d088),
      onPrimary: Color(0xff223600),
      primaryContainer: Color(0xff374d14),
      onPrimaryContainer: Color(0xffcfeda1),
      secondary: Color(0xff93cdf6),
      onSecondary: Color(0xff00344c),
      secondaryContainer: Color(0xff004c6d),
      onSecondaryContainer: Color(0xffc8e6ff),
      tertiary: Color(0xffffb786),
      onTertiary: Color(0xff502400),
      tertiaryContainer: Color(0xff6e390d),
      onTertiaryContainer: Color(0xffffdcc6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff12140e),
      onSurface: Color(0xffe2e3d8),
      onSurfaceVariant: Color(0xffc5c8b9),
      outline: Color(0xff8f9285),
      outlineVariant: Color(0xff45483d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e3d8),
      inversePrimary: Color(0xff4e6629),
      primaryFixed: Color(0xffcfeda1),
      onPrimaryFixed: Color(0xff121f00),
      primaryFixedDim: Color(0xffb4d088),
      onPrimaryFixedVariant: Color(0xff374d14),
      secondaryFixed: Color(0xffc8e6ff),
      onSecondaryFixed: Color(0xff001e2e),
      secondaryFixedDim: Color(0xff93cdf6),
      onSecondaryFixedVariant: Color(0xff004c6d),
      tertiaryFixed: Color(0xffffdcc6),
      onTertiaryFixed: Color(0xff311300),
      tertiaryFixedDim: Color(0xffffb786),
      onTertiaryFixedVariant: Color(0xff6e390d),
      surfaceDim: Color(0xff12140e),
      surfaceBright: Color(0xff383a32),
      surfaceContainerLowest: Color(0xff0d0f09),
      surfaceContainerLow: Color(0xff1a1c16),
      surfaceContainer: Color(0xff1e2019),
      surfaceContainerHigh: Color(0xff292b23),
      surfaceContainerHighest: Color(0xff33362e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc9e69c),
      surfaceTint: Color(0xffb4d088),
      onPrimary: Color(0xff192a00),
      primaryContainer: Color(0xff7f9957),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbae1ff),
      onSecondary: Color(0xff00293d),
      secondaryContainer: Color(0xff5c97bd),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd4b9),
      onTertiary: Color(0xff401c00),
      tertiaryContainer: Color(0xffc68050),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff12140e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdecf),
      outline: Color(0xffb0b3a5),
      outlineVariant: Color(0xff8f9284),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e3d8),
      inversePrimary: Color(0xff384f15),
      primaryFixed: Color(0xffcfeda1),
      onPrimaryFixed: Color(0xff0a1400),
      primaryFixedDim: Color(0xffb4d088),
      onPrimaryFixedVariant: Color(0xff273c03),
      secondaryFixed: Color(0xffc8e6ff),
      onSecondaryFixed: Color(0xff00131f),
      secondaryFixedDim: Color(0xff93cdf6),
      onSecondaryFixedVariant: Color(0xff003a55),
      tertiaryFixed: Color(0xffffdcc6),
      onTertiaryFixed: Color(0xff210b00),
      tertiaryFixedDim: Color(0xffffb786),
      onTertiaryFixedVariant: Color(0xff592900),
      surfaceDim: Color(0xff12140e),
      surfaceBright: Color(0xff43453d),
      surfaceContainerLowest: Color(0xff060804),
      surfaceContainerLow: Color(0xff1c1e17),
      surfaceContainer: Color(0xff262921),
      surfaceContainerHigh: Color(0xff31332c),
      surfaceContainerHighest: Color(0xff3c3f37),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffddfaae),
      surfaceTint: Color(0xffb4d088),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb0cc84),
      onPrimaryContainer: Color(0xff060e00),
      secondary: Color(0xffe3f2ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff8fc9f2),
      onSecondaryContainer: Color(0xff000d16),
      tertiary: Color(0xffffece3),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffb17c),
      onTertiaryContainer: Color(0xff180700),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff12140e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeff1e2),
      outlineVariant: Color(0xffc1c4b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e3d8),
      inversePrimary: Color(0xff384f15),
      primaryFixed: Color(0xffcfeda1),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb4d088),
      onPrimaryFixedVariant: Color(0xff0a1400),
      secondaryFixed: Color(0xffc8e6ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff93cdf6),
      onSecondaryFixedVariant: Color(0xff00131f),
      tertiaryFixed: Color(0xffffdcc6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb786),
      onTertiaryFixedVariant: Color(0xff210b00),
      surfaceDim: Color(0xff12140e),
      surfaceBright: Color(0xff4f5148),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1e2019),
      surfaceContainer: Color(0xff2f312a),
      surfaceContainerHigh: Color(0xff3a3c34),
      surfaceContainerHighest: Color(0xff45483f),
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


  List<ExtendedColor> get extendedColors => [
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
