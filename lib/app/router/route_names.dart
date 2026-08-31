// Centralized route name constants.
// Why: Prevent hard-coded route strings from being repeated throughout the application.
class RouteNames {
  RouteNames._();

  static const login = '/login';

  static const home = '/home';

  static const products = '/products';

  static const productDetails = '/products/:id';

  static const orders = '/orders';

  static const orderDetails = '/orders/:id';

  static const profile = '/profile';
}
