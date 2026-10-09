import 'package:flutter/material.dart';

class AppTheme {
  // Cores de alto contraste e acessibilidade para o público 50+
  // Cor principal: Laranja (cor do botão entrar)
  static const Color primaryColor = Color(0xFFFF6F00); 
  // Cor secundária: Verde (verde de saúde/confiança)
  static const Color secondaryColor = Color(0xFF1B5E20); 
  static const Color accentColor = Color(0xFFFF6F00); 
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color surfaceColor = Colors.white;
  static const Color textColor = Color(0xFF111111);
  static const Color subtitleColor = Color(0xFF555555);
  static const Color errorColor = Color(0xFFC62828);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'Roboto',
      
      // Tipografia ampliada e clara para leituras confortáveis (Lei de Miller & Foco no Conteúdo)
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: textColor, height: 1.3),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textColor, height: 1.3),
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor, height: 1.3),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textColor, height: 1.3),
        bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: textColor, height: 1.4), // Texto base maior (18px)
        bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: subtitleColor, height: 1.4),
        labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5),
      ),

      // Botões grandes atendendo à Lei de Fitts (Zona do Polegar e alvos fáceis)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 60), // Altura generosa para toque fácil
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),

      // Campos de texto grandes e claros (Lei de Postel e Foco no Conteúdo)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor, width: 2.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: errorColor, width: 2.0),
        ),
        labelStyle: const TextStyle(fontSize: 16, color: subtitleColor, fontWeight: FontWeight.w500),
        hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
