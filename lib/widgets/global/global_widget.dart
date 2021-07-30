import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setting_goals/widgets/auth/auth_widget.dart';
import 'package:setting_goals/widgets/global/bloc/global_state_cubit.dart';
import 'package:setting_goals/widgets/load/load_widget.dart';
import 'package:setting_goals/widgets/loading/loading_widget.dart';
import 'package:setting_goals/widgets/navigation/navigation_widget.dart';

class GlobalWidget extends StatefulWidget {
  const GlobalWidget({Key? key}) : super(key: key);

  @override
  _GlobalWidgetState createState() => _GlobalWidgetState();
}

class _GlobalWidgetState extends State<GlobalWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // onGenerateRoute: (settings) {
      //   final argument = settings.arguments;

      //   if (settings.name == '/') {
      //     return MaterialPageRoute(
      //       builder: (context) => const ProfilePage(),
      //     );
      //   }

      //   if (settings.name == '/schedulePage') {
      //     return MaterialPageRoute(
      //       builder: (context) => SchedulePage(scheduleModel: argument as ScheduleModel),
      //     );
      //   }

      //   return null;
      // },

      home: BlocProvider(
        create: (_) => GlobalStateCubit(),
        child: BlocBuilder<GlobalStateCubit, GlobalState>(
          builder: (context, state) {
            switch (state) {
              case GlobalState.Loading:
                return const LoadingWidget();
              case GlobalState.Preload:
                return const LoadWidget();
              case GlobalState.EmptyAuth:
                return const AuthWidget();
              case GlobalState.Loaded:
                return const NavigationWidget();
            }
          },
        ),
      ),
    );
  }
}
