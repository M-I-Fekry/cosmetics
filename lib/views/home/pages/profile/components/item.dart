part of '../view.dart';

class _Item extends StatelessWidget {
  const _Item({required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isLogout = title.toLowerCase() == "logout";
    final image = "${title.toLowerCase().replaceAll(" ", "_")}.svg";

    return ListTile(
      onTap: onTap,
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
