import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://zinota-lens-backend.herokuapp.com')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  static ApiClient getServices() {
    final dio = Dio();
    return ApiClient(dio);
  }

  @GET('/api/products')
  Future<String> fetchProductListApi();

  @GET('/api/search')
  Future<String> searchProductsApi(@Query('key') String searchValue);

  @GET('/api/products/{product_id}')
  Future<String> fetchProductDetailApi(@Path('product_id') String productId);
}
