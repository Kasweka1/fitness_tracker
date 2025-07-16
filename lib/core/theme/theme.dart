import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff735c0c),
      surfaceTint: Color(0xff735c0c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffe08b),
      onPrimaryContainer: Color(0xff584400),
      secondary: Color(0xff695d3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff2e1bb),
      onSecondaryContainer: Color(0xff50462a),
      tertiary: Color(0xff47664a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc8ecc9),
      onTertiaryContainer: Color(0xff304d34),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff4c4639),
      outline: Color(0xff7e7667),
      outlineVariant: Color(0xffcfc5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe3c46d),
      primaryFixed: Color(0xffffe08b),
      onPrimaryFixed: Color(0xff241a00),
      primaryFixedDim: Color(0xffe3c46d),
      onPrimaryFixedVariant: Color(0xff584400),
      secondaryFixed: Color(0xfff2e1bb),
      onSecondaryFixed: Color(0xff231b04),
      secondaryFixedDim: Color(0xffd5c5a1),
      onSecondaryFixedVariant: Color(0xff50462a),
      tertiaryFixed: Color(0xffc8ecc9),
      onTertiaryFixed: Color(0xff03210b),
      tertiaryFixedDim: Color(0xffadcfae),
      onTertiaryFixedVariant: Color(0xff304d34),
      surfaceDim: Color(0xffe1d9cc),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e5),
      surfaceContainer: Color(0xfff5eddf),
      surfaceContainerHigh: Color(0xfff0e7d9),
      surfaceContainerHighest: Color(0xffeae1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff443400),
      surfaceTint: Color(0xff735c0c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff836a1c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f351b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff786c4d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1f3c24),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff557558),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff141109),
      onSurfaceVariant: Color(0xff3b3629),
      outline: Color(0xff585244),
      outlineVariant: Color(0xff736c5d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe3c46d),
      primaryFixed: Color(0xff836a1c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff685200),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff786c4d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5f5437),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff557558),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3d5c41),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcdc6b9),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e5),
      surfaceContainer: Color(0xfff0e7d9),
      surfaceContainerHigh: Color(0xffe4dcce),
      surfaceContainerHighest: Color(0xffd9d1c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff382a00),
      surfaceTint: Color(0xff735c0c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5b4700),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff342b12),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff53482c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff15321b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff325036),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff312c20),
      outlineVariant: Color(0xff4e493b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe3c46d),
      primaryFixed: Color(0xff5b4700),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff403100),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff53482c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3b3218),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff325036),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1b3921),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbfb8ab),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f0e2),
      surfaceContainer: Color(0xffeae1d4),
      surfaceContainerHigh: Color(0xffdbd3c6),
      surfaceContainerHighest: Color(0xffcdc6b9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe3c46d),
      surfaceTint: Color(0xffe3c46d),
      onPrimary: Color(0xff3d2f00),
      primaryContainer: Color(0xff584400),
      onPrimaryContainer: Color(0xffffe08b),
      secondary: Color(0xffd5c5a1),
      onSecondary: Color(0xff392f15),
      secondaryContainer: Color(0xff50462a),
      onSecondaryContainer: Color(0xfff2e1bb),
      tertiary: Color(0xffadcfae),
      onTertiary: Color(0xff19361f),
      tertiaryContainer: Color(0xff304d34),
      onTertiaryContainer: Color(0xffc8ecc9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff16130b),
      onSurface: Color(0xffeae1d4),
      onSurfaceVariant: Color(0xffcfc5b4),
      outline: Color(0xff989080),
      outlineVariant: Color(0xff4c4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff735c0c),
      primaryFixed: Color(0xffffe08b),
      onPrimaryFixed: Color(0xff241a00),
      primaryFixedDim: Color(0xffe3c46d),
      onPrimaryFixedVariant: Color(0xff584400),
      secondaryFixed: Color(0xfff2e1bb),
      onSecondaryFixed: Color(0xff231b04),
      secondaryFixedDim: Color(0xffd5c5a1),
      onSecondaryFixedVariant: Color(0xff50462a),
      tertiaryFixed: Color(0xffc8ecc9),
      onTertiaryFixed: Color(0xff03210b),
      tertiaryFixedDim: Color(0xffadcfae),
      onTertiaryFixedVariant: Color(0xff304d34),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff3d392f),
      surfaceContainerLowest: Color(0xff110e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff231f17),
      surfaceContainerHigh: Color(0xff2d2a21),
      surfaceContainerHighest: Color(0xff38342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffad980),
      surfaceTint: Color(0xffe3c46d),
      onPrimary: Color(0xff302400),
      primaryContainer: Color(0xffa98e3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffebdbb5),
      onSecondary: Color(0xff2d250c),
      secondaryContainer: Color(0xff9d906e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc2e5c3),
      onTertiary: Color(0xff0e2b15),
      tertiaryContainer: Color(0xff78997a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe5dbc9),
      outline: Color(0xffbab1a0),
      outlineVariant: Color(0xff978f7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff594600),
      primaryFixed: Color(0xffffe08b),
      onPrimaryFixed: Color(0xff171000),
      primaryFixedDim: Color(0xffe3c46d),
      onPrimaryFixedVariant: Color(0xff443400),
      secondaryFixed: Color(0xfff2e1bb),
      onSecondaryFixed: Color(0xff171000),
      secondaryFixedDim: Color(0xffd5c5a1),
      onSecondaryFixedVariant: Color(0xff3f351b),
      tertiaryFixed: Color(0xffc8ecc9),
      onTertiaryFixed: Color(0xff001505),
      tertiaryFixedDim: Color(0xffadcfae),
      onTertiaryFixedVariant: Color(0xff1f3c24),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff49443a),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2b271f),
      surfaceContainerHigh: Color(0xff363229),
      surfaceContainerHighest: Color(0xff423d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffefca),
      surfaceTint: Color(0xffe3c46d),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdfc069),
      onPrimaryContainer: Color(0xff100a00),
      secondary: Color(0xffffefca),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd1c19d),
      onSecondaryContainer: Color(0xff100a00),
      tertiary: Color(0xffd6f9d6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa9cbaa),
      onTertiaryContainer: Color(0xff000f03),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff9efdc),
      outlineVariant: Color(0xffcbc2b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff594600),
      primaryFixed: Color(0xffffe08b),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe3c46d),
      onPrimaryFixedVariant: Color(0xff171000),
      secondaryFixed: Color(0xfff2e1bb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd5c5a1),
      onSecondaryFixedVariant: Color(0xff171000),
      tertiaryFixed: Color(0xffc8ecc9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffadcfae),
      onTertiaryFixedVariant: Color(0xff001505),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff545045),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f17),
      surfaceContainer: Color(0xff343027),
      surfaceContainerHigh: Color(0xff3f3b31),
      surfaceContainerHighest: Color(0xff4b463c),
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
