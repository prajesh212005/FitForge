import 'package:dots_indicator/dots_indicator.dart';
import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/data_constants.dart';
import 'package:fitness_flutter/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:fitness_flutter/screens/sign_in/page/sign_in_page.dart';
import 'package:fitness_flutter/screens/sign_up/page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorConstants.background, ColorConstants.backgroundAlt],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
              child: _createTopBand(context),
            ),
            Expanded(
              flex: 6,
              child: _createPageView(bloc.pageController, bloc),
            ),
            _createStatic(bloc),
          ],
        ),
      ),
    );
  }

  Widget _createTopBand(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PULSEFLOW',
                style: TextStyle(
                  color: ColorConstants.mint,
                  fontSize: 12,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Train with intent.',
                style: TextStyle(
                  
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        _TopActionButton(
          label: 'Login',
          filled: false,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SignInPage()),
            );
          },
        ),
        const SizedBox(width: 10),
        _TopActionButton(
          label: 'Sign Up',
          filled: true,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SignUpPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _createPageView(PageController controller, OnboardingBloc bloc) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: DataConstants.onboardingTiles,
      onPageChanged: (index) {
        bloc.add(PageSwipedEvent(index: index));
      },
    );
  }

  Widget _createStatic(OnboardingBloc bloc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        buildWhen: (_, currState) => currState is PageChangedState,
        builder: (context, state) {
          return DotsIndicator(
            dotsCount: 3,
            position: bloc.pageIndex.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(8),
              activeSize: const Size(22, 8),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
              color: ColorConstants.surfaceBorder,
              activeColor: ColorConstants.mint,
            ),
          );
        },
      ),
    );
  }
}

class _TopActionButton extends StatelessWidget {
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _TopActionButton({required this.label, required this.filled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: filled ? ColorConstants.primaryColor : Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: filled ? ColorConstants.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: filled ? Colors.transparent : ColorConstants.surfaceBorder),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: filled ? Colors.white : ColorConstants.whiteOnDark,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
