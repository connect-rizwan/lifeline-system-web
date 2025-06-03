import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'screens/app_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/home_screen.dart';
import 'screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Lifeline Tags',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF2563EB),
                brightness: Brightness.light,
              ),
              textTheme: GoogleFonts.interTextTheme(),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF2563EB),
                brightness: Brightness.dark,
              ),
              textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
              useMaterial3: true,
            ),
            themeMode: themeProvider.themeMode,
            routerConfig: _router,
          );
        },
      ),
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SelectableRegion(
        selectionControls: MaterialTextSelectionControls(),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => SelectableRegion(
          selectionControls: MaterialTextSelectionControls(),
          child: const ProductsScreen()),
    ),
    GoRoute(
      path: '/app',
      builder: (context, state) => SelectableRegion(
          selectionControls: MaterialTextSelectionControls(),
          child: const AppScreen()),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => SelectableRegion(
          selectionControls: MaterialTextSelectionControls(),
          child: const ContactScreen()),
    ),
  ],
);
