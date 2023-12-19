
import 'package:social_app/cubit/cubit.dart';

String langSalla(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Salla';
  }
  else
  {
    return'سلة';
  }

}

String langNewProduct(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'New Product';
  }
  else
  {
    return'منتجات جديدة';
  }

}

String langHome(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Home';
  }
  else
  {
    return'الرئيسية';
  }
}

String langCategories(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Categories';
  }
  else
  {
    return'المجموعات';
  }
}


String langFavorites(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Favorites';
  }
  else
  {
    return'المُفضلة';
  }
}

String langSettings(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Settings';
  }
  else
  {
    return'الأعدادات';
  }
}

String langDarkMode(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'DarkMode';
  }
  else
  {
    return'الوضع الليلي';
  }
}

String langLanguage(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Language';
  }
  else
  {
    return'اللغة';
  }
}

String langEditProfile(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Edit Profile';
  }
  else
  {
    return'تعديل بيانات الملف الشخصي';
  }
}

String langAboutDeveloper(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'About Developer';
  }
  else
  {
    return'معلومات عن مطور التطبيق';
  }
}

String langLogOut(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Logout';
  }
  else
  {
    return'تسجيل الخروج';
  }
}

String langLogIn(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Login';
  }
  else
  {
    return'تسجيل الدخول';
  }
}

String langUserName(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'User Name';
  }
  else
  {
    return'اسم المُستخدم';
  }
}

String langEnterYourUserName(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Please enter your user name';
  }
  else
  {
    return'برجاء ادخال اسم المستخدم';
  }
}


String langPhone(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Phone';
  }
  else
  {
    return'رقم الهاتف';
  }
}

String langEnterYourPhone(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Please enter your phone';
  }
  else
  {
    return'برجاء ادخال رقم المستخدم';
  }
}

String langEmailAddress(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Email Address';
  }
  else
  {
    return'عنوان البريد الألكتروني';
  }
}

String langEnterYourEmailAddress(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Please enter your Email Address';
  }
  else
  {
    return'برجاء ادخال عنوان البريد الألكتروني';
  }
}

String langPassword(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Password';
  }
  else
  {
    return'كلمة المرور';
  }
}

String langEnterYourPassword(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Please enter your password';
  }
  else
  {
    return'برجاء ادخال كلمة المرور';
  }
}

String langInCart(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'In Cart';
  }
  else
  {
    return'السلة';
  }
}

String langTotal(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Total :';
  }
  else
  {
    return'المجموع :';
  }
}

String langRegister(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Register';
  }
  else
  {
    return'تسجيل حساب جديد';
  }
}

String langSearch(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Search';
  }
  else
  {
    return'بحث';
  }
}

String langUpdate(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Update';
  }
  else
  {
    return'تحديث البيانات';
  }
}

String langDiscount(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Discount';
  }
  else
  {
    return'خصم لفترة محدودة';
  }
}

String langConnectionError(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Connection Error';
  }
  else
  {
    return'لا يوجد اتصال بالأنترنت';
  }
}

String langConnectionErrorDescription(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Please check your internet connection !';
  }
  else
  {
    return'برجاء التأكد من اتصالك بالأنترنت و إعادة المحاولة';
  }
}

String langreTry(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'RETRY';
  }
  else
  {
    return'إعادة المحاولة';
  }
}

String langAddedSuccessfully(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Added Successfully';
  }
  else
  {
    return'تم إضافة المُنتج الي السلة';
  }
}


String langPleaseWait(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Please Wait';
  }
  else
  {
    return'برجاء الأنتظار';
  }
}

String langThereIsNoItems(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'There is no items in your cart !';
  }
  else
  {
    return'لا يوجد اصناف';
  }
}

String langLoginNowToBrowseOurHotOffers(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Login now to communicate with friends ';
  }
  else
  {
    return'سجل الأن للتواصل مع الأصدقاء';
  }
}

String langDontHaveAnAccount(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'Don\'t have an account?';
  }
  else
  {
    return'مُستخدم جديد ؟';
  }
}

String langNoFavoritesFound(context)
{
  if(AppCubit.get(context).isEnglish)
  {
    return'No Fevorites Found !';
  }
  else
  {
    return'لا يوجد اصناف بالمفضلة !';
  }
}

// String langLoginError(context)
// {
//   if(AppCubit.get(context).isEnglish)
//   {
//     return'Login faild , Please check your email address and password';
//   }
//   else
//   {
//     return'فشل تسجيل الدخول , برجاء التأكد من البريد الألكتروني و كلمة المرور و إعادة المحاولة';
//   }
// }