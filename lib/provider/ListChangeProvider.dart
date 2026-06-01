import 'package:financial_app/feature/auth/viewmodel/loginViewModel.dart';
import 'package:financial_app/feature/homePage/model/homePageModel.dart';
import 'package:financial_app/feature/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ListChangeProvider {
  static List<SingleChildWidget> ListProvider = [
    //add ChangeNotifierProvider here
    ChangeNotifierProvider(create: (context) => homePageModel()),
    ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ];
}
