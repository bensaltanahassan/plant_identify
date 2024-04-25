class AppLinks {
  // server
  // static const String server = "http://10.0.2.2:5000";
  static const String server = "https://backend-ecommerce-i4gg.onrender.com";
  static const String image = "$server/media";

  // test
  static const String test = "$server/test.php";

  //=============Images Network==============
  static const String imageCategories = "$image/categories";
  static const String imageItems = "$image/items";

  //=============Auth==============
  static const String signup = "$server/auth/signup";
  static const String verifycodesignup = "$server/auth/verifycode";
  static const String login = "$server/auth/login";
  static const String sendVerificationCode = "$server/auth/sendverifycode";

  //=============Password============
  static const String forgetpassword = "$server/auth/forgetpassword";
  static const String verifycodeforgetpassword = "$server/auth/verifycode";
  static const String resetpassword = "$server/auth/resetpassword";

  //=============Home============
  static const String homepage = "$server/home";

  //=============Categories============
  static const String categories = "$server/categories";

  //=============Products=================
  static const String products = "$server/products";

  //=============Search Products=================
  static const String search = "$server/products/search";

  //=============Favoris=================
  static const String favoris = "$server/favoris";

  //=============Cart=================
  static const String cart = "$server/cart";

  //=============Address=================
  static const String address = "$server/address";

  //=============Orders=================
  static const String orders = "$server/orders";

  //=============Coupons=================
  static const String coupons = "$server/coupons";

  //=============Coupons=================
  static const String checkout = "$server/checkout";

  //Settings
  static const String changeEmail = "$server/settings/changeemail";
  static const String changePhone = "$server/settings/changephone";
  static const String changePassword = "$server/settings/changepassword";
  static const String deleteAccount = "$server/settings/deleteaccount";
}
