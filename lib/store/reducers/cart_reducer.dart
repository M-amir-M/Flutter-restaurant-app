import 'package:online_store/store/actions/cart_actions.dart';

List cartReducer(List currentCartProducts, action) {
  if (action is GetInitCartProducts) {
    currentCartProducts = [
      {
        "id": 1,
        "title": "قرمه سبزی",
        "description":
            " شامل گوشت گوساله و برنج ایرانی و روغن زیتون شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
        "price": 10000,
        "quantity": 1,
        "thumbnail": "plate1.png"
      },
      {
        "id": 2,
        "title": "جوجه کباب",
        "description": "شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
        "price": 10000,
        "quantity": 1,
        "thumbnail": "plate2.png"
      },
      {
        "id": 3,
        "title": "فسنجان",
        "description": "شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
        "price": 10000,
        "quantity": 1,
        "thumbnail": "plate3.png"
      },
    ];
    return currentCartProducts;
  } else if (action is GetCartProducts) {
    currentCartProducts = [
      {
        "id": 1,
        "title": "قرمه سبزی",
        "description":
            " شامل گوشت گوساله و برنج ایرانی و روغن زیتون شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
        "price": 10000,
        "quantity": 1,
        "thumbnail": "plate1.png"
      },
      {
        "id": 2,
        "title": "جوجه کباب",
        "description": "شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
        "price": 10000,
        "quantity": 1,
        "thumbnail": "plate2.png"
      },
      {
        "id": 3,
        "title": "فسنجان",
        "description": "شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
        "price": 10000,
        "quantity": 1,
        "thumbnail": "plate3.png"
      },
    ];
    return currentCartProducts;
  } else if (action is AddToCart) {
    var product = action.product;
    bool exist = false;
    int index = -1;
    for (var i = 0; i < currentCartProducts.length; i++) {
      if (product['id'] == currentCartProducts[i]['id']) {
        exist = true;
        index = i;
        currentCartProducts[i]['quantity']++;
        break;
      }
    }
    if (!exist) {
      product['quantity'] = 1;
      currentCartProducts.add(action.product);
    }
    print(action.product);
    return currentCartProducts;
  } else if (action is RemoveFromCart) {
    var product = action.product;
    bool exist = false;
    int index = -1;
    for (var i = 0; i < currentCartProducts.length; i++) {
      if (product['id'] == currentCartProducts[i]['id']) {
        exist = true;
        index = i;
        break;
      }
    }
      if (currentCartProducts[index]['quantity'] > 1) {
        currentCartProducts[index]['quantity']--;
      } else {
        currentCartProducts.removeAt(index);
      }
    return currentCartProducts;
  } else {
    return currentCartProducts;
  }
  // switch (action) {
  //   case GetCartProducts:
  //     return currentCartProducts;
  //   case AddToCart:
  //     print('===========================================');
  //     currentCartProducts.add(action.product);
  //     return currentCartProducts;
  //   default:
  //     return currentCartProducts;
  // }
}
