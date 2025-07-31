import 'dart:ui';

class TabPixListTileEntity {
  final String title;
  final VoidCallback onTap;

  TabPixListTileEntity({required this.title, required this.onTap});

  @override
  bool operator ==(covariant TabPixListTileEntity other) {
    if (identical(this, other)) return true;

    return other.title == title && other.onTap == onTap;
  }

  @override
  int get hashCode => title.hashCode ^ onTap.hashCode;
}
