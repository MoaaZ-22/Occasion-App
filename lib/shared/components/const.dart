

import '../../modules/Login_Screen/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

void signOut(context)
{
  CacheHelper.removeUserData(
    key: 'token',
  ).then((value)
  {
    if (value!)
    {
      navigateAndFinish(
        context,
        const OccasionSmartLoginScreen(),
      );
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';