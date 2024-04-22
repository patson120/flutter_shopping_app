

abstract class ProductService{
  Future<void> getProducts({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,}
  );

  Future<void> getProductsTop({
    String? category,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,}
  );

  Future<void> addToCart({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,}
  );

  Future<void> getCarts({
    int? userId,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,}
  );
}