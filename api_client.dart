import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:tomato_owl/api/app_config.dart';
import 'package:tomato_owl/api/approve_phone/approve_phone.dart';
import 'package:tomato_owl/api/categories/category_response.dart';
import 'package:tomato_owl/api/products/product_response.dart';
import 'package:tomato_owl/api/register_phone/register_phone.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://example.com.ua/")
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
        baseUrl: "https://example.com.ua/",
        responseType: ResponseType.plain,
        receiveTimeout: 5000,
        connectTimeout: 15000,
        headers: {
          HttpHeaders.userAgentHeader: "dio",
          "Connection": "keep-alive",
        });
    dio.options.contentType = 'application/json';
    dio.options.headers["Accept"] = "application/json";
    return _ApiClient(dio);
  }

  @GET("get_categories")
  Future<CategoryResponse> getCategories();

  @GET("get_products")
  Future<ProductResponse> getProduct(@Query("category_id") String categoryId);

  @GET("send_phone")
  Future<RegisterPhone> registerPhone(@Query("phone") String phone);

  @GET("send_code")
  Future<ApprovePhone> approvePhone(
      @Query("phone") String phone, @Query("code") String code);
}
