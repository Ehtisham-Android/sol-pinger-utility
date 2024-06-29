import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._createInstance();

  // Categories table //////////////////////////////////////////////////////////
  String categoriesTable = 'categories_table';
  String categories_id = 'id';
  String categories_name = 'name';
  String categories_banner = 'banner';
  String categories_thumbnail = 'thumbnail';
  String categories_hasChildren = 'hasChildren';
  String categories_bannerDominantColor = 'bannerDominantColor';
  String categories_thumbnailDominantColor = 'thumbnailDominantColor';

  // Wishlist table ////////////////////////////////////////////////////////////
  String wishlistTable = 'wishlist_table';
  String wishlist_id = 'wishlist_id';
  String wishlist_sku = 'wishlist_sku';
  String wishlist_qty = 'wishlist_qty';
  String wishlist_name = 'wishlist_name';
  String wishlist_price = 'wishlist_price';
  String wishlist_product_id = 'wishlist_product_id';
  String wishlist_thumbnail = 'wishlist_thumbnail';
  String wishlist_description = 'wishlist_description';
  String wishlist_review_count = 'wishlist_review_count';
  String wishlist_is_in_wishlist = 'wishlist_is_in_wishlist';
  String wishlist_wishlist_item_id = 'wishlist_wishlist_item_id';
  String wishlist_type_id = 'wishlist_type_id';
  String wishlist_entity_id = 'wishlist_entity_id';
  String wishlist_rating = 'wishlist_rating';
  String wishlist_is_available = 'wishlist_is_available';
  String wishlist_final_price = 'wishlist_final_price';
  String wishlist_formatted_price = 'wishlist_formatted_price';
  String wishlist_formatted_final_price = 'wishlist_formatted_final_price';
  String wishlist_is_new = 'wishlist_is_new';
  String wishlist_packing = 'wishlist_packing';
  String wishlist_is_in_range = 'wishlist_is_in_range';
  String wishlist_availability = 'wishlist_availability';

  // Cart items table //////////////////////////////////////////////////////////
  String cartItemsTable = 'cartItems_table';
  String cart_items_threshold_qty = 'thresholdQty';
  String cart_items_remaining_qty = 'remainingQty';
  String cart_items_image = 'image';
  String cart_items_name = 'name';
  String cart_items_sku = 'sku';
  String cart_items_price = 'price';
  String cart_items_final_price = 'finalPrice';
  String cart_items_base_row_total_incl_tax = 'base_row_total_incl_tax';
  String cart_items_formatted_final_price = 'formattedFinalPrice';
  String cart_items_is_in_range = 'isInRange';
  String cart_items_qty = 'qty';
  String cart_items_modified_qty = 'modified_qty';
  String cart_items_product_id = 'productId';
  String cart_items_grouped_product_id = 'groupedProductId';
  String cart_items_type_id = 'typeId';
  String cart_items_sub_total = 'subTotal';
  String cart_items_id = 'id';
  String cart_items_can_move_to_wish_list = 'canMoveToWishlist';

  // Cart item qty table ///////////////////////////////////////////////////////
  String cartItemQtyTable = 'cartItemQty_table';
  String cart_item_id = 'id';
  String cart_item_qty = 'qty';
  String cart_item_modified_qty = 'modified_qty';

  factory DatabaseHelper.getInstance() {
    return _databaseHelper ?? DatabaseHelper._createInstance();
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}fifo_db.db";

    var fifoDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return fifoDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $categoriesTable('
        '$categories_id TEXT PRIMARY KEY, '
        '$categories_name TEXT, '
        '$categories_banner TEXT, '
        '$categories_thumbnail TEXT, '
        '$categories_hasChildren TEXT, '
        '$categories_bannerDominantColor TEXT, '
        '$categories_thumbnailDominantColor TEXT'
        ')');

    await db.execute('CREATE TABLE $wishlistTable('
        '$wishlist_id TEXT PRIMARY KEY, '
        '$wishlist_sku TEXT'
        '$wishlist_qty TEXT'
        '$wishlist_name TEXT'
        '$wishlist_price TEXT'
        '$wishlist_product_id TEXT'
        '$wishlist_thumbnail TEXT'
        '$wishlist_description TEXT'
        '$wishlist_review_count TEXT'
        '$wishlist_is_in_wishlist TEXT'
        '$wishlist_wishlist_item_id TEXT'
        '$wishlist_type_id TEXT'
        '$wishlist_entity_id TEXT'
        '$wishlist_rating TEXT'
        '$wishlist_is_available TEXT'
        '$wishlist_final_price TEXT'
        '$wishlist_formatted_price TEXT'
        '$wishlist_formatted_final_price TEXT'
        '$wishlist_is_new TEXT'
        '$wishlist_packing TEXT'
        '$wishlist_is_in_range TEXT'
        '$wishlist_availability TEXT'
        ')');

    await db.execute('CREATE TABLE $cartItemsTable('
        '$cart_items_id TEXT PRIMARY KEY, '
        '$cart_items_threshold_qty TEXT'
        '$cart_items_remaining_qty TEXT'
        '$cart_items_image TEXT'
        '$cart_items_name TEXT'
        '$cart_items_sku TEXT'
        '$cart_items_price TEXT'
        '$cart_items_final_price TEXT'
        '$cart_items_base_row_total_incl_tax TEXT'
        '$cart_items_formatted_final_price TEXT'
        '$cart_items_is_in_range TEXT'
        '$cart_items_qty INTEGER'
        '$cart_items_modified_qty INTEGER'
        '$cart_items_product_id TEXT'
        '$cart_items_grouped_product_id TEXT'
        '$cart_items_type_id TEXT'
        '$cart_items_sub_total TEXT'
        '$cart_items_can_move_to_wish_list TEXT'
        ')');

    await db.execute('CREATE TABLE $cartItemQtyTable('
        '$cart_item_id TEXT PRIMARY KEY, '
        '$cart_item_qty INTEGER, '
        '$cart_item_modified_qty INTEGER'
        ')');
  }

  // SELECT METHODS STARTS /////////////////////////////////////////////////////
  Future<List<Map<String, dynamic>>> getCategoriesMapList() async {
    Database db = await database;
    var result = db
        .rawQuery("SELECT * FROM $categoriesTable ORDER BY $categories_id ASC");
    return result;
  }

  Future<List<Map<String, dynamic>>> getWishlistMapList() async {
    Database db = await database;
    var result =
        db.rawQuery("SELECT * FROM $wishlistTable ORDER BY $wishlist_id ASC");
    return result;
  }

  Future<List<Map<String, dynamic>>> getCartItemsMapList() async {
    Database db = await database;
    var result = db
        .rawQuery("SELECT * FROM $cartItemsTable ORDER BY $cart_items_id ASC");
    return result;
  }

  Future<List<Map<String, dynamic>>> getCartItemQtyMapList() async {
    Database db = await database;
    var result = db
        .rawQuery("SELECT * FROM $cartItemQtyTable ORDER BY $cart_item_id ASC");
    return result;
  }

  // SELECT METHODS ENDS ///////////////////////////////////////////////////////

  //INSERT METHOD STARTS ///////////////////////////////////////////////////////
  // Future<int> insertCategory(CategoriesEntity categoriesEntity) async {
  //   Database db = await database;
  //   var result = await db.insert(categoriesTable, categoriesEntity.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   return result;
  // }
  //
  // Future<void> insertCategories(List<CategoriesEntity> list) async {
  //   Database db = await database;
  //   for (final item in list) {
  //     await db.insert(categoriesTable, item.toJson(),
  //         conflictAlgorithm: ConflictAlgorithm.replace);
  //   }
  // }
  //
  // Future<int> insertWishlist(WishListItemEntity wishListItemEntity) async {
  //   Database db = await database;
  //   var result = await db.insert(wishlistTable, wishListItemEntity.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   return result;
  // }
  //
  // Future<int> insertCartItem(CartItemEntity cartItemEntity) async {
  //   Database db = await database;
  //   var result = await db.insert(cartItemsTable, cartItemEntity.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   return result;
  // }
  //
  // Future<int> insertCartItemQty(CartItemQtyEntity cartItemQtyEntity) async {
  //   Database db = await database;
  //   var result = await db.insert(cartItemQtyTable, cartItemQtyEntity.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   return result;
  // }
  //
  // //INSERT METHOD ENDS /////////////////////////////////////////////////////////
  //
  // //UPDATE METHOD STARTS ///////////////////////////////////////////////////////
  // Future<int> updateCategory(CategoriesEntity categoriesEntity) async {
  //   var db = await database;
  //   var result = await db.update(categoriesTable, categoriesEntity.toJson(),
  //       where: '$categories_id = ?', whereArgs: [categoriesEntity.id]);
  //   return result;
  // }
  //
  // Future<int> updateWishlist(WishListItemEntity wishListItemEntity) async {
  //   var db = await database;
  //   var result = await db.update(wishlistTable, wishListItemEntity.toJson(),
  //       where: '$wishlist_id = ?', whereArgs: [wishListItemEntity.id]);
  //   return result;
  // }
  //
  // Future<int> updateCartItem(CartItemEntity cartItemEntity) async {
  //   var db = await database;
  //   var result = await db.update(cartItemsTable, cartItemEntity.toJson(),
  //       where: '$cart_items_id = ?', whereArgs: [cartItemEntity.id]);
  //   return result;
  // }
  //
  // Future<int> updateCartItemQty(CartItemQtyEntity cartItemQtyEntity) async {
  //   var db = await database;
  //   var json = cartItemQtyEntity.toJson();
  //   int qty = json[cart_item_modified_qty];
  //   json[cart_item_modified_qty] = qty + 1;
  //   var result = await db.update(cartItemQtyTable, json,
  //       where: '$cart_item_id = ?', whereArgs: [cartItemQtyEntity.id]);
  //   return int.parse(json[cart_item_modified_qty]);
  // }
  //
  // Future<CartItemQtyEntity> increaseCartItemQty(String id) async {
  //   var db = await database;
  //   final cartItemQtyEntity = await getCartItemQty(id);
  //   var json = cartItemQtyEntity.toJson();
  //   int qty = json[cart_item_modified_qty];
  //   if(qty < 1000){
  //     json[cart_item_modified_qty] = qty + 1;
  //     var result = await db.update(cartItemQtyTable, json,
  //         where: '$cart_item_id = ?', whereArgs: [cartItemQtyEntity.id]);
  //   }
  //
  //   return CartItemQtyEntity.fromJson(json);
  // }
  //
  // Future<CartItemQtyEntity> decreaseCartItemQty(String id) async {
  //   var db = await database;
  //   final cartItemQtyEntity = await getCartItemQty(id);
  //   var json = cartItemQtyEntity.toJson();
  //   int qty = json[cart_item_modified_qty];
  //   if(qty > 1){
  //     json[cart_item_modified_qty] = qty - 1;
  //     var result = await db.update(cartItemQtyTable, json,
  //         where: '$cart_item_id = ?', whereArgs: [cartItemQtyEntity.id]);
  //   }
  //
  //   return CartItemQtyEntity.fromJson(json);
  // }
  //
  // //UPDATE METHOD ENDS /////////////////////////////////////////////////////////
  //
  // //DELETE METHOD STARTS ///////////////////////////////////////////////////////
  // Future<int> deleteCategory(int id) async {
  //   var db = await database;
  //   int result = await db
  //       .delete(categoriesTable, where: "$categories_id = ?", whereArgs: [id]);
  //   return result;
  // }
  //
  // Future<int> deleteWishlist(int id) async {
  //   var db = await database;
  //   int result = await db
  //       .delete(wishlistTable, where: "$wishlist_id = ?", whereArgs: [id]);
  //   return result;
  // }
  //
  // Future<int> deleteCartItem(int id) async {
  //   var db = await database;
  //   int result = await db
  //       .delete(cartItemsTable, where: "$cart_items_id = ?", whereArgs: [id]);
  //   return result;
  // }
  //
  // Future<int> deleteCartItemQty(int id) async {
  //   var db = await database;
  //   int result = await db
  //       .delete(cartItemQtyTable, where: "$cart_item_id = ?", whereArgs: [id]);
  //   return result;
  // }
  //
  // Future<int> deleteAllCartItemQty() async {
  //   var db = await database;
  //   return await db.rawDelete("DELETE FROM $cartItemQtyTable");
  // }
  //
  // //DELETE METHOD ENDS /////////////////////////////////////////////////////////
  //
  // Future<List<CategoriesEntity>> getCategoriesList() async {
  //   var categoriesMapList = await getCategoriesMapList();
  //   int count = categoriesMapList.length;
  //   List<CategoriesEntity> categoriesList = [];
  //   for (int index = 0; index < count; index++) {
  //     categoriesList.add(CategoriesEntity.fromMap(categoriesMapList[index]));
  //   }
  //   return categoriesList;
  // }
  //
  // Future<List<WishListItemEntity>> getWishlistList() async {
  //   var wishlistMapList = await getWishlistMapList();
  //   int count = wishlistMapList.length;
  //   List<WishListItemEntity> wishlistList = [];
  //   for (int index = 0; index < count; index++) {
  //     wishlistList.add(WishListItemEntity.fromJson(wishlistMapList[index]));
  //   }
  //   return wishlistList;
  // }
  //
  // Future<List<CartItemEntity>> getCartItemList() async {
  //   var cartItemMapList = await getCartItemsMapList();
  //   int count = cartItemMapList.length;
  //   List<CartItemEntity> cartItemList = [];
  //   for (int index = 0; index < count; index++) {
  //     cartItemList.add(CartItemEntity.fromJson(cartItemMapList[index]));
  //   }
  //   return cartItemList;
  // }
  //
  // Future<List<CartItemQtyEntity>> getCartItemQtyList() async {
  //   var cartItemQtyMapList = await getCartItemQtyMapList();
  //   int count = cartItemQtyMapList.length;
  //   List<CartItemQtyEntity> cartItemQtyList = [];
  //   for (int index = 0; index < count; index++) {
  //     cartItemQtyList.add(CartItemQtyEntity.fromJson(cartItemQtyMapList[index]));
  //   }
  //   return cartItemQtyList;
  // }
  //
  // Future<CartItemQtyEntity> getCartItemQty(String id) async {
  //   var db = await database;
  //   var cartItemQty = await db
  //       .rawQuery("SELECT * FROM $cartItemQtyTable WHERE $cart_item_id = $id");
  //
  //   return CartItemQtyEntity.fromJson(cartItemQty[0]);
  // }
}
