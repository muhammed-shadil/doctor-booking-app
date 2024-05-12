import 'package:doctors_book_app/controller/onboarding/bloc/onbording_bloc.dart';
import 'package:doctors_book_app/view/screens/login_screen.dart';
import 'package:doctors_book_app/view/widgets/onbordwidgets/customindicator.dart';
import 'package:doctors_book_app/view/widgets/onbordwidgets/onboarding_button.dart';
import 'package:doctors_book_app/view/widgets/onbordwidgets/onboardingmainwidget.dart';
import 'package:doctors_book_app/view/widgets/onbordwidgets/onbordingdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnbordingBloc(),
      child: const OnboadingScreen(),
    );
  }
}

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  PageController pageController = PageController(initialPage: 0);

  // int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnbordingBloc>(context);
    return Scaffold(body:
        SingleChildScrollView(child: BlocBuilder<OnbordingBloc, OnbordingState>(
      builder: (context, state) {
        return Column(children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      state.page = value;

                      bloc.add(OnbordingEvent());
                      print('page index: ${state.page}');
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return OnbordingMainWidget(
                        onBoarding: onboardingList[index],
                        index: index,
                      );
                    }),
              ),
              Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.07,
                  left: MediaQuery.of(context).size.width * 0.18,
                  child: SizedBox(
                    child: Column(
                      children: [
                        CustomIndicator(position: state.page),
                        const SizedBox(height: 13),
                        CustomOutlinedButton(
                          width: 130,
                          onTap: () {
                            if (state.page == (onboardingList.length - 1)) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const LoginscreenWrapper()));
                            } else {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          text: state.page == (onboardingList.length - 1)
                              ? 'Get Started'
                              : 'Next',
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ]);
      },
    )));
  }
}
