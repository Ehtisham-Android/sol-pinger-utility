import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/entities/url.dart';

class DatabaseHelper {
  static Database? _database;
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._createInstance();

  // Urls table //////////////////////////////////////////////////////////
  String urlsTable = 'urls_table';
  String urls_id = 'id';
  String urls_url = 'url';
  String urls_no_of_tries = 'no_of_tries';
  String urls_is_periodic = 'is_periodic';

  // Logs table //////////////////////////////////////////////////////////
  String logsTable = 'logs_table';
  String logs_id = 'id';
  String logs_url_id = 'url_id';
  String logs_time_taken = 'time_taken';
  String logs_transmitted = 'transmitted';
  String logs_received = 'received';
  String logs_created_at = 'created_at';

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
    await db.execute('CREATE TABLE $urlsTable('
        '$urls_id INTEGER PRIMARY KEY, '
        '$urls_url TEXT, '
        '$urls_no_of_tries INTEGER, '
        '$urls_is_periodic TEXT'
        ')');

    await db.execute('CREATE TABLE $logsTable('
        '$logs_id TEXT PRIMARY KEY, '
        '$logs_url_id TEXT, '
        '$logs_time_taken TEXT, '
        '$logs_transmitted TEXT, '
        '$logs_received TEXT, '
        '$logs_created_at TEXT'
        ')');
  }

  // SELECT METHODS STARTS /////////////////////////////////////////////////////
  // Future<List<Map<String, dynamic>>> getUrlsList() async {
  //   Database db = await database;
  //   var result = db
  //       .rawQuery("SELECT * FROM $urlsTable ORDER BY $urls_id ASC");
  //   return result;
  // }
  //
  // Future<List<Map<String, dynamic>>> getWishlistMapList() async {
  //   Database db = await database;
  //   var result =
  //       db.rawQuery("SELECT * FROM $wishlistTable ORDER BY $wishlist_id ASC");
  //   return result;
  // }
  //
  // Future<List<Map<String, dynamic>>> getCartItemsMapList() async {
  //   Database db = await database;
  //   var result = db
  //       .rawQuery("SELECT * FROM $cartItemsTable ORDER BY $cart_items_id ASC");
  //   return result;
  // }
  //
  // Future<List<Map<String, dynamic>>> getCartItemQtyMapList() async {
  //   Database db = await database;
  //   var result = db
  //       .rawQuery("SELECT * FROM $cartItemQtyTable ORDER BY $cart_item_id ASC");
  //   return result;
  // }

  // SELECT METHODS ENDS ///////////////////////////////////////////////////////

  //INSERT METHOD STARTS ///////////////////////////////////////////////////////
  Future<int> insertUrl(UrlEntity urlEntity) async {
    Database db = await database;
    var result = await db.insert(urlsTable, urlEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }
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
  Future<List<UrlEntity>> getUrlList() async {
    var urlMapList = await getUrlsMapList();
    int count = urlMapList.length;
    List<UrlEntity> urlList = [];
    for (int index = 0; index < count; index++) {
      urlList.add(UrlEntity.fromJson(urlMapList[index]));
    }
    return urlList;
  }

  Future<UrlEntity> getUrl(String id) async {
    var db = await database;
    var urls =
        await db.rawQuery("SELECT * FROM $urlsTable WHERE $urls_id = $id");

    return UrlEntity.fromJson(urls[0]);
  }

  Future<List<Map<String, dynamic>>> getUrlsMapList() async {
    Database db = await database;
    var result =
        db.rawQuery("SELECT * FROM $urlsTable ORDER BY $urls_id ASC");
    return result;
  }
}
