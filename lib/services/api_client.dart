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

  // *AUTHENTICATION
  @POST('/api/auth/login')
  Future<String> loginApi(@Body() String body);

  @POST('/api/auth/verify/otp')
  Future<String> verifyOtpApi(@Body() String body);

  // *PRODUCTS
  @GET('/api/products')
  Future<String> fetchProductListApi();

  @GET('/api/search')
  Future<String> searchProductsApi(@Query('key') String searchValue);

  @GET('/api/products/{product_id}')
  Future<String> fetchProductDetailApi(@Path('product_id') String productId);

  // *ADDRESS
  @GET('/api/addresses')
  Future<String> fetchAddressesApi(@Header('x-auth-token') String token);

  @POST('/api/addresses')
  Future<String> saveAddressApi(
      @Header('x-auth-token') String token, @Body() String body);

  @DELETE('/api/addresses/{addrId}')
  Future<String> deleteAddressApi(
      @Header('x-auth-token') String token, @Path('addrId') String addressId);

  @GET('/api/addresses/{addrId}')
  Future<String> fetchSingleAddressApi(
      @Header('x-auth-token') String token, @Path('addrId') String addressId);

  @PUT('/api/addresses/{addrId}')
  Future<String> updateAddressApi(
      @Header('x-auth-token') String token, @Path('addrId') String addressId);
}
