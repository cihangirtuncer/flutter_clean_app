import 'package:flutter/material.dart';
import 'package:flutter_clean_app_examples/feature/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class UserViewWidget extends StatefulWidget {
  UserViewWidget({Key? key}) : super(key: key);

  @override
  State<UserViewWidget> createState() => _UserViewWidgetState();
}

class _UserViewWidgetState extends State<UserViewWidget> {
  late UserViewModel userViewModel;
  @override
  void initState() {
    super.initState();
    userViewModel = UserViewModel();
    userViewModel.fetchItem();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: userViewModel,
      child: Consumer<UserViewModel>(
          builder: ((context, value, child) => bodyView(context))),
    );
  }

  Scaffold bodyView(BuildContext context) {
    return Scaffold(
      body: 
          ListView.builder(
            itemCount: userViewModel.userModel.length,
          itemBuilder: ((context, index) {
            return Card(
                child: ListTile(
                  leading: Container(
                    width: 10,
                  ),
                  // leading: Container(
                  // color: Color(int.parse('FF${resourceModel!.data![index].color!.replaceAll('#', '')}', radix: 16))),
                  title: Text(userViewModel.userModel[index].name.toString()),
                ),
              );
          }),
        )

    );
  }
}