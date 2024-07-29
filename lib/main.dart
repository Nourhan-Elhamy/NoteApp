
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/utils/app_theme.dart';
import 'package:todoapp/features/onboarding/views/onboarding_screen.dart';
import 'package:todoapp/features/regester/presentation/controller/theme_controller.dart';
import 'features/home/presentation/controller/home_controller.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("settingsBox");

  runApp(
     MultiProvider( providers: [
       ChangeNotifierProvider(create:(c)=>ThemeProvider()),
       ChangeNotifierProvider(create:(c)=>HomeProvider()),
     ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false).setSwitchValueFromHive();
    return MaterialApp(
      theme: AppTheme().lightThemeData,
      themeMode: Provider.of<ThemeProvider>(context).switchValue==false?ThemeMode.light:ThemeMode.dark,
      darkTheme: AppTheme().darkThemeData,
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen()
    );
  }
}
