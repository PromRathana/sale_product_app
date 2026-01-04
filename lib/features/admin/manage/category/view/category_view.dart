import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/admin/manage/category/view_model/category_view_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.put(CategoryViewModel());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.toNamed("/admin/manage/category/form");
        },
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("List Categories", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async {
            viewModel.getAllCategories();
          },
          child: viewModel.loading.value
              ? Center(child: CircularProgressIndicator(color: Colors.blue))
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: viewModel.categoryList.length,
                    itemBuilder: (context, index) {
                      var category = viewModel.categoryList[index];
                      return GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 16,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${index + 1}. ${category.name}",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      viewModel.getCategoryById(category.id);
                                    },
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                  ),
                                  // IconButton(
                                  //   onPressed: () {
                                  //     // 1. Show a confirmation dialog (Recommended)
                                  //     // 2. If confirmed, call the delete method
                                  //     // Example:
                                  //     Get.defaultDialog(
                                  //       title: "Delete Category",
                                  //       middleText:
                                  //           "Are you sure you want to delete ${category.name}?",
                                  //       onConfirm: () {
                                  //         viewModel.deleteCategory(
                                  //           category,
                                  //         ); // Assumes you pass the model
                                  //         Get.back(); // Close dialog
                                  //       },
                                  //       onCancel: () => Get.back(),
                                  //     );
                                  //
                                  //     // For now, if you don't want a dialog:
                                  //     // viewModel.deleteCategory(category);
                                  //   },
                                  //   icon: Icon(Icons.delete, color: Colors.red),
                                  // ),
                                  IconButton(
                                    onPressed: () {
                                      viewModel.onConfirmDeleteCategory(category);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        );
      }),
    );
  }
}
