import 'package:teste/src/src.dart';

class TextStyles {
  static final titleHomeAppBar = GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static final textFormComponent = GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w800,
    color: AppColors.grey,
  );

  static final textButtonDateHour = GoogleFonts.openSans(
    fontSize: 10,
    color: AppColors.black,
  );

  static final trTitleAlert = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.green);

  static const dateFormatAlert =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  static final trTimeAlert = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.grey);

  static final titleDescriptionAlert = GoogleFonts.openSans(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black);

  static final trDescriptionAlert = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.grey);

  static const trTitleComponent = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final dateFormatComponent = GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  static final trTimeComponent = GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 10,
    color: AppColors.grey,
  );
}
