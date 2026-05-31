import 'package:financial_app/feature/homePage/model/homePageModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ListChangeProvider {
  static List<SingleChildWidget> ListProvider = [
    //add ChangeNotifierProvider here
    ChangeNotifierProvider(create: (context) => homePageModel()),
  ];
}
