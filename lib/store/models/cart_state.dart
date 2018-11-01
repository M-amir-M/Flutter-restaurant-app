class CartProductsState{
  final List cartProducts;
  final bool isLoading;

  CartProductsState({this.cartProducts,this.isLoading = false});

  CartProductsState copyWith({List products}){
    return new CartProductsState(
      cartProducts: cartProducts ?? this.cartProducts,
      isLoading: isLoading ?? this.isLoading
    );
  }

  @override
	String toString() {
		return 'CartProductsState{isLoading: $isLoading, count: $cartProducts}';
	}
  
}