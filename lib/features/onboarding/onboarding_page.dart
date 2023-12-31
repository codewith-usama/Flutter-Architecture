import 'package:architecture/features/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_cubit.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingCubit cubit;

  const OnboardingPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingPage> {
  OnboardingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon.png',
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            'Welcome to flutter Xchange',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Catch events, find talent, get gired!',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                onPressed: cubit.onTapGoogleSigin,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      state as OnboardingState;
                      if (state.isLoading) {
                        return SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        );
                      }
                      return const Text('Continue with Google');
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
