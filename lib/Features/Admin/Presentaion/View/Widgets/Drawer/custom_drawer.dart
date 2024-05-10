import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Admin/Data/Models/drawer_item.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View%20Model/cubit/admin_cubit.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/Drawer/active_drawer_item.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/Drawer/in_active_drawer_itme.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  static List<DrawerItemModel> items = [
    DrawerItemModel(title: 'Patients', icon: Assets.kDashPatient),
    DrawerItemModel(title: 'Doctors', icon: Assets.kDashDoctor),
    DrawerItemModel(title: 'Lab', icon: Assets.kDashLab),
    DrawerItemModel(title: 'Logout', icon: Assets.kDashLogout),
  ];

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.kDashPatient,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'DermaByte',
                    style: Styels.textStyle24_600(context)
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
          ),
          const Expanded(flex: 6, child: SizedBox()),
          Expanded(
              flex: 12,
              child: ListView.builder(
                itemCount: CustomDrawer.items.length,
                itemBuilder: (context, index) {
                  final item = CustomDrawer.items[index];
                  return currentIndex == index
                      ? DrawerActiveItem(
                          title: item.title,
                          icon: item.icon,
                          onTap: () {},
                        )
                      : InDrawerActiveItem(
                          title: item.title,
                          icon: item.icon,
                          onTap: () async {
                            switch (index) {
                              case 0:
                                {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                  await BlocProvider.of<AdminCubit>(context)
                                      .getAllPatientsDash(
                                          token:
                                              BlocProvider.of<AuthCubit>(context).adminModel!.token);
                                  break;
                                }
                              case 1:
                               
                                setState(() {
                                  currentIndex = index;
                                });
                                await BlocProvider.of<AdminCubit>(context)
                                    .getAllDashDoctor(
                                        token:
                                           BlocProvider.of<AuthCubit>(context).adminModel!.token);
                                break;
                              case 2:
                            
                                setState(() {
                                  currentIndex = index;
                                });
                                await BlocProvider.of<AdminCubit>(context)
                                    .getAllDashLabs(
                                        token:
                                            BlocProvider.of<AuthCubit>(context).adminModel!.token);

                                break;
                              case 3:
                                
                                setState(() {
                                  currentIndex = index;
                                });
                              default:
                              
                                break;
                            }
                          },
                        );
                },
              )),
          Expanded(
              flex: 4,
              child: Text(
                "  ${BlocProvider.of<AuthCubit>(context).adminModel!.adminModel.email}   ",
                style: Styels.textStyle14_300(context)
                    .copyWith(color: Colors.grey),
              ))
        ],
      ),
    );
  }
}
