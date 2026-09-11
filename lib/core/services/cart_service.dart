
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// import 'cart_notification_item.dart';

// class CartService {
//   CartService._();

//   // ===========================================================================
//   // LOCAL STORAGE KEYS
//   // ===========================================================================

//   static const String _cartCountKey =
//       'lalbaba_cart_count';

//   static const String _cartItemsKey =
//       'lalbaba_cart_items';

//   // ===========================================================================
//   // INITIALIZATION
//   // ===========================================================================

//   static bool _isInitialized =
//       false;

//   static Future<void>?
//       _initializingFuture;

//   // ===========================================================================
//   // GLOBAL CART COUNT
//   // ===========================================================================

//   static final ValueNotifier<int>
//       count =
//       ValueNotifier<int>(0);

//   static int get currentCount =>
//       count.value;

//   // ===========================================================================
//   // GLOBAL CART ITEMS
//   // ===========================================================================

//   static final ValueNotifier<
//       List<CartNotificationItem>> items =
//       ValueNotifier<
//           List<CartNotificationItem>>(
//     <CartNotificationItem>[],
//   );

//   static List<CartNotificationItem>
//       get currentItems =>
//           List<CartNotificationItem>
//               .unmodifiable(
//             items.value,
//           );

//   // ===========================================================================
//   // ENSURE LOCAL DATA LOADED
//   // ===========================================================================

//   static Future<void>
//       _ensureInitialized() async {
//     if (_isInitialized) {
//       return;
//     }

//     // Multiple page same time initialize
//     // korleo ekbar-i SharedPreferences
//     // load hobe.
//     _initializingFuture ??=
//         _loadFromLocal();

//     await _initializingFuture;
//   }

//   // ===========================================================================
//   // LOAD FROM LOCAL STORAGE
//   // ===========================================================================

//   static Future<void>
//       _loadFromLocal() async {
//     try {
//       final SharedPreferences prefs =
//           await SharedPreferences
//               .getInstance();

//       // -----------------------------------------------------------------------
//       // SAVED COUNT
//       // -----------------------------------------------------------------------

//       final int savedCount =
//           prefs.getInt(
//                 _cartCountKey,
//               ) ??
//               0;

//       // -----------------------------------------------------------------------
//       // SAVED ITEMS
//       // -----------------------------------------------------------------------

//       final List<String>
//           savedItems =
//           prefs.getStringList(
//                 _cartItemsKey,
//               ) ??
//               <String>[];

//       final List<CartNotificationItem>
//           loadedItems =
//           <CartNotificationItem>[];

//       for (final String rawItem
//           in savedItems) {
//         try {
//           final dynamic decoded =
//               jsonDecode(
//             rawItem,
//           );

//           if (decoded
//               is Map<String, dynamic>) {
//             loadedItems.add(
//               CartNotificationItem
//                   .fromJson(
//                 decoded,
//               ),
//             );
//           } else if (decoded is Map) {
//             loadedItems.add(
//               CartNotificationItem
//                   .fromJson(
//                 Map<String, dynamic>
//                     .from(
//                   decoded,
//                 ),
//               ),
//             );
//           }
//         } catch (error) {
//           debugPrint(
//             'Cart item decode error: $error',
//           );
//         }
//       }

//       items.value =
//           loadedItems;

//       // Normally count saved thakbe.
//       //
//       // Jodi kono reason-e saved count
//       // missing hoy but products thake,
//       // quantity theke count calculate hobe.

//       final int calculatedCount =
//           _calculateTotalQuantity(
//         loadedItems,
//       );

//       count.value =
//           savedCount > 0
//               ? savedCount
//               : calculatedCount;

//       // Jodi stored count ar actual item
//       // quantity mismatch hoy,
//       // item data-ke source of truth
//       // dhorbo.
//       if (loadedItems.isNotEmpty &&
//           calculatedCount !=
//               count.value) {
//         count.value =
//             calculatedCount;

//         await prefs.setInt(
//           _cartCountKey,
//           calculatedCount,
//         );
//       }

//       _isInitialized = true;
//     } catch (error) {
//       debugPrint(
//         'Cart local load error: $error',
//       );

//       _isInitialized = true;
//     }
//   }

//   // ===========================================================================
//   // SAVE ALL DATA LOCALLY
//   // ===========================================================================

//   static Future<void>
//       _saveToLocal() async {
//     try {
//       final SharedPreferences prefs =
//           await SharedPreferences
//               .getInstance();

//       // -----------------------------------------------------------------------
//       // SAVE COUNT
//       // -----------------------------------------------------------------------

//       await prefs.setInt(
//         _cartCountKey,
//         count.value,
//       );

//       // -----------------------------------------------------------------------
//       // SAVE PRODUCT DATA
//       // -----------------------------------------------------------------------

//       final List<String>
//           encodedItems =
//           items.value
//               .map(
//                 (
//                   item,
//                 ) =>
//                     jsonEncode(
//                   item.toJson(),
//                 ),
//               )
//               .toList();

//       await prefs.setStringList(
//         _cartItemsKey,
//         encodedItems,
//       );
//     } catch (error) {
//       debugPrint(
//         'Cart local save error: $error',
//       );
//     }
//   }

//   // ===========================================================================
//   // CALCULATE TOTAL QUANTITY
//   // ===========================================================================

//   static int _calculateTotalQuantity(
//     List<CartNotificationItem>
//         cartItems,
//   ) {
//     return cartItems.fold<int>(
//       0,
//       (
//         total,
//         item,
//       ) =>
//           total + item.quantity,
//     );
//   }

//   // ===========================================================================
//   // GET CART COUNT
//   // ===========================================================================
//   //
//   // HomePage / ProductListPage theke
//   // already ei function call hocche.
//   //
//   // Ekhon sudhu count na,
//   // local cart product data-o load korbe.
//   // ===========================================================================

//   static Future<int>
//       getCartCount() async {
//     await _ensureInitialized();

//     return count.value;
//   }

//   // ===========================================================================
//   // GET CART ITEMS
//   // ===========================================================================

//   static Future<
//           List<CartNotificationItem>>
//       getCartItems() async {
//     await _ensureInitialized();

//     return List<
//         CartNotificationItem>.unmodifiable(
//       items.value,
//     );
//   }

//   // ===========================================================================
//   // POST ADD TO CART
//   // ===========================================================================

//   static Future<int> postAddToCart({
//     String? productId,
//     String? productName,
//     String? imageUrl,
//     String? price,
//     String? originalPrice,
//     String? weight,
//     int quantity = 1,
//   }) async {
//     if (quantity <= 0) {
//       await _ensureInitialized();

//       return count.value;
//     }

//     // Important:
//     // existing local cart first load hobe.
//     //
//     // Tarpor new item add hobe.
//     //
//     // Nahole app restart-er por old item
//     // overwrite hoye jete parto.

//     await _ensureInitialized();

//     // =======================================================================
//     // TODO: FUTURE API POST CALL
//     // =======================================================================
//     //
//     // final response =
//     //     await ApiService.post(
//     //   '/cart/add',
//     //   body: {
//     //     'product_id': productId,
//     //     'quantity': quantity,
//     //   },
//     // );
//     //
//     // =======================================================================

//     final String safeName =
//         productName
//                     ?.trim()
//                     .isNotEmpty ==
//                 true
//             ? productName!.trim()
//             : 'Product';

//     final CartNotificationItem
//         incoming =
//         CartNotificationItem(
//       productId:
//           productId
//                       ?.trim()
//                       .isNotEmpty ==
//                   true
//               ? productId!.trim()
//               : null,

//       name:
//           safeName,

//       imageUrl:
//           imageUrl?.trim() ?? '',

//       price:
//           price?.trim() ?? '',

//       originalPrice:
//           originalPrice
//                       ?.trim()
//                       .isNotEmpty ==
//                   true
//               ? originalPrice!.trim()
//               : null,

//       weight:
//           weight
//                       ?.trim()
//                       .isNotEmpty ==
//                   true
//               ? weight!.trim()
//               : null,

//       quantity:
//           quantity,
//     );

//     final List<CartNotificationItem>
//         updated =
//         List<CartNotificationItem>.from(
//       items.value,
//     );

//     // Same product + same weight already
//     // list-e ache kina check.

//     final int existingIndex =
//         updated.indexWhere(
//       (
//         item,
//       ) =>
//           item.uniqueKey ==
//           incoming.uniqueKey,
//     );

//     if (existingIndex >= 0) {
//       // ---------------------------------------------------------------------
//       // SAME PRODUCT
//       // ---------------------------------------------------------------------
//       //
//       // New notification card create
//       // korbe na.
//       //
//       // Quantity increase korbe.
//       // ---------------------------------------------------------------------

//       final CartNotificationItem
//           existing =
//           updated[
//               existingIndex];

//       updated[existingIndex] =
//           existing.copyWith(
//         name:
//             incoming.name,

//         imageUrl:
//             incoming
//                     .imageUrl
//                     .isNotEmpty
//                 ? incoming.imageUrl
//                 : existing.imageUrl,

//         price:
//             incoming
//                     .price
//                     .isNotEmpty
//                 ? incoming.price
//                 : existing.price,

//         originalPrice:
//             incoming.originalPrice ??
//                 existing.originalPrice,

//         weight:
//             incoming.weight ??
//                 existing.weight,

//         quantity:
//             existing.quantity +
//                 quantity,
//       );
//     } else {
//       // ---------------------------------------------------------------------
//       // NEW PRODUCT
//       // ---------------------------------------------------------------------
//       //
//       // Latest added product top-e.
//       // ---------------------------------------------------------------------

//       updated.insert(
//         0,
//         incoming,
//       );
//     }

//     // Global product list update.
//     items.value =
//         updated;

//     // Total quantity calculate.
//     count.value =
//         _calculateTotalQuantity(
//       updated,
//     );

//     // Local storage save.
//     await _saveToLocal();

//     return count.value;
//   }

//   // ===========================================================================
//   // REMOVE COMPLETE ITEM
//   // ===========================================================================

//   static Future<void> removeItem(
//     CartNotificationItem item,
//   ) async {
//     await _ensureInitialized();

//     final List<CartNotificationItem>
//         updated =
//         List<CartNotificationItem>.from(
//       items.value,
//     );

//     final int index =
//         updated.indexWhere(
//       (
//         element,
//       ) =>
//           element.uniqueKey ==
//           item.uniqueKey,
//     );

//     if (index < 0) {
//       return;
//     }

//     updated.removeAt(
//       index,
//     );

//     items.value =
//         updated;

//     // Remaining items theke
//     // total quantity calculate.
//     count.value =
//         _calculateTotalQuantity(
//       updated,
//     );

//     // Local save.
//     await _saveToLocal();
//   }

//   // ===========================================================================
//   // REMOVE QUANTITY FROM CART
//   // ===========================================================================

//   static Future<int>
//       removeFromCart({
//     String? productId,
//     int quantity = 1,
//   }) async {
//     await _ensureInitialized();

//     if (quantity <= 0) {
//       return count.value;
//     }

//     // =======================================================================
//     // FUTURE API REMOVE CALL
//     // =======================================================================

//     if (productId != null &&
//         productId
//             .trim()
//             .isNotEmpty) {
//       final List<CartNotificationItem>
//           updated =
//           List<CartNotificationItem>.from(
//         items.value,
//       );

//       final int index =
//           updated.indexWhere(
//         (
//           item,
//         ) =>
//             item.productId ==
//             productId,
//       );

//       if (index >= 0) {
//         final CartNotificationItem
//             existing =
//             updated[index];

//         final int newQuantity =
//             existing.quantity -
//                 quantity;

//         if (newQuantity <= 0) {
//           updated.removeAt(
//             index,
//           );
//         } else {
//           updated[index] =
//               existing.copyWith(
//             quantity:
//                 newQuantity,
//           );
//         }

//         items.value =
//             updated;

//         count.value =
//             _calculateTotalQuantity(
//           updated,
//         );
//       }
//     } else {
//       // Product ID na thakle old
//       // compatibility behavior.

//       final int newCount =
//           count.value -
//               quantity;

//       count.value =
//           newCount < 0
//               ? 0
//               : newCount;
//     }

//     await _saveToLocal();

//     return count.value;
//   }

//   // ===========================================================================
//   // SET COUNT
//   // ===========================================================================

//   static Future<void> setCount(
//     int value,
//   ) async {
//     await _ensureInitialized();

//     count.value =
//         value < 0
//             ? 0
//             : value;

//     await _saveToLocal();
//   }

//   // ===========================================================================
//   // CLEAR CART
//   // ===========================================================================
//   //
//   // Eta call korlei:
//   //
//   // count = 0
//   // products = empty
//   // local saved cart-o delete
//   //
//   // Logout-er somoy eta call korbe na
//   // jodi logout-er por cart preserve
//   // korte chao.
//   // ===========================================================================

//   static Future<void>
//       clearCart() async {
//     await _ensureInitialized();

//     items.value =
//         <CartNotificationItem>[];

//     count.value = 0;

//     final SharedPreferences prefs =
//         await SharedPreferences
//             .getInstance();

//     await prefs.remove(
//       _cartCountKey,
//     );

//     await prefs.remove(
//       _cartItemsKey,
//     );
//   }

//   // ===========================================================================
//   // FORCE RELOAD FROM LOCAL
//   // ===========================================================================
//   //
//   // Normally lagbe na.
//   //
//   // Debug/test-er jonno use kora jabe.
//   // ===========================================================================

//   static Future<void>
//       reloadFromLocal() async {
//     _isInitialized = false;

//     _initializingFuture = null;

//     await _ensureInitialized();
//   }
// }

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_notification_item.dart';

class CartService {
  CartService._();

  // ===========================================================================
  // LOCAL STORAGE KEYS
  // ===========================================================================

  static const String _cartCountKey = 'lalbaba_cart_count';

  static const String _cartItemsKey = 'lalbaba_cart_items';

  // ===========================================================================
  // INITIALIZATION
  // ===========================================================================

  static bool _isInitialized = false;

  static Future<void>? _initializingFuture;

  /// App start হওয়ার সময় main.dart থেকে call করবে।
  ///
  /// এতে runApp() হওয়ার আগেই previously saved cart
  /// SharedPreferences থেকে load হয়ে যাবে।
  static Future<void> initialize() async {
    await _ensureInitialized();
  }

  // ===========================================================================
  // GLOBAL CART COUNT
  // ===========================================================================

  static final ValueNotifier<int> count = ValueNotifier<int>(0);

  static int get currentCount => count.value;

  // ===========================================================================
  // GLOBAL CART ITEMS
  // ===========================================================================

  static final ValueNotifier<List<CartNotificationItem>> items =
      ValueNotifier<List<CartNotificationItem>>(
    <CartNotificationItem>[],
  );

  static List<CartNotificationItem> get currentItems =>
      List<CartNotificationItem>.unmodifiable(
        items.value,
      );

  // ===========================================================================
  // ENSURE INITIALIZED
  // ===========================================================================

  static Future<void> _ensureInitialized() async {
    if (_isInitialized) {
      return;
    }

    _initializingFuture ??= _loadFromLocal();

    await _initializingFuture;
  }

  // ===========================================================================
  // LOAD CART FROM LOCAL STORAGE
  // ===========================================================================

  static Future<void> _loadFromLocal() async {
    try {
      final SharedPreferences prefs =
          await SharedPreferences.getInstance();

      // Disk-er latest value force kore reload korbe.
      //
      // App completely close kore abar open korleo
      // latest saved cart data read korbe.
      await prefs.reload();

      // -----------------------------------------------------------------------
      // LOAD SAVED COUNT
      // -----------------------------------------------------------------------

      final int savedCount =
          prefs.getInt(_cartCountKey) ?? 0;

      // -----------------------------------------------------------------------
      // LOAD SAVED ITEMS
      // -----------------------------------------------------------------------

      final List<String> savedItems =
          prefs.getStringList(_cartItemsKey) ??
              <String>[];

      final List<CartNotificationItem> loadedItems =
          <CartNotificationItem>[];

      for (final String rawItem in savedItems) {
        try {
          final dynamic decoded = jsonDecode(
            rawItem,
          );

          if (decoded is Map<String, dynamic>) {
            loadedItems.add(
              CartNotificationItem.fromJson(
                decoded,
              ),
            );
          } else if (decoded is Map) {
            loadedItems.add(
              CartNotificationItem.fromJson(
                Map<String, dynamic>.from(
                  decoded,
                ),
              ),
            );
          }
        } catch (error) {
          debugPrint(
            'Cart item decode error: $error',
          );
        }
      }

      // Loaded items globally set.
      items.value =
          List<CartNotificationItem>.from(
        loadedItems,
      );

      // -----------------------------------------------------------------------
      // CALCULATE ACTUAL COUNT
      // -----------------------------------------------------------------------

      final int calculatedCount =
          _calculateTotalQuantity(
        loadedItems,
      );

      // Product thakle product quantity-i source of truth.
      //
      // Product na thakle old saved count fallback hisebe nibe.
      if (loadedItems.isNotEmpty) {
        count.value = calculatedCount;
      } else {
        count.value =
            savedCount < 0 ? 0 : savedCount;
      }

      // Saved count mismatch hole correct kore save kore dibe.
      if (loadedItems.isNotEmpty &&
          savedCount != calculatedCount) {
        await prefs.setInt(
          _cartCountKey,
          calculatedCount,
        );
      }

      _isInitialized = true;

      debugPrint(
        'Cart loaded successfully. '
        'Items: ${items.value.length}, '
        'Count: ${count.value}',
      );
    } catch (error) {
      debugPrint(
        'Cart local load error: $error',
      );

      // App jeno crash/loop na kore.
      _isInitialized = true;
    }
  }

  // ===========================================================================
  // SAVE CART TO LOCAL STORAGE
  // ===========================================================================

  static Future<void> _saveToLocal() async {
    try {
      final SharedPreferences prefs =
          await SharedPreferences.getInstance();

      // -----------------------------------------------------------------------
      // ENCODE ALL ITEMS
      // -----------------------------------------------------------------------

      final List<String> encodedItems =
          items.value
              .map(
                (CartNotificationItem item) =>
                    jsonEncode(
                  item.toJson(),
                ),
              )
              .toList();

      // -----------------------------------------------------------------------
      // SAVE ITEMS FIRST
      // -----------------------------------------------------------------------

      final bool itemsSaved =
          await prefs.setStringList(
        _cartItemsKey,
        encodedItems,
      );

      // -----------------------------------------------------------------------
      // SAVE COUNT
      // -----------------------------------------------------------------------

      final bool countSaved =
          await prefs.setInt(
        _cartCountKey,
        count.value,
      );

      debugPrint(
        'Cart saved. '
        'itemsSaved: $itemsSaved, '
        'countSaved: $countSaved, '
        'items: ${items.value.length}, '
        'count: ${count.value}',
      );
    } catch (error) {
      debugPrint(
        'Cart local save error: $error',
      );
    }
  }

  // ===========================================================================
  // CALCULATE TOTAL QUANTITY
  // ===========================================================================

  static int _calculateTotalQuantity(
    List<CartNotificationItem> cartItems,
  ) {
    return cartItems.fold<int>(
      0,
      (
        int total,
        CartNotificationItem item,
      ) {
        return total + item.quantity;
      },
    );
  }

  // ===========================================================================
  // GET CART COUNT
  // ===========================================================================

  static Future<int> getCartCount() async {
    await _ensureInitialized();

    return count.value;
  }

  // ===========================================================================
  // GET CART ITEMS
  // ===========================================================================

  static Future<List<CartNotificationItem>>
      getCartItems() async {
    await _ensureInitialized();

    return List<CartNotificationItem>.unmodifiable(
      items.value,
    );
  }

  // ===========================================================================
  // ADD TO CART
  // ===========================================================================

  static Future<int> postAddToCart({
    String? productId,
    String? productName,
    String? imageUrl,
    String? price,
    String? originalPrice,
    String? weight,
    int quantity = 1,
  }) async {
    await _ensureInitialized();

    if (quantity <= 0) {
      return count.value;
    }

    final String safeName =
        productName?.trim().isNotEmpty == true
            ? productName!.trim()
            : 'Product';

    final String? safeProductId =
        productId?.trim().isNotEmpty == true
            ? productId!.trim()
            : null;

    final String? safeOriginalPrice =
        originalPrice?.trim().isNotEmpty == true
            ? originalPrice!.trim()
            : null;

    final String? safeWeight =
        weight?.trim().isNotEmpty == true
            ? weight!.trim()
            : null;

    final CartNotificationItem incoming =
        CartNotificationItem(
      productId: safeProductId,
      name: safeName,
      imageUrl: imageUrl?.trim() ?? '',
      price: price?.trim() ?? '',
      originalPrice: safeOriginalPrice,
      weight: safeWeight,
      quantity: quantity,
    );

    final List<CartNotificationItem> updated =
        List<CartNotificationItem>.from(
      items.value,
    );

    // -------------------------------------------------------------------------
    // SAME PRODUCT + SAME WEIGHT CHECK
    // -------------------------------------------------------------------------

    final int existingIndex =
        updated.indexWhere(
      (CartNotificationItem item) =>
          item.uniqueKey ==
          incoming.uniqueKey,
    );

    if (existingIndex >= 0) {
      // Same item already cart-e ache.
      // New card create korbe na.
      // Quantity increase korbe.

      final CartNotificationItem existing =
          updated[existingIndex];

      updated[existingIndex] =
          existing.copyWith(
        name: incoming.name,

        imageUrl: incoming.imageUrl.isNotEmpty
            ? incoming.imageUrl
            : existing.imageUrl,

        price: incoming.price.isNotEmpty
            ? incoming.price
            : existing.price,

        originalPrice:
            incoming.originalPrice ??
                existing.originalPrice,

        weight:
            incoming.weight ??
                existing.weight,

        quantity:
            existing.quantity + quantity,
      );
    } else {
      // New product.
      // Latest product list-er top-e thakbe.

      updated.insert(
        0,
        incoming,
      );
    }

    // -------------------------------------------------------------------------
    // UPDATE GLOBAL CART
    // -------------------------------------------------------------------------

    items.value =
        List<CartNotificationItem>.from(
      updated,
    );

    count.value =
        _calculateTotalQuantity(
      updated,
    );

    // -------------------------------------------------------------------------
    // IMPORTANT:
    // Every add-er por immediately local storage-e save.
    // -------------------------------------------------------------------------

    await _saveToLocal();

    return count.value;
  }

  // ===========================================================================
  // REMOVE COMPLETE ITEM
  // ===========================================================================

  static Future<void> removeItem(
    CartNotificationItem item,
  ) async {
    await _ensureInitialized();

    final List<CartNotificationItem> updated =
        List<CartNotificationItem>.from(
      items.value,
    );

    final int index =
        updated.indexWhere(
      (CartNotificationItem element) =>
          element.uniqueKey ==
          item.uniqueKey,
    );

    if (index < 0) {
      return;
    }

    updated.removeAt(
      index,
    );

    items.value =
        List<CartNotificationItem>.from(
      updated,
    );

    count.value =
        _calculateTotalQuantity(
      updated,
    );

    // Delete-er por immediately save.
    await _saveToLocal();
  }

  // ===========================================================================
  // REMOVE QUANTITY FROM CART
  // ===========================================================================

  static Future<int> removeFromCart({
    String? productId,
    int quantity = 1,
  }) async {
    await _ensureInitialized();

    if (quantity <= 0) {
      return count.value;
    }

    if (productId != null &&
        productId.trim().isNotEmpty) {
      final String safeProductId =
          productId.trim();

      final List<CartNotificationItem> updated =
          List<CartNotificationItem>.from(
        items.value,
      );

      final int index =
          updated.indexWhere(
        (CartNotificationItem item) =>
            item.productId ==
            safeProductId,
      );

      if (index >= 0) {
        final CartNotificationItem existing =
            updated[index];

        final int newQuantity =
            existing.quantity - quantity;

        if (newQuantity <= 0) {
          updated.removeAt(
            index,
          );
        } else {
          updated[index] =
              existing.copyWith(
            quantity: newQuantity,
          );
        }

        items.value =
            List<CartNotificationItem>.from(
          updated,
        );

        count.value =
            _calculateTotalQuantity(
          updated,
        );
      }
    } else {
      // Old compatibility behavior.
      final int newCount =
          count.value - quantity;

      count.value =
          newCount < 0 ? 0 : newCount;
    }

    await _saveToLocal();

    return count.value;
  }

  // ===========================================================================
  // SET COUNT
  // ===========================================================================

  static Future<void> setCount(
    int value,
  ) async {
    await _ensureInitialized();

    count.value =
        value < 0 ? 0 : value;

    await _saveToLocal();
  }

  // ===========================================================================
  // CLEAR CART
  // ===========================================================================

  /// Sudhu ei function call korle cart completely delete hobe.
  ///
  /// App close/open korle eta automatically call kora jabe na.
  static Future<void> clearCart() async {
    await _ensureInitialized();

    items.value =
        <CartNotificationItem>[];

    count.value = 0;

    final SharedPreferences prefs =
        await SharedPreferences.getInstance();

    await prefs.remove(
      _cartItemsKey,
    );

    await prefs.remove(
      _cartCountKey,
    );

    debugPrint(
      'Cart completely cleared',
    );
  }

  // ===========================================================================
  // FORCE RELOAD FROM LOCAL
  // ===========================================================================

  static Future<void> reloadFromLocal() async {
    _isInitialized = false;

    _initializingFuture = null;

    await _ensureInitialized();
  }
}