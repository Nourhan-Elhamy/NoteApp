import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/app_colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.name, required this.hinttext, this.minline=1,  this.maxline=1, required this.controller});
final String name;
final String hinttext;
final int minline;
final int maxline;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: Theme.of(context).textTheme.titleMedium,),
            TextFormField(
              style: Theme.of(context).textTheme.titleMedium,
              onTapOutside: (e){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              maxLines: maxline,
              minLines: minline,
              controller: controller,
              decoration: InputDecoration(

                hintText: hinttext,
                hintStyle: Theme.of(context).textTheme.titleSmall,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
