class Urls{
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String verifyEmail(String email) => '$baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) => '$baseUrl/VerifyLogin/$email/$otp';
  static String getHomeSlider = '$baseUrl/ListProductSlider';
  static String getCategoryData = '$baseUrl/CategoryList';
  static String getProductsByRemarks(String remarks) => '$baseUrl/ListProductByRemark/$remarks';
}