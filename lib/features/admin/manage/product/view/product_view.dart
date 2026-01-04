import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/admin/manage/product/view_model/product_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.put(ProductViewModel());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          backgroundColor: Colors.blue,
          title: Text("List Product", style: TextStyle(color: Colors.white)),
        ),
        body: viewModel.loading.value
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: viewModel.productList.length,
                  itemBuilder: (context, index) {
                    var data = viewModel.productList[index];
                    return Card(
                      elevation: 1,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      "${index + 1} : ${data.name ?? ""}",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      "Price : ${data.price}",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.blue),
                                      "Cost : ${data.cost} ",
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      "Category Name : ${data.category?.name ?? ""}",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      );
    });
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sale_product_app/features/admin/manage/product/view_model/product_view_model.dart';
// import 'package:sale_product_app/constants/app_routes.dart'; // Assuming you have this for navigation
//
// class ProductView extends StatelessWidget {
//   const ProductView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Determine View Model
//     final ProductViewModel viewModel = Get.put(ProductViewModel());
//
//     return Scaffold(
//       backgroundColor: Colors.grey[100], // Light grey background makes cards pop
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: const Color(0xFF1565C0), // Professional Blue
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text(
//           "Product Management",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       // Add Button for creating new products
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Action to add product
//           // Get.toNamed(AppRoutes.adminManageProductForm);
//         },
//         backgroundColor: const Color(0xFF1565C0),
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//       body: Obx(() {
//         if (viewModel.loading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (viewModel.productList.isEmpty) {
//           return const Center(
//             child: Text("No products found", style: TextStyle(color: Colors.grey)),
//           );
//         }
//
//         return Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: ListView.separated(
//             itemCount: viewModel.productList.length,
//             separatorBuilder: (context, index) => const SizedBox(height: 12),
//             itemBuilder: (context, index) {
//               var data = viewModel.productList[index];
//               return Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 5,
//                       offset: const Offset(0, 2), // Shadow position
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     children: [
//                       // 1. Icon Placeholder (Left Side)
//                       Container(
//                         height: 60,
//                         width: 60,
//                         decoration: BoxDecoration(
//                           color: Colors.blue[50],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Icon(
//                           Icons.inventory_2_outlined,
//                           color: Colors.blue[700],
//                           size: 30,
//                         ),
//                       ),
//
//                       const SizedBox(width: 15),
//
//                       // 2. Product Details (Middle)
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Name
//                             Text(
//                               data.name ?? "Unknown Product",
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF333333),
//                               ),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             const SizedBox(height: 4),
//
//                             // Category
//                             Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                               decoration: BoxDecoration(
//                                   color: Colors.grey[200],
//                                   borderRadius: BorderRadius.circular(4)
//                               ),
//                               child: Text(
//                                 data.category?.name ?? "No Category",
//                                 style: TextStyle(fontSize: 10, color: Colors.grey[800]),
//                               ),
//                             ),
//
//                             const SizedBox(height: 8),
//
//                             // Price & Cost Row
//                             Row(
//                               children: [
//                                 Text(
//                                   "\$${data.price}",
//                                   style: const TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.green
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Text(
//                                   "Cost: \$${data.cost}",
//                                   style: const TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // 3. Action Buttons (Right Side)
//                       Column(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               // Edit Logic
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.withOpacity(0.1),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(Icons.edit, size: 20, color: Colors.blue),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           InkWell(
//                             onTap: () {
//                               // Delete Logic
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: Colors.red.withOpacity(0.1),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(Icons.delete, size: 20, color: Colors.red),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }),
//     );
//   }
// }