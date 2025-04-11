import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class SqfLiteButton extends StatelessWidget {
  const SqfLiteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){
      AutoRouter.of(context).push(SqfAddScreenRoute());
      
    },child: Icon(Icons.add),);
  }
}
