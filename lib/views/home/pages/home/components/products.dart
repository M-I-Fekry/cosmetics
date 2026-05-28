part of '../view.dart';

class _Products extends StatefulWidget {
  const _Products({super.key});

  @override
  State<_Products> createState() => _ProductsState();
}

class _ProductsState extends State<_Products> {
  List<ProductModel>? list;

  Future<void> getData() async {
    final response = await Dio().get(
      "https://cosmatics.growfet.com/api/Products",
    );
    list = ProductsData.fromJson({"list": response.data}).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top rated products',
          style: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(24),
        list == null
            ? Center(child: CupertinoActivityIndicator())
            : GridView.builder(
                itemCount: list!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 176 / 237,
                ),
                itemBuilder: (context, index) => _Item(model: list![index]),
              ),
      ],
    );
  }
}

class ProductModel {
  late final int id, stock, categoryId;
  late final num price;
  late final String nameEn, descriptionEn, imageUrl;

  ProductModel.fromjson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    nameEn = json["name_en"] ?? "";
    descriptionEn = json["description_en"] ?? "";
    price = json["price"] ?? 0;
    stock = json["stock"] ?? 0;
    imageUrl = json["image_url"] ?? "";
    categoryId = json["category_id"] ?? 0;
  }
}

class ProductsData {
  late final List<ProductModel> list;

  ProductsData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => ProductModel.fromjson(e)).toList();
  }
}
