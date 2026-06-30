part of '../view.dart';

class _Item extends StatelessWidget {
  const _Item({required this.title, this.destinationPage});
  final String title;
  final Widget? destinationPage;

  @override
  Widget build(BuildContext context) {
    final isLogout = title.toLowerCase() == "logout";
    final image = "${title.toLowerCase().replaceAll(" ", "_")}.svg";

    return ListTile(
      onTap: destinationPage == null
          ? null
          : () async {
              if (isLogout) {
                print("Token BEFORE logout: ${CacheHelper.token}");
                final resp = await DioHelper.sendData(path: "/api/Auth/logout");
                if (resp!.isSuccess) {
                  CacheHelper.logout();
                  print("Token AFTER logout: ${CacheHelper.token}");
                  goTo(destinationPage!);
                }
              } else {
                goTo(destinationPage!);
              }
            },
      leading: AppImage(image: image),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? const Color(0xffCD0F0F) : const Color(0xff434C6D),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: isLogout ? null : const AppImage(image: "arrow_right.svg"),
    );
  }
}
