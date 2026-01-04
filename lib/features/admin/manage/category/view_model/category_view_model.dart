import 'package:get/get.dart';
import 'package:sale_product_app/features/admin/manage/category/model/Category_model.dart';
import 'package:sale_product_app/repository/admin_repository_impl.dart';
import 'package:sale_product_app/utils/message_utils.dart';

class CategoryViewModel extends GetxController {
  var categoryRepository = AdminRepositoryImpl();
  var categoryList = <CategoryModel>[].obs;
  var loading = false.obs;

  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }

  getAllCategories() async {
    loading.value = true;
    categoryList.value = [];
    var response = await categoryRepository.getAllCategories();
    if (response.data != null) {
      response.data.forEach((data) {
        var res = CategoryModel.fromJson(data);
        categoryList.add(res);
      });
    }
    loading.value = false;
  }

  getCategoryById(id) async {
    var response = await categoryRepository.getCategoryById(id);
    if (response.data != null) {
      var category = CategoryModel.fromJson(response.data);
      Get.toNamed(
        "/admin/manage/category/form",
        parameters: {"id": "${category.id}", "name": category.name!},
      );
    }
  }

  onDeleteCategory(CategoryModel category) async {
    var response = await categoryRepository.deleteCategory(category);
    if (response.data != null) {
      await getAllCategories();
    } else {
    }
  }
  onConfirmDeleteCategory(CategoryModel category)
  {
    MessageUtil.confirmMessageDialog(
      title: "Delete Category",
      middleText: "Do you want to delete ${category.name} ?",
      textConfirm: 'Confirm',
      textCancel: 'Cancel',
      onConfirm: (){
        onDeleteCategory(category);
        Get.back();
      },
      onCancel: () => print('Canceled'),
    );
  }
}
