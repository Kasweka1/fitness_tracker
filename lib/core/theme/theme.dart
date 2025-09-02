import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1976d2), // Medium blue from image
      surfaceTint: Color(0xff1976d2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbbdefb), // Light blue from image
      onPrimaryContainer: Color(0xff0d47a1),
      secondary: Color(0xff42a5f5), // Lighter blue from image
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe3f2fd),
      onSecondaryContainer: Color(0xff01579b),
      tertiary: Color(0xff2e3440), // Dark blue-grey from image
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc1c9d4),
      onTertiaryContainer: Color(0xff1a1f29),
      error: Color(0xffd32f2f),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffebee),
      onErrorContainer: Color(0xff801f1f),
      surface: Color(0xfff8fafe), // Very light blue-white
      onSurface: Color(0xff1a1f29),
      onSurfaceVariant: Color(0xff424850),
      outline: Color(0xff72787f),
      outlineVariant: Color(0xffc2c8cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3440),
      inversePrimary: Color(0xff90caf9),
      primaryFixed: Color(0xffbbdefb),
      onPrimaryFixed: Color(0xff0d47a1),
      primaryFixedDim: Color(0xff90caf9),
      onPrimaryFixedVariant: Color(0xff1565c0),
      secondaryFixed: Color(0xffe3f2fd),
      onSecondaryFixed: Color(0xff01579b),
      secondaryFixedDim: Color(0xffb3e5fc),
      onSecondaryFixedVariant: Color(0xff0277bd),
      tertiaryFixed: Color(0xffc1c9d4),
      onTertiaryFixed: Color(0xff1a1f29),
      tertiaryFixedDim: Color(0xffa5b2be),
      onTertiaryFixedVariant: Color(0xff252a35),
      surfaceDim: Color(0xffdee6f0),
      surfaceBright: Color(0xfff8fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f7fc),
      surfaceContainer: Color(0xffecf1f6),
      surfaceContainerHigh: Color(0xffe6ebf0),
      surfaceContainerHighest: Color(0xffe0e5ea),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1565c0),
      surfaceTint: Color(0xff1976d2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2196f3),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff0277bd),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4fc3f7),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff252a35),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff545b68),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffc62828),
      onError: Color(0xffffffff),
      errorContainer: Color(0xfff44336),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8fafe),
      onSurface: Color(0xff1a1f29),
      onSurfaceVariant: Color(0xff3e444c),
      outline: Color(0xff5a6068),
      outlineVariant: Color(0xff767c84),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3440),
      inversePrimary: Color(0xff90caf9),
      primaryFixed: Color(0xff2196f3),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1976d2),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4fc3f7),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff29b6f6),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff545b68),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3c424f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdee6f0),
      surfaceBright: Color(0xfff8fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f7fc),
      surfaceContainer: Color(0xffecf1f6),
      surfaceContainerHigh: Color(0xffe6ebf0),
      surfaceContainerHighest: Color(0xffe0e5ea),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0d47a1),
      surfaceTint: Color(0xff1976d2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1565c0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff01579b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff0277bd),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1a1f29),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff252a35),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffb71c1c),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffc62828),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8fafe),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1f252d),
      outline: Color(0xff3e444c),
      outlineVariant: Color(0xff3e444c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3440),
      inversePrimary: Color(0xffc3e9ff),
      primaryFixed: Color(0xff1565c0),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0e4ba8),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff0277bd),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0162a3),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff252a35),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1a1f29),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdee6f0),
      surfaceBright: Color(0xfff8fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f7fc),
      surfaceContainer: Color(0xffecf1f6),
      surfaceContainerHigh: Color(0xffe6ebf0),
      surfaceContainerHighest: Color(0xffe0e5ea),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff90caf9), // Light blue for dark mode
      surfaceTint: Color(0xff90caf9),
      onPrimary: Color(0xff0d47a1),
      primaryContainer: Color(0xff1565c0),
      onPrimaryContainer: Color(0xffbbdefb),
      secondary: Color(0xffb3e5fc),
      onSecondary: Color(0xff01579b),
      secondaryContainer: Color(0xff0277bd),
      onSecondaryContainer: Color(0xffe3f2fd),
      tertiary: Color(0xffa5b2be), // Light blue-grey for dark mode
      onTertiary: Color(0xff1a1f29),
      tertiaryContainer: Color(0xff252a35),
      onTertiaryContainer: Color(0xffc1c9d4),
      error: Color(0xffffab91),
      onError: Color(0xff801f1f),
      errorContainer: Color(0xffc62828),
      onErrorContainer: Color(0xffffebee),
      surface: Color(0xff2e3440), // Dark blue-grey from image
      onSurface: Color(0xffe0e5ea),
      onSurfaceVariant: Color(0xffc2c8cf),
      outline: Color(0xff8c9299),
      outlineVariant: Color(0xff424850),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e5ea),
      inversePrimary: Color(0xff1976d2),
      primaryFixed: Color(0xffbbdefb),
      onPrimaryFixed: Color(0xff0d47a1),
      primaryFixedDim: Color(0xff90caf9),
      onPrimaryFixedVariant: Color(0xff1565c0),
      secondaryFixed: Color(0xffe3f2fd),
      onSecondaryFixed: Color(0xff01579b),
      secondaryFixedDim: Color(0xffb3e5fc),
      onSecondaryFixedVariant: Color(0xff0277bd),
      tertiaryFixed: Color(0xffc1c9d4),
      onTertiaryFixed: Color(0xff1a1f29),
      tertiaryFixedDim: Color(0xffa5b2be),
      onTertiaryFixedVariant: Color(0xff252a35),
      surfaceDim: Color(0xff101113), // Darkest blue-grey from image
      surfaceBright: Color(0xff363a46),
      surfaceContainerLowest: Color(0xff0b0d0f),
      surfaceContainerLow: Color(0xff181c24),
      surfaceContainer: Color(0xff1c2028),
      surfaceContainerHigh: Color(0xff262a32),
      surfaceContainerHighest: Color(0xff31353d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff94cefd),
      surfaceTint: Color(0xff90caf9),
      onPrimary: Color(0xff003c6b),
      primaryContainer: Color(0xff5393c1),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb7e9ff),
      onSecondary: Color(0xff004c6b),
      secondaryContainer: Color(0xff7caec4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa9b6c2),
      onTertiary: Color(0xff0f1419),
      tertiaryContainer: Color(0xff6f7c89),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffb59d),
      onError: Color(0xff5a1a00),
      errorContainer: Color(0xffe57368),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff2e3440),
      onSurface: Color(0xfff8fafe),
      onSurfaceVariant: Color(0xffc6ccd3),
      outline: Color(0xff9ea4ab),
      outlineVariant: Color(0xff7e848b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e5ea),
      inversePrimary: Color(0xff1667c1),
      primaryFixed: Color(0xffbbdefb),
      onPrimaryFixed: Color(0xff003052),
      primaryFixedDim: Color(0xff90caf9),
      onPrimaryFixedVariant: Color(0xff0e4ba8),
      secondaryFixed: Color(0xffe3f2fd),
      onSecondaryFixed: Color(0xff003d56),
      secondaryFixedDim: Color(0xffb3e5fc),
      onSecondaryFixedVariant: Color(0xff00628a),
      tertiaryFixed: Color(0xffc1c9d4),
      onTertiaryFixed: Color(0xff0a0e13),
      tertiaryFixedDim: Color(0xffa5b2be),
      onTertiaryFixedVariant: Color(0xff1f2429),
      surfaceDim: Color(0xff101113),
      surfaceBright: Color(0xff363a46),
      surfaceContainerLowest: Color(0xff0b0d0f),
      surfaceContainerLow: Color(0xff181c24),
      surfaceContainer: Color(0xff1c2028),
      surfaceContainerHigh: Color(0xff262a32),
      surfaceContainerHighest: Color(0xff31353d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff8fbff),
      surfaceTint: Color(0xff90caf9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff94cefd),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff8fbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb7e9ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff8fbff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa9b6c2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffb59d),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff2e3440),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff8fbff),
      outline: Color(0xffc6ccd3),
      outlineVariant: Color(0xffc6ccd3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e5ea),
      inversePrimary: Color(0xff002c52),
      primaryFixed: Color(0xffc0e3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff94cefd),
      onPrimaryFixedVariant: Color(0xff003c6b),
      secondaryFixed: Color(0xffe8f6ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb7e9ff),
      onSecondaryFixedVariant: Color(0xff004c6b),
      tertiaryFixed: Color(0xffc5cdd8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa9b6c2),
      onTertiaryFixedVariant: Color(0xff0f1419),
      surfaceDim: Color(0xff101113),
      surfaceBright: Color(0xff363a46),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff181c24),
      surfaceContainer: Color(0xff1c2028),
      surfaceContainerHigh: Color(0xff262a32),
      surfaceContainerHighest: Color(0xff31353d),
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
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
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