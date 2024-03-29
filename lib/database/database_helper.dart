import 'package:sqflite/sqflite.dart';
import 'package:zinotalens/model/product_addcart_model.dart';

final database_name = 'zinotalens.db';
final database_version = 1;
final table_name = 'product_table';
final product_id = 'product_id';
final product_listing_price = 'listing_price';
final product_selling_price = 'selling_price';
final product_title = 'title';
final product_size = 'size';
final product_quantity = 'quantity';
final product_photo = 'photo';

class DatabaseHelper {
  static Database? _database;
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = getDatabasesPath();
    var databasePath = "$dir $database_name";

    var database = openDatabase(
      databasePath,
      version: database_version,
      onCreate: (db, version) => db.execute(
          'CREATE TABLE $table_name ($product_id text primary key not null, $product_title text, $product_selling_price integer, $product_size text, $product_photo text, $product_quantity integer, $product_listing_price integer )'),
    );

    return database;
  }

  void insertProduct(ProductAddCartModel productAddCartModel) async {
    var db = await this.database;
    var res = await db.insert(table_name, productAddCartModel.toMap());
    print(res);
  }

  void deleteProduct(String productId) async {
    var db = await this.database;
    var res = db.delete(table_name, where: "$product_id = '$productId'");
    print(res);
  }

  void updateQuantity(
      {required String productId, required int quantity}) async {
    var db = await this.database;
    var res = await db.update(table_name, {product_quantity: quantity},
        where: "$product_id = '$productId'");
    print(res);
  }

  Future<List<ProductAddCartModel>> getProductCartList() async {
    List<ProductAddCartModel> productAddCartModelList = [];

    var db = await this.database;
    var result = await db.query(table_name);

    result.forEach((element) {
      ProductAddCartModel productAddCartModel =
          ProductAddCartModel.fromMap(element);
      productAddCartModelList.add(productAddCartModel);
    });

    return productAddCartModelList;
  }

  void clearCartTable() async {
    var db = await this.database;
    db.delete(table_name);
    print("delete cart");
  }
}
