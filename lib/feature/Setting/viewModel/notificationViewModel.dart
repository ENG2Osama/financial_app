import 'package:financial_app/feature/Setting/model/notificationModel.dart';
import 'package:flutter/cupertino.dart';

class notificationViewModel  extends ChangeNotifier{
  notificationModel _notificationModel =notificationModel();
  get notification=>_notificationModel.notification;
  void addNotification({required String title,required String subtitle, required DateTime timeProsses}){
    _notificationModel.notification.add({
      "title":title,
      "subtitle":subtitle,
      "time":timeProsses,
    });
    notifyListeners();

  }
  String foundTimeAge(DateTime time){
    DateTime? now=DateTime.now();
    Duration timeDifference=now.difference(time);
    if(timeDifference.inMinutes<60){
    return  "${timeDifference.inMinutes} min";
    }
    else if(timeDifference.inMinutes>=60&&timeDifference.inMinutes<=1440){
    return "${timeDifference.inHours} h";
    }
    else if(timeDifference.inMinutes>=1440&&timeDifference.inMinutes<=10080){
     return"${timeDifference.inDays} d";

    } else if(timeDifference.inMinutes>=10080&&timeDifference.inMinutes<=43200){
     return "${timeDifference.inDays~/7} w";

    }else if(timeDifference.inMinutes>=43200&&timeDifference.inMinutes<=518400){
     return "${timeDifference.inDays~/30} mo";

    }else if(timeDifference.inMinutes>=525600){
     return "${timeDifference.inDays~/365} y";

    }
    return "0";


  }






}