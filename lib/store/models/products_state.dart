class ProductsState {
  final List products;
  final bool isLoading;

  factory ProductsState.initial() {
    return ProductsState(
      isLoading: false,
      products: [],
    );
  }

  ProductsState({this.products = const [], this.isLoading = false});

  ProductsState copyWith({List products}) {
    return new ProductsState(
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  String toString() {
    return 'ProductsState{isLoading: $isLoading, count: $products}';
  }
}
