import 'package:financial_app/feature/auth/viewmodel/loginViewModel.dart';
import 'package:financial_app/feature/homePage/model/homePageModel.dart';
import 'package:financial_app/feature/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../feature/auth/viewmodel/signUpViewModel.dart';
import '../feature/auth/viewmodel/usesViewModel.dart';
import '../feature/homePage/viewModel/homePageViewModel.dart';
import '../feature/homePage/viewModel/lankBankViewModel.dart';

class ListChangeProvider {
  static List<SingleChildWidget> ListProvider = [
    //add ChangeNotifierProvider here
    ChangeNotifierProvider(create: (context) => homePageViewModel()),
    ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => userViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => SignUpViewModel()),
    ChangeNotifierProvider(create: (_) => lankBankViewModel()),
  ];
}
