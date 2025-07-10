import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/controller/theme_controller.dart';
import 'package:prettyrini/feature/auth/screen/email_verification_screen.dart';
import 'package:prettyrini/feature/auth/screen/forget_pasword_screen.dart';
import 'package:prettyrini/feature/auth/screen/login_screen.dart';
import 'package:prettyrini/feature/auth/screen/code_verification_screen.dart';
import 'package:prettyrini/feature/auth/screen/role_selection_ui.dart';
import 'package:prettyrini/feature/auth/screen/sign_up_screen.dart';
import 'package:prettyrini/feature/chat/ui/chat_messaeg_list.dart';
import 'package:prettyrini/feature/chat/ui/chat_screen.dart';
import 'package:prettyrini/feature/onboarding_screen/ui/on_boarding_ui.dart';
import 'package:prettyrini/feature/post/ui/post_ui.dart';
import 'package:prettyrini/feature/user_flow/accountPage/ui/account_page.dart';
import 'package:prettyrini/feature/user_flow/cart/ui/cart_ui.dart';
import 'package:prettyrini/feature/user_flow/checkOut/ui/check_out_ui.dart';
import 'package:prettyrini/feature/user_flow/dashboard/ui/user_dashboard.dart';
import 'package:prettyrini/feature/user_flow/products/ui/product_page_ui.dart';
import 'package:prettyrini/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/const/app_colors.dart';
import 'feature/seller_edit_profile/view/seller_edit_profile.dart';
import 'feature/seller_update_product/view/seller_update_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configEasyLoading();
  await SharedPreferences.getInstance();
  Get.put(ThemeController());
  runApp(const MyApp());
}

void configEasyLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.grayColor
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..maskColor = Colors.green
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foot Fitness',
        // getPages: AppRoute.routes,
        // initialRoute: AppRoute.splashScreen,
        // builder: EasyLoading.init(),
        // home: OnboardingScreen(),
        // home: LoginScreen(),
        // home: SignUpScreen(),
        // home: RoleSelectionScreen(),
        // home: EmailVerificationScreen(),
        // home: CodeVerificationScreen(),
        // home: ForgetPaswordScreen(),
        // home: CheckoutFlow(),
        // home: AccountMainPage(),
        // home: CartScreen(),
        // home: ChatScreen(),
        // home: ChatListScreen(),
        // home: ProductListPage(),
        //home: UserDashboard(),
        //home: SellerEditProfile(),
        home: SellerUpdateProduct(),
      ),
    );
  }
}
