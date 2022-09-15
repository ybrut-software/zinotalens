import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' as r;
part 'api_client.g.dart';

const String baseUrl = "https://zinota-lens-backend.herokuapp.com";

@r.RestApi(
    baseUrl: baseUrl) //baseUrl: 'https://zinota-lens-backend.herokuapp.com'
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  static ApiClient getServices() {
    final dio = Dio();
    // dio.options = BaseOptions(baseUrl: baseUrl);
    return ApiClient(dio);
  }

  // *AUTHENTICATION
  @r.POST('/api/auth/login')
  Future<String> loginApi(@r.Body() String body);

  @r.POST('/api/auth/verify/otp')
  Future<String> verifyOtpApi(@r.Body() String body);

  // *PRODUCTS
  @r.GET('/api/products')
  Future<String> fetchProductListApi();

  @r.GET('/api/search')
  Future<String> searchProductsApi(@r.Query('key') String searchValue);

  @r.GET('/api/products/{product_id}')
  Future<String> fetchProductDetailApi(@r.Path('product_id') String productId);

  // *ADDRESS
  @r.GET('/api/addresses')
  Future<String> fetchAddressesApi(@r.Header('x-auth-token') String token);

  @r.POST('/api/addresses')
  Future<String> saveAddressApi(
      @r.Header('x-auth-token') String token, @r.Body() String body);

  @r.DELETE('/api/addresses/{addrId}')
  Future<String> deleteAddressApi(@r.Header('x-auth-token') String token,
      @r.Path('addrId') String addressId);

  @r.GET('/api/addresses/{addrId}')
  Future<String> fetchSingleAddressApi(@r.Header('x-auth-token') String token,
      @r.Path('addrId') String addressId);

  @r.PUT('/api/addresses/{addrId}')
  Future<String> updateAddressApi(@r.Header('x-auth-token') String token,
      @r.Path('addrId') String addressId, @r.Body() String addressObj);

  // *CART
  @r.POST('/api/cart')
  Future<String> saveCartApi(
      @r.Header('x-auth-token') String token, @r.Body() String cartBody);

  //orders
  @r.GET('/api/orders')
  Future<String> ordersListApi(@r.Header('x-auth-token') String token);

  @r.GET('/api/orders/{order_id}')
  Future<String> orderDetailApi(@r.Header('x-auth-token') String token,
      @r.Path('order_id') String orderId);

  @r.GET('/api/shipments/{shipment_id}')
  Future<String> shippingDetailApi(@r.Header('x-auth-token') String token,
      @r.Path('shipment_id') String shippingId);
}
