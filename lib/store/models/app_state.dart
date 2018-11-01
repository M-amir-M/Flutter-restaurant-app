class AppState {
  final int count;
  final bool isLoading;
  final products;
  final cartProducts;

  AppState({
    this.count,
    this.isLoading,
    this.products,
    this.cartProducts,
  });

  factory AppState.initial() {
    return AppState(
      count: 0,
      isLoading: false,
      products: [],
      cartProducts: [],
    );
  }

  AppState copyWith({
    int count,
    bool isLoading,
    List products = const [],
    List cartProducts = const [],
  }) {
    return new AppState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }

  @override
  String toString() {
    return 'AppState{cartProducts: , products :}';
  }
}
