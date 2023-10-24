class Urls{
  static const String baseUrl = 'https://ecom-api.teamrabbil.com/api';
  static String verifyEmail(String email) => '$baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) => '$baseUrl/VerifyLogin/$email/$otp';
  static String getHomeSlider = '$baseUrl/ListProductSlider';
  static String getCategoryData = '$baseUrl/CategoryList';
  static String getProductCategoryById(int categoryId) => '$baseUrl/ListProductByCategory/$categoryId';
  static String getProductsByRemarks(String remarks) => '$baseUrl/ListProductByRemark/$remarks';
  static String getProductDetails(int productId) => '$baseUrl/ProductDetailsById/$productId';
  static String addToCart = '$baseUrl/CreateCartList';
  static String getCartList = '$baseUrl/CartList';
}