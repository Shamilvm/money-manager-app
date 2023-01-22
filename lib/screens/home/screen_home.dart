import 'package:flutter/material.dart';
import 'package:money_manger_app/db/category/category_db.dart';
import 'package:money_manger_app/models/category/category_model.dart';
import 'package:money_manger_app/screens/category/category_add_popup.dart';
import 'package:money_manger_app/screens/category/screen_category.dart';
import 'package:money_manger_app/screens/home/add_transaction/screen_add_transaction.dart';
import 'package:money_manger_app/screens/home/widgets/bottom_navigation.dart';
import 'package:money_manger_app/screens/transaction/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text('MONEY MANAGER'),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyMangerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add transaction');
            Navigator.of(context).pushNamed(ScreenAddTransaction.routName);
          } else {
            print('Add category');

            showCategoryAddPopup(context);

            // final _sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
