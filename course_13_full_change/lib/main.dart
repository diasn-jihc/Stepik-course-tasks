import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_13_full/common/app_colors.dart';
import 'package:course_13_full/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:course_13_full/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:course_13_full/locator_service.dart' as di;
  
import 'feature/presentation/pages/person_screen.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
            create: (context) => sl<PersonListCubit>()..loadPerson()),
        BlocProvider<PersonSearchBloc>(
            create: (context) => sl<PersonSearchBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.accent,
            secondary: AppColors.highlight,
            surface: AppColors.cellBackground,
          ),
          scaffoldBackgroundColor: AppColors.mainBackground,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainBackground,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            centerTitle: false,
          ),
          cardTheme: CardThemeData(
            color: AppColors.cellBackground,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.accent),
          dividerColor: const Color(0xFFEDE4DA),
        ),
        home: const HomePage(),
      ),
    );
  }
}
