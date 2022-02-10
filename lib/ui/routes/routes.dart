import 'package:auto_route/auto_route.dart';
import 'package:shedistrict/ui/auth/approve_screen.dart';
import 'package:shedistrict/ui/auth/login/email_login_screen.dart';
import 'package:shedistrict/ui/auth/login/enter_otp_screen.dart';
import 'package:shedistrict/ui/auth/login/password_reset_screen.dart';
import 'package:shedistrict/ui/auth/login/phone_login_screen.dart';
import 'package:shedistrict/ui/auth/rejected_screen.dart';
import 'package:shedistrict/ui/auth/rules_screen.dart';
import 'package:shedistrict/ui/auth/login/login_option_screen.dart';
import 'package:shedistrict/ui/auth/signup/record_video_screen.dart';
import 'package:shedistrict/ui/auth/signup/signup_otp_verification_screen.dart';
import 'package:shedistrict/ui/auth/signup/signup_phone_verfication_screen.dart';
import 'package:shedistrict/ui/auth/signup/signup_screen.dart';
import 'package:shedistrict/ui/auth/signup/take_picture_screen.dart';
import 'package:shedistrict/ui/auth/signup/verfiy_yourself_screen.dart';
import 'package:shedistrict/ui/auth/why_joinus_screen.dart';
import 'package:shedistrict/ui/conversations/post_view_screen.dart';
import 'package:shedistrict/ui/conversations/widgets/conversation_comments.dart';
import 'package:shedistrict/ui/conversations/notifications_screen.dart';
import 'package:shedistrict/ui/events/rules_tips_screen.dart';
import 'package:shedistrict/ui/events/schedule_meeting_screen.dart';
import 'package:shedistrict/ui/filters/edit_preferences_screen.dart';
import 'package:shedistrict/ui/messages_and_friends/chat_screen.dart';
import 'package:shedistrict/ui/prefrences/show_favpicture_screen.dart';
import 'package:shedistrict/ui/prefrences/update_about_screen.dart';
import 'package:shedistrict/ui/profile/about_shedistrict_screen.dart';
import 'package:shedistrict/ui/profile/blocked_users_screen.dart';
import 'package:shedistrict/ui/prefrences/edit_more_about_me_screen.dart';
import 'package:shedistrict/ui/profile/edit_profile_screen.dart';
import 'package:shedistrict/ui/profile/genral_settings_screen.dart';
import 'package:shedistrict/ui/profile/message_fromceo_screen.dart';
import 'package:shedistrict/ui/profile/profile_notification.dart';
import 'package:shedistrict/ui/profile/privacy_messages_screen.dart';
import 'package:shedistrict/ui/profile/privacy_policy_screen.dart';
import 'package:shedistrict/ui/profile/privacy_profile_screen.dart';
import 'package:shedistrict/ui/profile/privacy_screen.dart';
import 'package:shedistrict/ui/profile/profile_view/profile_view_screen.dart';
import 'package:shedistrict/ui/profile/purchases_screen.dart';
import 'package:shedistrict/ui/profile/settings_screen.dart';
import 'package:shedistrict/ui/profile/sheprotects_friendlist_screen.dart';
import 'package:shedistrict/ui/profile/sheprotects_screen.dart';
import 'package:shedistrict/ui/profile/sherules_screen.dart';
import 'package:shedistrict/ui/profile/sheupdate_screen.dart';
import 'package:shedistrict/ui/profile/text_freiends_screen.dart';
import 'package:shedistrict/ui/profile/your_info.dart';
import 'package:shedistrict/ui/splash/splash_screen.dart';
import 'package:shedistrict/ui/core/welcome_screen.dart';
import 'package:shedistrict/ui/home_screen.dart';

//we are using AutoRoute genrater to handel our app routes;

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      page: WelcomeScreen,
      // initial: true, //we make intial:true to open firstly this page in our app;
    ),
    AutoRoute(
      page: HomeScreen,
      // initial: true,
    ),
    AutoRoute(
      page: LoginOptionScreen,
    ),
    AutoRoute(
      page: PhoneLoginScreen,
    ),
    AutoRoute(
      page: EmailLoginScreen,
    ),
    AutoRoute(
      page: EnterOtpScreen,
    ),
    AutoRoute(
      page: WhyJoinUsScreen,
    ),
    AutoRoute(
      page: RulesScreen,
    ),
    AutoRoute(
      page: SignupScreen,
    ),
    AutoRoute(
      page: SignupPhoneVerficationScreen,
    ),
    AutoRoute(
      page: SignUpOtpVerfication,
    ),
    AutoRoute(
      page: VerifyYourSelfScreen,
    ),
    AutoRoute(
      page: RecordVideoScreen,
    ),
    AutoRoute(
      page: TakePictureScreen,
    ),
    AutoRoute(
      page: ApprovedScreen,
    ),
    AutoRoute(
      page: RejectedScreen,
    ),
    AutoRoute(
      page: ShowYourFavPictureScreen,
    ),
    AutoRoute(
      page: UpdateAboutMeScreen,
    ),
    AutoRoute(
      page: NotificationsScreen,
    ),
    // AutoRoute(
    //   page: CreateNewPostScreen,
    // ),
    AutoRoute(
      page: EditPreferencesScreen,
    ),
    AutoRoute(
      page: ScheduleMeetingEventScreen,
    ),
    AutoRoute(
      page: RulesTipsScreen,
    ),
    AutoRoute(
      page: ChatScreen,
    ),
    AutoRoute(
      page: SettingsScreen,
    ),
    AutoRoute(
      page: GenralSettingsScreen,
    ),
    AutoRoute(
      page: SheUpdateScreen,
    ),
    AutoRoute(
      page: AboutShedistrictScreen,
    ),
    AutoRoute(
      page: SheRulesScreen,
    ),
    AutoRoute(
      page: MessageFromCEOScreen,
    ),
    AutoRoute(
      page: SheProtectsScreen,
    ),
    AutoRoute(
      page: SheProtectsFriendsListScreen,
    ),
    AutoRoute(
      page: PrivacyScreen,
    ),
    AutoRoute(
      page: PrivacyMessageScreen,
    ),
    AutoRoute(
      page: PrivacyProfileScreen,
    ),
    AutoRoute(
      page: PrivacyPolicyScreen,
    ),
    AutoRoute(
      page: EditProfileScreen,
    ),
    AutoRoute(
      page: PurchasesScreen,
    ),
    AutoRoute(
      page: BlockedUserScreen,
    ),

    AutoRoute(
      page: ProfileViewScreen,
    ),
    AutoRoute(
      page: ProfileNotification,
    ),
    AutoRoute(
      page: TextFriendsScreen,
    ),
    AutoRoute(
      page: EditMoreAboutMeScreen,
    ),
    AutoRoute(
      page: YourInfoScreen,
    ),
    AutoRoute(
      page: PasswordResetScreen,
    ),
    AutoRoute(
      page: ConversationCommentsScreen,
    ),
    AutoRoute(
      page: PostViewScreen,
    )
  ],
)
class $AppRouter {}
