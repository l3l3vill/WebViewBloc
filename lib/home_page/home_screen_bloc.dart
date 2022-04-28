import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreenBloc extends Bloc {


  // final streamSCToUserData = StreamController<UserData>();
  // Sink<UserData> get sinkToUserData => streamSCToUserData.sink;
  // Stream<UserData> get streamToUserData => streamSCToUserData.stream;

  HomeScreenBloc({ bool? rememberBox}) : super(null) {
    if (kDebugMode) {
      print("[BLOC] HomeScreenBloc");
    }
  }

  dispose() {
  }
}
