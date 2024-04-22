

abstract class CategoryService{
  Future<void> getCategories({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,}
  );
}