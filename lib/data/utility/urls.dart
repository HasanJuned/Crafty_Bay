class Urls{
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String verifyEmail(String email) => '$baseUrl/UserLogin/$email';
}