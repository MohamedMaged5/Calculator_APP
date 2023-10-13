import 'package:calculator1/Data/Cubits/DarkandLightCubit/darklight_cubit.dart';
import 'package:calculator1/Data/Cubits/Showvalues/showvalues_cubit.dart';
import 'package:calculator1/UI/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<DarklightCubit>(
            create: (context) => DarklightCubit(),
          ),
          BlocProvider<ShowvaluesCubit>(
            create: (context) => ShowvaluesCubit(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(392.7, 872.7),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.grey),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          },
        ));
  }
}
