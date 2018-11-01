import 'dart:async';
import 'package:online_store/utils/cart.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  static Map _initAuth = {'isAuth': false, 'user': null, 'apiToken': null};

  final _authenticateController = StreamController<Map>();

  Sink<Map> get login => _authenticateController.sink;

  final _logoutController = StreamController<String>();

  Sink<String> get logout => _logoutController.sink;

  // final _itemCount = new BehaviorSubject<int>(seedValue: 0);

  // Stream<int> get itemCount => _itemCount.stream;

  final _auth = new BehaviorSubject<Map>(seedValue: _initAuth);

  Observable<Map> get auth => _auth.stream;

  AuthBloc() {
    _logoutController.stream.listen(_logout);
    _authenticateController.stream.listen(_login);
  }

  void _login(Map form) {
    if (form['mobile'] == '09033509651' && form['password'] == '123456') {
      _initAuth = {
        'isAuth': true,
        'user': {'name': 'محمد امیر محمدی', 'title': 'برنامه نویس وب و موبایل'},
        'apiToken': null
      };
      _auth.add(_initAuth);
    }
  }

  void _logout(String str) {
    _initAuth = {'isAuth': false, 'user': null, 'apiToken': null};
    _auth.add(_initAuth);
  }
}
