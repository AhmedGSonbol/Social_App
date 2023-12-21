import 'package:social_app/Modules/login/login_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Network/Local/Cach_Helper.dart';


void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

void signOut(context)
{
  CachHelper.removeData(key: token).then((value)
  {
    if(value!)
    {
      // AppCubit.get(context).current_index = 0;
      CachHelper.removeData(key: 'token');
      navAndFinishTo(context, Login_Screen());
    }
  });
}

String token = '';

String? uId;