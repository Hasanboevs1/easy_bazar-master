import 'package:easy_bazar/data/product_repository.dart';
import 'package:easy_bazar/entities/category.dart';
import 'package:easy_bazar/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> products = [];
  bool? selectMaxPrice;
  CategoryModel? selectedValue;
  List<ProductModel> searchProducts = [];
  List<ProductModel> sortedProducts = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    products = List.from(ProductRepository.products);
    selectedValue = ProductRepository.categories.first;
    super.initState();
  }

  clear() {
    selectMaxPrice = null;
    products = List.from(ProductRepository.products);
    selectedValue = ProductRepository.categories.first;
    setState(() {});
  }

  min() {
    products.sort((a, b) => b.price.compareTo(a.price));
    setState(() {});
  }

  max() {
    products.sort((a, b) => a.price.compareTo(b.price));
    setState(() {});
  }

  List<String> filterList = ["Min", "Max"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color(0xFFC1C8DB),
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          selectedValue!.name,
          style: const TextStyle(
            color: Color(0xFF383F54),
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextField(
                    textAlign: TextAlign.center,
                    cursorOpacityAnimates: true,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Search products",
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (s) {
                      searchProducts.clear();
                      for (var element in products) {
                        if (element.name.contains(s)) {
                          searchProducts.add(element);
                        }
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  clear();
                },
                child: const Text("Clear All"),
              ),
              DropdownButton(
                value: selectedValue,
                onChanged: (newValue) {
                  if (newValue?.id == -1) {
                    products = List.from(ProductRepository.products);
                    setState(
                      () {},
                    );
                  } else {
                    products = ProductRepository.products
                        .where((e) => e.categoryId == newValue?.id)
                        .toList();
                  }
                  selectedValue = newValue!;
                  setState(
                    () {},
                  );
                },
                items: ProductRepository.categories.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
              DropdownButton(
                hint: const Text('Sorting'),
                value: selectMaxPrice == null
                    ? null
                    : selectMaxPrice!
                        ? filterList.first
                        : filterList.last,
                onChanged: (newValue) {
                  selectMaxPrice = newValue == filterList.first;
                  if (selectMaxPrice ?? false) {
                    max();
                  } else {
                    min();
                  }
                  setState(() {});
                },
                items: filterList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          controller.text.isEmpty
              ? GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 180,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 5,
                              right: 5,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Image.network(
                                products[index].imageUrl,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                products[index].name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              "${products[index].price.toString()}\$",
                              style: const TextStyle(
                                color: Color(0xFF152D1B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 150,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  itemCount: searchProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 5,
                              right: 5,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Image.network(
                                searchProducts[index].imageUrl,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                searchProducts[index].name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              "${searchProducts[index].price.toString()}\$",
                              style: const TextStyle(
                                color: Color(0xFF152D1B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/login");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
