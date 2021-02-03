import 'package:tomato_owl/api/base/base_network.dart';
import 'package:tomato_owl/api/base_model.dart';
import 'package:tomato_owl/api/get_data.dart';
import 'package:tomato_owl/api/categories/category_response.dart';
import 'package:tomato_owl/api/server_error.dart';

class GetCategories extends BaseNetwork
    implements GetData<Future<BaseModel<CategoryResponse>>> {
  @override
  Future<BaseModel<CategoryResponse>> getData() async {
    CategoryResponse response;
    try {
      response = await apiClient.getCategories();
    } catch (error, stacktrace) {
      logger.e("Exception occured: $error\nstackTrace:\n$stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}
