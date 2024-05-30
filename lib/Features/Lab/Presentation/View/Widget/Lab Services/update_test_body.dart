import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Lab/Data/Models/service_model.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Get%20Lab%20Services/get_lab_services_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Services/lab_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateLabTest extends StatelessWidget {
  UpdateLabTest({
    super.key,
  });

  final TextEditingController testName = TextEditingController();
  final TextEditingController testCost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String token = BlocProvider.of<AuthCubit>(context).labModel!.token;
    ServiceModel test = BlocProvider.of<LabHelperCubit>(context).test!;
    return AlertDialog(
      title: Center(
          child: Text(
        'Update Test',
        style: Styels.textStyle24_600(context),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: testName,
            decoration: InputDecoration(
                hintText: test.name, hintStyle: const TextStyle(fontSize: 18)),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: testCost,
            decoration: InputDecoration(
                hintText: test.cost.toString(),
                hintStyle: const TextStyle(fontSize: 18)),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Cancel', style: Styels.textStyle18_600(context)),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            const SizedBox(width: 7),
            TextButton(
              onPressed: () async {
                if (testName.text.isEmpty && testCost.text.isEmpty) {
                  GoRouter.of(context).pop();
                } else if (testName.text.isNotEmpty && testCost.text.isEmpty) {
                  BlocProvider.of<LabServiceCubit>(context).updateTest(
                      token: token,
                      id: test.id!,
                      body: {'name': testName.text});
                  GoRouter.of(context).pop();
                  await BlocProvider.of<GetLabServicesCubit>(context)
                      .getMyServices(token: token);
                } else if (testCost.text.isNotEmpty && testName.text.isEmpty) {
                  BlocProvider.of<LabServiceCubit>(context).updateTest(
                      token: token,
                      id: test.id!,
                      body: {'cost': testCost.text});
                  GoRouter.of(context).pop();
                  await BlocProvider.of<GetLabServicesCubit>(context)
                      .getMyServices(token: token);
                } else {
                  BlocProvider.of<LabServiceCubit>(context).updateTest(
                      token: token,
                      id: test.id!,
                      body: {'name': testName.text, 'cost': testCost.text});
                  GoRouter.of(context).pop();
                  await BlocProvider.of<GetLabServicesCubit>(context)
                      .getMyServices(token: token);
                }
              },
              child: Text('Update', style: Styels.textStyle18_600(context)),
            ),
          ],
        ),
      ],
    );
  }
}
