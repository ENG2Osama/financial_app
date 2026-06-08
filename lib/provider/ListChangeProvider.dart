import 'package:financial_app/feature/Send_mony/viewModel/sendMoneyProvider.dart';

import 'package:financial_app/feature/activities/viewmodel/activityViewModel.dart';
import 'package:financial_app/feature/auth/viewmodel/loginViewModel.dart';
import 'package:financial_app/feature/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:financial_app/feature/recive/error/viewmodel/errorViewModel.dart';
import 'package:financial_app/feature/recive/receiveMoney/viewmodel/receiveMoneyViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../feature/Setting/viewModel/notificationViewModel.dart';
import '../feature/auth/viewmodel/signUpViewModel.dart';
import '../feature/auth/viewmodel/usesViewModel.dart';
import '../feature/homePage/viewModel/homePageViewModel.dart';
import '../feature/homePage/viewModel/lankBankViewModel.dart';

class ListChangeProvider {
  static List<SingleChildWidget> ListProvider = [
    //add ChangeNotifierProvider here
    ChangeNotifierProvider(create: (context) => homePageViewModel()),
    ChangeNotifierProvider(create: (context) => OnboardingViewModel()),
    ChangeNotifierProvider(create: (context) => LoginViewModel()),
    ChangeNotifierProvider(create: (context) => userViewModel()),
    ChangeNotifierProvider(create: (context) => LoginViewModel()),
    ChangeNotifierProvider(create: (context) => SignUpViewModel()),
    ChangeNotifierProvider(create: (context) => lankBankViewModel()),
    ChangeNotifierProvider(create: (context) => notificationViewModel()),
    ChangeNotifierProvider(create: (context) => Sendmoneyprovider()),
    ChangeNotifierProvider(create: (context) => activityViewModel()),
        ChangeNotifierProvider(create: (context) => ErrorViewModel()),
            ChangeNotifierProvider(create: (context) => ReceiveMoneyViewModel()),
  ];
}
