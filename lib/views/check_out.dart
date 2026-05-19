import 'package:cosmetics/core/components/app_back.dart';
import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final companyLocation = LatLng(31.0229125, 31.3901469);
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: AppBack(paddingStart: 16),
        title: Text("CheckOut"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff29D3DA).withValues(alpha: .11),
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(20.h),
                Text(
                  "Delivery to",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(16.h),
                _Tile(
                  leadingWidget: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 60.h,
                      width: 97.w,
                      child: GoogleMap(
                        markers: markers,
                        onTap: (location) {
                          markers.add(
                            Marker(
                              markerId: MarkerId("myLocation"),
                              position: location,
                            ),
                          );
                          setState(() {});
                        },
                        initialCameraPosition: CameraPosition(
                          target: companyLocation,
                          zoom: 10,
                        ),
                        liteModeEnabled: true,
                        myLocationButtonEnabled: false,
                      ),
                    ),
                  ),
                  tiltle: "Home",
                  subTiltle: "Mansoura, 14 Porsaid St",
                ),
                Gap(40.h),
                Text(
                  "Payment Method",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(18.h),
                _Tile(leadingImage: "meza.svg", tiltle: "**** **** **** 0256"),
                Gap(12.h),
                _Tile(
                  leadingImage: "voucher.svg",
                  tiltle: "Add vaucher",
                  trailing: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.r),
                    child: AppButton(
                      text: "Apply",
                      buttonColor: Color(0xffD75D72),
                    ),
                  ),
                ),
                Gap(31.5.h),
                Text(
                  " - " * 100,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xff434C6D).withValues(alpha: .31),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(32.h),
                Text(
                  "- REVIEW PAYMENT",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(20.h),
                Text(
                  "PAYMENT SUMMARY",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(40.h),
                _DetailsText(title: "Subtotal", value: "16.100 EGP"),
                _DetailsText(title: "SHIPPING FEES", value: "TO BE CALCULATED"),
                Gap(30.h),
                Divider(color: Color(0xff73B9BB)),
                Gap(30.h),
                _DetailsText(
                  title: "TOTAL + VAT",
                  value: "16.100 EGP",
                  valueFontWeight: FontWeight.bold,
                ),
                Gap(35.h),
                AppButton(
                  text: "Order",
                  buttonColor: Color(0xffD75D72),
                  icon: "order.svg",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.tiltle,
    this.subTiltle,
    this.leadingImage,
    this.leadingWidget,
    this.trailing,
  });
  final String tiltle;
  final String? subTiltle;
  final String? leadingImage;
  final Widget? leadingWidget, trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ListTile(
        contentPadding: leadingWidget != null ? EdgeInsets.all(10.r) : null,
        leading: leadingWidget ?? AppImage(image: leadingImage ?? ""),
        title: Text(
          tiltle,
          style: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: subTiltle != null
            ? Text(
                subTiltle!,
                style: TextStyle(
                  color: const Color(0xff8E8EA9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            : null,
        trailing: trailing ?? AppImage(image: 'arrow_bottom.svg'),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xff73B9BB), width: 1.5),
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
    );
  }
}

class _DetailsText extends StatelessWidget {
  const _DetailsText({
    required this.title,
    required this.value,
    this.valueFontWeight = FontWeight.w500,
  });
  final String title, value;
  final FontWeight valueFontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Color(0xff434C6D), fontSize: 12.sp),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 12.sp,
              fontWeight: valueFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
