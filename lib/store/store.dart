// import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:redux/redux.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:online_store/store/models/app_state.dart';
// import 'package:online_store/store/reducers/app_reducer.dart';
// import 'package:redux_logging/redux_logging.dart';

// Future<Store<AppState>> createStore() async {
//   var prefs = await SharedPreferences.getInstance();

//   return Store(
//     appReducer,
//     initialState: AppState.initial(),
//     distinct: true,
//     middleware: [
      
//     ],
//   );
// }
