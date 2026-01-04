import 'package:get/get.dart';
import 'package:sale_product_app/features/admin/manage/product/model/Product_model.dart';
import 'package:sale_product_app/repository/admin_repository_impl.dart';

class ProductViewModel extends GetxController {
  var adminRepository = AdminRepositoryImpl();
  var productList = <ProductModel>[].obs;
  var loading = false.obs;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  getAllProducts() async {
    loading.value = true;
    var response = await adminRepository.getAllProducts();
    if (response.data != null) {
      response.data.forEach((data) {
        productList.add(ProductModel.fromJson(data));
      });
    }
    loading.value = false;
  }
}
