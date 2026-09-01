// Centralized route name constants.
// Why: Prevent hard-coded route strings from being repeated throughout the application.
class RouteNames {
  RouteNames._();
  static const web_splash = '/splashscreen';
  static const login = '/login';

  static const home = '/homepage';

  static const products = '/products';

  static const productDetails = '/products/:id';

  static const orders = '/orders';

  static const orderDetails = '/orders/:id';

  static const profile = '/profile';
  static const account = '/account';
  static const bottomnavigation = '/bottomnavigation';

}
