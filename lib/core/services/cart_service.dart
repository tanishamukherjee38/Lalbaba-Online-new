import 'package:flutter/foundation.dart';

class CartService {
  CartService._();

  // ===========================================================================
  // GLOBAL CART COUNT
  // ===========================================================================

  static final ValueNotifier<int> count =
      ValueNotifier<int>(0);

  static int get currentCount => count.value;

  // ===========================================================================
  // GET CART COUNT
  // ===========================================================================

  /// Future API:
  ///
  /// GET /cart/count
  ///
  /// App open হলে অথবা যেকোনো page থেকে
  /// server cart count load করার জন্য।
  static Future<int> getCartCount() async {
    // =====================================================================
    // TODO: API GET CALL
    // =====================================================================
    //
    // Example later:
    //
    // final response = await ApiService.get('/cart/count');
    //
    // final int serverCount =
    //     response['cart_count'] ?? 0;
    //
    // count.value = serverCount;
    //
    // return serverCount;
    //
    // =====================================================================

    // এখন API নেই।
    // তাই current local count return করছি।
    return count.value;
  }

  // ===========================================================================
  // POST ADD TO CART
  // ===========================================================================

  /// Future API:
  ///
  /// POST /cart/add
  ///
  /// যেকোনো page-এর Add To Cart button থেকে
  /// শুধু এই function call করবে।
  static Future<int> postAddToCart({
    String? productId,
    int quantity = 1,
  }) async {
    if (quantity <= 0) {
      return count.value;
    }

    // =====================================================================
    // TODO: API POST CALL
    // =====================================================================
    //
    // Example later:
    //
    // final response = await ApiService.post(
    //   '/cart/add',
    //   body: {
    //     'product_id': productId,
    //     'quantity': quantity,
    //   },
    // );
    //
    // final int serverCount =
    //     response['cart_count'];
    //
    // count.value = serverCount;
    //
    // return serverCount;
    //
    // =====================================================================

    // এখন শুধু UI / design phase।
    // তাই locally count update করছি।
    count.value += quantity;

    return count.value;
  }

  // ===========================================================================
  // SET COUNT
  // ===========================================================================

  static void setCount(int value) {
    count.value = value < 0 ? 0 : value;
  }

  // ===========================================================================
  // REMOVE FROM CART
  // ===========================================================================

  static Future<int> removeFromCart({
    String? productId,
    int quantity = 1,
  }) async {
    if (quantity <= 0) {
      return count.value;
    }

    // TODO:
    // পরে এখানে DELETE / POST remove cart API বসবে।

    final int newCount =
        count.value - quantity;

    count.value =
        newCount < 0 ? 0 : newCount;

    return count.value;
  }

  // ===========================================================================
  // CLEAR CART
  // ===========================================================================

  static Future<void> clearCart() async {
    // TODO:
    // পরে এখানে clear cart API বসবে।

    count.value = 0;
  }
}