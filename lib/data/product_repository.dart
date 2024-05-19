import 'package:easy_bazar/entities/category.dart';
import 'package:easy_bazar/entities/product.dart';

class ProductRepository {
  static List<ProductModel> products = [
    ProductModel(name: "Google Pixel 7A", imageUrl: "https://media.wired.com/photos/645b2c5a6279e36472844466/master/w_1920%2Cc_limit/Google-Pixel-7A-Gear-DSC_5298.jpg", price: 349, categoryId: 1),
    ProductModel(name: "OnePlus 12R", imageUrl: "https://media.wired.com/photos/65bd689cd04c3b480fc7c4f7/master/w_1920%2Cc_limit/OnePlus%252012R%2520SOURCE%2520Julian%2520Chokkattu.jpg", price: 500, categoryId: 1  ),
    ProductModel(name: "Asus Zenfone 10", imageUrl: "https://media.wired.com/photos/64f8e11017a7d741f58ff45a/master/w_1920%2Cc_limit/Asus-Zenfone-10-Featured-Gear.jpg", price: 700, categoryId: 1),
    ProductModel(name: "Nothing Phone (2)", imageUrl: "https://media.wired.com/photos/64af0487da92561daff93c58/master/w_1920%2Cc_limit/Nothing-Phone-2-Review-Featured-Gear.png", price: 642, categoryId: 1),
    ProductModel(name: "Fairphone 5", imageUrl: "https://media.wired.com/photos/650c7d30f4d6fc60ac033ae5/master/w_1920%2Cc_limit/Fairphone-5-Review-Front-and-Back-Gear.jpg", price: 699, categoryId: 1),
    ProductModel(name: "IPhone 15", imageUrl: "https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/apple/Apple-iPhone-15/Pink/Apple-iPhone-15-Pink-thumbnail.png", price: 829, categoryId: 1),
    ProductModel(name: "IPhone 15 Pro", imageUrl: "https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/apple/Apple-iPhone-15-Pro/Blue-Titanium/Apple-iPhone-15-Pro-Blue-Titanium-thumbnail.png", price: 999, categoryId: 1),
    ProductModel(name: "Pixel 8a", imageUrl: "https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/Google/Google-Pixel-8a/Obsidian/Google-Pixel-8a-Obsidian-thumbnail.png", price: 499, categoryId: 1),
    ProductModel(name: "Galaxy S24 Ultra", imageUrl: "https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/samsung/Samsung-Galaxy-S24-Ultra/Titanium-Gray/Samsung-Galaxy-S24-Ultra-Titanium-Gray-thumbnail.png", price: 1299, categoryId: 1),
    ProductModel(name: "Galaxy S24+", imageUrl: "https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/samsung/Samsung-Galaxy-S24-Plus/Cobalt-Violet/Samsung-Galaxy-S24-Plus-Cobalt-Violet-thumbnail.png", price: 999, categoryId: 1),
    ProductModel(name: "Galaxy S24", imageUrl: "https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/samsung/Samsung-Galaxy-S24/Amber-Yellow/Samsung-Galaxy-S24-Amber-Yellow-thumbnail.png", price: 799, categoryId: 1),
    ProductModel(name: "Apple MacBook Air M3 (13-inch)", imageUrl: "https://duet-cdn.vox-cdn.com/thumbor/0x0:2700x1800/750x500/filters:focal(1350x900:1351x901):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25333659/247043_Apple_MacBook_Air_2024_AKrales_0182.jpg", price: 989, categoryId: 2),
    ProductModel(name: "HP Spectre x360 13.5", imageUrl: "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/24677165/236652_HP_Spectre_x360_14_AKrales_0138.jpg", price: 1750, categoryId: 2),
    ProductModel(name: "Asus ROG Strix Scar 17 X3D (2023)", imageUrl: "https://duet-cdn.vox-cdn.com/thumbor/0x0:2700x1800/750x500/filters:focal(1588x998:1589x999):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/24863656/236750_ROG_Scar_17_AKrales_0139.jpg", price: 3700, categoryId: 2),
    ProductModel(name: "Apple MacBook M3 Pro/Max (16-inch)", imageUrl: "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1023x737:1024x738):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25071522/236896_MacBook_Pro_16_M3_AKrales_0617.jpg", price: 2499, categoryId: 2),
    ProductModel(name: "Asus ROG Zephyrus G14 (2024)", imageUrl: "https://duet-cdn.vox-cdn.com/thumbor/0x0:2700x1800/750x500/filters:focal(1324x1016:1325x1017):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25435980/rogzeyphg14_solo.jpg", price: 2000, categoryId: 2),
    ProductModel(name: "Lenovo Yoga Book 9i (2024)", imageUrl: "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1024x785:1025x786):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/24773689/236717_Lenovo_Yoga_Book_9i_DSeifert_0006.jpg", price: 2000, categoryId: 2),
    ProductModel(name: "Asus Chromebook Plus CX34", imageUrl: "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/24997607/236833_Asus_Chromebook_Plus_CX34_AKrales_0047.jpg", price: 399, categoryId: 2),
    ProductModel(name: "MSI Sword GF76 GF76", imageUrl: "https://notebookoff.uz/upload/resize_cache/iblock/153/220_200_1/8a7puf4phu6gmahdficirax3vnnj8u9h.jpg", price: 1800, categoryId: 2),
    ProductModel(name: "MSI Stealth 16 Studio A13VG-056US", imageUrl: "https://notebookoff.uz/upload/resize_cache/iblock/65f/220_200_1/s91ims707rnf33fliffdbcrscypflccv.jpg", price: 2000, categoryId: 2),
    ProductModel(name: "PAUDIN Paring Knife 3.5 Inch", imageUrl: "https://m.media-amazon.com/images/I/71AZpnWCuQL._AC_SX679_.jpg", price: 20, categoryId: 3),
    ProductModel(name: "Zojirushi EC-DAC50 Zutto 5-Cup Drip Coffeemaker", imageUrl: "https://m.media-amazon.com/images/I/71mVeg95MxL.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 37, categoryId: 2),
    ProductModel(name: "Airfryer Convection Oven", imageUrl: "https://m.media-amazon.com/images/I/91xpCGBF6wL._AC_UY327_FMwebp_QL65_.jpg", price: 67, categoryId: 3),
    ProductModel(name: "Gree Chigo Cheap Price", imageUrl: "https://s.alicdn.com/@sc04/kf/H7a7ab799e58b49e0a43bab123e1ded48L.jpg_250x250xz.jpg", price: 200, categoryId: 3),
    ProductModel(name: "Water Dispenser ", imageUrl: "https://s.alicdn.com/@sc04/kf/H5ed8c35487ef4c46adb1169f8f9db06bU.jpg_250x250xz.jpg", price: 2, categoryId: 3),
    ProductModel(name: "14Cuft Top Freezer Frost", imageUrl: "https://s.alicdn.com/@sc04/kf/H3dab277f091e4b31adc0a9e2066c03d9V.jpg_250x250xz.jpg", price: 500, categoryId: 3),
    ProductModel(name: "Meat grinder", imageUrl: "https://s.alicdn.com/@sc04/kf/H1653d737a24443299db104f1ce4a4be9n.jpg_250x250xz.jpg", price: 195, categoryId: 3),
    ProductModel(name: "Cake mixer", imageUrl: "https://s.alicdn.com/@sc04/kf/He777e707443b4c5f8db13f8cbb9d6a17g.jpg_250x250xz.jpg", price: 30, categoryId: 3),
    ProductModel(name: "Jug Kettle Electric Pot", imageUrl: "https://s.alicdn.com/@sc04/kf/Hd4f0724a23924406bed6d1fdb0e0b3a1m.jpg_250x250xz.jpg", price: 20, categoryId: 3),

  ];
  static List<CategoryModel> categories = [
    CategoryModel(name: "All", id: -1),
    CategoryModel(name: "Phone", id: 1),
    CategoryModel(name: "Laptop", id: 2),
    CategoryModel(name: "Home tools", id: 3),
  ];
  static List<CategoryModel> chosenCategory = [
    CategoryModel(name: " Phone", id: 1),
    CategoryModel(name: " Laptop", id: 2),
    CategoryModel(name: " Home tools", id: 3),
  ];

}
