part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers({super.key});

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<OfferModel>? list;
  Future<void> getData() async {
    final response = await Dio().get(
      "https://cosmatics.growfet.com/api/Sliders",
    );
    list = OffersData.fromJson({"list": response.data}).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return Center(child: CupertinoActivityIndicator());
    }
    return CarouselSlider(
      options: CarouselOptions(
        height: 320.h,
        aspectRatio: 364.w / 320.h,
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: List.generate(
        list!.length,
        (index) => Padding(
          padding: EdgeInsetsDirectional.only(end: 12),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20.r),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AppImage(
                  image: list![index].imageUrl,
                  width: double.infinity,
                  height: 320.h,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE9DCD3).withValues(alpha: .8),
                  ),
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${list![index].discountPercent} OFF DISCOUNT \nCUPON CODE : ${list![index].couponCode}',
                              style: TextStyle(
                                color: Color(0xff62322D),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          AppImage(image: 'offer.svg'),
                        ],
                      ),
                      Row(
                        children: [
                          AppImage(image: 'offer.svg'),
                          Expanded(
                            child: Text(
                              '${list![index].descTitle1En}\n${list![index].descTitle2En}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Color(0xff62322D),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OfferModel {
  late final int id;
  late final num discountPercent;
  late final String couponCode, descTitle1En, descTitle2En, imageUrl;

  OfferModel.fromjson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    discountPercent = json["discount_percent"] ?? 0;
    couponCode = json["coupon_code"] ?? "";
    descTitle1En = json["description_title1_en"] ?? "";
    descTitle2En = json["description_title2_en"] ?? "";
    imageUrl = json["image_url"] ?? "";
  }
}

class OffersData {
 late List<OfferModel> list;

  OffersData.fromJson(Map<String, dynamic> json) {
    list = List
        .from(json["list"] ?? [])
        .map((e) => OfferModel.fromjson(e))
        .toList();
  }
}
