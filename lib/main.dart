import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyectos_flutter/calculadora_bloc/bloc/calculadora/calculadora_bloc.dart';
import 'package:proyectos_flutter/calculadora_bloc/page/calculadora_bloc_page.dart';
import 'package:proyectos_flutter/calculadora_cubit/bloc/calculadora/calculadora_cubit.dart';
import 'package:proyectos_flutter/calculadora_cubit/page/calculadora_cubit_page.dart';
import 'package:proyectos_flutter/calculadora_getx/page/calculadora_getx_page.dart';
import 'package:proyectos_flutter/calculadora_singleton/page/calculadora_singleton_page.dart';
import 'package:proyectos_flutter/firebase_options.dart';

import 'package:proyectos_flutter/bordes_radius_preview_app/page/bordes_radius_preview_page.dart';
import 'package:proyectos_flutter/calculadora_provider/page/calculadora_page.dart';
import 'package:proyectos_flutter/christmas_lights/page/christmas_lights_page.dart';
import 'package:proyectos_flutter/color_cycle/page/color_cycle_page.dart';
import 'package:proyectos_flutter/count_down_timer/page/count_down_timer_page.dart';
import 'package:proyectos_flutter/count_down_timer/provider/count_down_provider.dart';
import 'package:proyectos_flutter/image_effects/page/image_effects_page.dart';
import 'package:proyectos_flutter/image_effects/provider/image_effects_provider.dart';
import 'package:proyectos_flutter/note_app/page/nota_editar_page.dart';
import 'package:proyectos_flutter/note_app/page/notes_app_page.dart';
import 'package:proyectos_flutter/note_app/service/note_service.dart';
import 'package:proyectos_flutter/pomodoro/page/pomodoro_page.dart';
import 'package:proyectos_flutter/pomodoro/service/pomodoro_service.dart';
import 'package:proyectos_flutter/practica_rapidez_crud/page/practica_page.dart';
import 'package:proyectos_flutter/practica_rapidez_crud/service/practica_service.dart';
import 'package:proyectos_flutter/slider/page/slider_page.dart';
import 'package:proyectos_flutter/squiz_app/page/squiz_app_page.dart';
import 'package:proyectos_flutter/validation_form/page/validation_form_page.dart';
import 'package:proyectos_flutter/validation_form/provider/login_provider.dart';
import 'calculadora_provider/service/calculadora_service.dart';

void main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  // await Preferences.init();
  await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
          );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculadoraService()),
        ChangeNotifierProvider(create: (_) => CountDownProvider()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => ImageEffectsProvider()),
        ChangeNotifierProvider(create: (_) => NoteService()),
        ChangeNotifierProvider(create: (_) => PomodoroService()),
        ChangeNotifierProvider(create: (_) => PracticaService()),
      ],
      child: const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: ( _ ) =>  CalculadoraCubit() ),
         BlocProvider(create: ( _ ) =>  CalculadoraBlocService() )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "practica_app",
        routes: {
          "christma_lights": ( _ ) => const ChristmasLightsPage(),
          "bordes_radius_preview": ( _ ) => const BordesRadiusPreviewPage(),
          "calculadora_provider": ( _ ) => const CalculadoraProviderPage(),
          "calculadora_cubit": ( _ ) =>  const CalculadoraCubitPage(),
          "calculadora_bloc": ( _ ) =>  const CalculadoraBlocPage(),
          "calculadora_getx": ( _ ) =>  CalculadoraGetXPage(),
          "calculadora_singleton": ( _ ) =>  const CalculadoraSingletonPage(),
          "color_cycle": ( _ ) => const ColorCyclePage(),
          "count_down_timer": ( _ ) =>  CountDownTimerPage(),
          "image_effects": ( _ ) =>  ImageEffectsPage(),
          "validation_form": ( _ ) =>  ValidationFormPage(),
          "slider": ( _ ) =>  const SliderPage(),
          //ruta de una sola app
          "note_app": ( _ ) =>  const NoteAppPage(),
          "nota_editar": ( _ ) =>  const NotaEditionPage(),
          //ruta de una sola app
          "pomodoro": ( _ ) =>  const PomodoroPage(),
          "squiz_app": ( _ ) =>  const SquizAppPage(),
          "practica_app": ( _ ) =>  const PracticaCRUDPage(),
        },
      ),
    );
  }
}
