import 'package:flutter/material.dart';
import 'package:local_events_app/models/category.dart';
import 'package:local_events_app/myconfigs/styleguide.dart';
import 'package:local_events_app/provider_states/myapp_state.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return Flexible(
      child: GestureDetector(
        onTap: () {
          //when clicked update the appState
          if (!isSelected) {
            appState.updateCategoryId(category.categoryId);
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected ? Colors.white70 : Colors.white, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: isSelected ? Colors.white : Colors.transparent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                category.icon,
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.white,
                size: 40,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                category.name,
                style:
                    isSelected ? selectedCategoryTextStyle : categoryTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
