import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Admin/Data/Models/drawer_item.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/Drawer/active_drawer_item.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/Drawer/in_active_drawer_itme.dart';
import 'package:flutter/material.dart';
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
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.kDashLogo,
                  fit: BoxFit.fill,
                ),
                Text(
                  'DermaByte',
                  style: Styels.textStyle24_600(context)
                      .copyWith(color: Colors.white),
                )
              ],
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
                          onTap: () {
                            switch (index) {
                              case 0:
                                {
                                  print('patinet');
                                  setState(() {
                                    currentIndex = index;
                                  });
                                  break;
                                }
                              case 1:
                                print('doctor');
                                setState(() {
                                  currentIndex = index;
                                });

                                break;
                              case 2:
                                print('lab');
                                setState(() {
                                  currentIndex = index;
                                });

                                break;
                              case 3:
                                print("logout");
                                setState(() {
                                  currentIndex = index;
                                });
                              default:
                                print("nothing");
                                break;
                            }
                          },
                        );
                },
              )),
          Expanded(flex: 4, child: Text("Seift470@gmail.com   ",style: Styels.textStyle14_300(context).copyWith(color: Colors.grey),))
        ],
      ),
    );
  }
}
