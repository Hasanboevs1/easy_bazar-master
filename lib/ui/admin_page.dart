import 'package:easy_bazar/data/product_repository.dart';
import 'package:easy_bazar/entities/category.dart';
import 'package:easy_bazar/entities/product.dart';
import 'package:easy_bazar/entities/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatefulWidget {
  AdminModel adminModel;

  AdminPage({
    super.key,
    required this.adminModel,
  });

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // TextEditingController categoryIdController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  CategoryModel? selectedValue;

  @override
  void initState() {
    selectedValue = ProductRepository.chosenCategory.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF8ecae6),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(150),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter product name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          // Faol emas holatda chegara rangi
                          width: 2.0, // Faol emas holatda chegara qalinligi
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue, // Faol holatda chegara rangi
                          width: 3.0, // Faol holatda chegara qalinligi
                        ),
                      ),
                      hintStyle: const TextStyle(color: Colors.indigo),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.indigo,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(25),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter product's price",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          // Faol emas holatda chegara rangi
                          width: 2.0, // Faol emas holatda chegara qalinligi
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue, // Faol holatda chegara rangi
                          width: 3.0, // Faol holatda chegara qalinligi
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.indigo),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.indigo,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(25),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: imageUrlController,
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter product's imageUrl",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 3.0,
                        ),
                      ),
                      hintStyle: const TextStyle(color: Colors.indigo),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.indigo,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(25),
                const Gap(10),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2,
                        color: Colors.green,
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedValue,
                      iconEnabledColor: Colors.blue,
                      dropdownColor: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(30),
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (newValue) {
                        selectedValue = newValue;
                        setState(
                          () {},
                        );
                      },
                      items: ProductRepository.chosenCategory.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const Gap(60),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        ProductModel newProductModel = ProductModel(
                          categoryId: selectedValue!.id,
                          price: int.parse(priceController.text),
                          name: nameController.text,
                          imageUrl: imageUrlController.text,
                        );
                        ProductRepository.products.insert(0, newProductModel);
                        context.push("/");
                      }
                    },
                    child: const Text("Add"),
                  ),
                ),
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
