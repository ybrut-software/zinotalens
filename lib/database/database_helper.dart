import 'package:sqflite/sqflite.dart';
import 'package:zinotalens/model/product_addcart_model.dart';

final database_name = 'zinotalens.db';
final database_version = 1;
final table_name = 'product_table';
final product_id = 'product_id';
final product_price = 'price';
final product_quantity = 'quantity';

class DatabaseHelper {
  static Database? _database;

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
          'CREATE TABLE $table_name ($product_id text primary key not null, $product_quantity integer, $product_price real )'),
    );

    return database;
  }

  void insertProduct(ProductAddCartModel productAddCartModel) async {
    var db = await this.database;
    var res = await db.insert(table_name, productAddCartModel.toMap());
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
}
