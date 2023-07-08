import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:nuntium/feature/home/home_view.dart';
import 'package:nuntium/feature/splash/splash_provider.dart';
import 'package:nuntium/product/constants/index.dart';
import 'package:nuntium/product/enums/image_enum.dart';
import 'package:nuntium/product/widgets/text/wavy_text.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with _SplashViewListenMixin {
  final splashProvider =
      StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    super.initState();

    ref.read(splashProvider.notifier).checkApplicationVersion(''.ext.version);
  }

  @override
  Widget build(BuildContext context) {
    listenAndNavigate(splashProvider);

    return Scaffold(
      backgroundColor: ColorConstant.purpleDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConstants.appIcon.toImage,
            Padding(
              padding: context.padding.onlyTopMedium,
              child: const WavyBoldText(title: StringConstant.appName),
            )
          ],
        ),
      ),
    );
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashView> {
  void listenAndNavigate(
    StateNotifierProvider<SplashProvider, SplashState> provider,
  ) {
    ref.listen(provider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        if (next.isRedirectHome!) {
          context.route.navigateToPage(const HomeView());
        } else {}
      }
    });
  }
}
