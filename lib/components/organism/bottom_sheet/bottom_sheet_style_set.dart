part of 'bottom_sheet_specs.dart';

enum BottomSheetSet {
  standard,
  radio,
  delete,
  calendar,
  search,
  listTile,
  coupon;

  const BottomSheetSet();

  BottomSheetStyles get specs {
    return switch (this) {
      standard => BottomSheetSpecs.standardStyle,
      radio => BottomSheetSpecs.radioStyle,
      delete => BottomSheetSpecs.deleteStyle,
      calendar => BottomSheetSpecs.calendarStyle,
      search => BottomSheetSpecs.searchStyle,
      listTile => BottomSheetSpecs.listTileStyle,
      coupon => BottomSheetSpecs.couponStyle,
    };
  }
}
