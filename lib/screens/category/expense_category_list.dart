import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_manger_app/db/category/category_db.dart';

import '../../models/category/category_model.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListener,
      builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _){
        return ListView.separated(
      itemBuilder: (ctx, index) {
        final Category = newlist[index];
        return Card(
          child: ListTile(
            title: Text(Category.name),
            trailing: IconButton(
              onPressed: () {
                CategoryDB.instance.deleteCategory(Category.id);
              },
              icon:const Icon(Icons.delete),
              color: Colors.red,
            ),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: newlist.length,
    );
      },
    );
  }
}
