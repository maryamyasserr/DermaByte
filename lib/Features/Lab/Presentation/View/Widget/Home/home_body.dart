import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/request_card.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Request%20Cubit/lab_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LabRequestCubit>(context)
        .getLabRequests(id: '65dc8fabb271f785c0e3c139');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Requests",
                  style:
                      Styels.textStyle24_600(context).copyWith(fontSize: 30)),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          BlocBuilder<LabRequestCubit, LabRequestState>(
              builder: (context, state) {
            if (state is LabRequestFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else if (state is LabRequestSuccess) {
              return Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.labRequests.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: RequestCard(
                            iconCard: Assets.kAvatar,
                            cardSubTitle:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            cardTitle:
                                state.labRequests[index].patient!.firstName ??
                                    'No Patient Name',
                            onPressed: () {
                              GoRouter.of(context).push(AppRoutes.kRequestBody);
                            },
                            textButton: "View",
                          ),
                        );
                      }));
            } else {
              return const LoadingIndicator(color: AppColors.kPrimaryColor);
            }
          })
        ],
      ),
    );
  }
}
