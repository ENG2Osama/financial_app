import 'package:flutter/material.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appSizes.dart';

class customerBottomSheetLang{
 String Lang="English";
  void showBottomSheetLang(BuildContext context){
    showModalBottomSheet(context: context,
        builder: (context) =>Container(
          height: 250,
          padding: EdgeInsets.all(appSizes.padding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Language"),
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();

                  }, icon: Icon(Icons.close))
                ],),
              ListTile(
                title: Text("English",style: Theme.of(context).textTheme.bodySmall,),
                trailing:    Radio(value: 'English',groupValue: Lang,
                  activeColor: appColors.primary ,
                ),onTap: (){
                Navigator.of(context).pop();
              },
              ),
              ListTile(title:
              Text("Arabic",style: Theme.of(context).textTheme.bodySmall,),
                trailing:    Radio(value: 'value'),
                onTap: (){
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Under denelopment"
                    ,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: appColors.onSecondary
                    ),)));
                },
              ),
              ListTile(title: Text("French",style: Theme.of(context).textTheme.bodySmall,),
                  trailing:    Radio(value: 'value'),
                  onTap: (){
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: 
                    Text("Under denelopment"
                      ,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: appColors.onSecondary
                      ),)));
                  }),

            ],
          ),
        ));
  }
}