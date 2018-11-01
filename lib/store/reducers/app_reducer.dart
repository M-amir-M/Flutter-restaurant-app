import 'package:online_store/store/models/app_state.dart';
import 'package:online_store/store/reducers/counter_reducer.dart';
import 'package:online_store/store/reducers/products_reducer.dart';
import 'package:online_store/store/reducers/cart_reducer.dart';

AppState appReducer (AppState state,action){
  return new AppState(
    isLoading: false,
    count: counterReducer(state.count,action),
    products: productsReducer(state.products,action),
    cartProducts: cartReducer(state.cartProducts,action),
  );
}