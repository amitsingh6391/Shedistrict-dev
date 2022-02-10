// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i49;

import '../auth/approve_screen.dart' as _i17;
import '../auth/login/email_login_screen.dart' as _i7;
import '../auth/login/enter_otp_screen.dart' as _i8;
import '../auth/login/login_option_screen.dart' as _i5;
import '../auth/login/password_reset_screen.dart' as _i46;
import '../auth/login/phone_login_screen.dart' as _i6;
import '../auth/rejected_screen.dart' as _i18;
import '../auth/rules_screen.dart' as _i10;
import '../auth/signup/record_video_screen.dart' as _i15;
import '../auth/signup/signup_otp_verification_screen.dart' as _i13;
import '../auth/signup/signup_phone_verfication_screen.dart' as _i12;
import '../auth/signup/signup_screen.dart' as _i11;
import '../auth/signup/take_picture_screen.dart' as _i16;
import '../auth/signup/verfiy_yourself_screen.dart' as _i14;
import '../auth/why_joinus_screen.dart' as _i9;
import '../conversations/notifications_screen.dart' as _i21;
import '../conversations/post_view_screen.dart' as _i48;
import '../conversations/widgets/conversation_comments.dart' as _i47;
import '../core/welcome_screen.dart' as _i3;
import '../events/rules_tips_screen.dart' as _i24;
import '../events/schedule_meeting_screen.dart' as _i23;
import '../filters/edit_preferences_screen.dart' as _i22;
import '../home_screen.dart' as _i4;
import '../messages_and_friends/chat_screen.dart' as _i25;
import '../prefrences/edit_more_about_me_screen.dart' as _i44;
import '../prefrences/show_favpicture_screen.dart' as _i19;
import '../prefrences/update_about_screen.dart' as _i20;
import '../profile/about_shedistrict_screen.dart' as _i29;
import '../profile/blocked_users_screen.dart' as _i40;
import '../profile/edit_profile_screen.dart' as _i38;
import '../profile/genral_settings_screen.dart' as _i27;
import '../profile/message_fromceo_screen.dart' as _i31;
import '../profile/privacy_messages_screen.dart' as _i35;
import '../profile/privacy_policy_screen.dart' as _i37;
import '../profile/privacy_profile_screen.dart' as _i36;
import '../profile/privacy_screen.dart' as _i34;
import '../profile/profile_notification.dart' as _i42;
import '../profile/profile_view/profile_view_screen.dart' as _i41;
import '../profile/purchases_screen.dart' as _i39;
import '../profile/settings_screen.dart' as _i26;
import '../profile/sheprotects_friendlist_screen.dart' as _i33;
import '../profile/sheprotects_screen.dart' as _i32;
import '../profile/sherules_screen.dart' as _i30;
import '../profile/sheupdate_screen.dart' as _i28;
import '../profile/text_freiends_screen.dart' as _i43;
import '../profile/your_info.dart' as _i45;
import '../splash/splash_screen.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i2.SplashScreen());
    },
    WelcomeScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i3.WelcomeScreen());
    },
    HomeScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.HomeScreen());
    },
    LoginOptionScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.LoginOptionScreen());
    },
    PhoneLoginScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i6.PhoneLoginScreen());
    },
    EmailLoginScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i7.EmailLoginScreen());
    },
    EnterOtpScreen.name: (entry) {
      var args = entry.routeData.argsAs<EnterOtpScreenArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i8.EnterOtpScreen(args.vid, args.number, args.resendToken));
    },
    WhyJoinUsScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i9.WhyJoinUsScreen());
    },
    RulesScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i10.RulesScreen());
    },
    SignupScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i11.SignupScreen());
    },
    SignupPhoneVerficationScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i12.SignupPhoneVerficationScreen());
    },
    SignUpOtpVerfication.name: (entry) {
      var args = entry.routeData.argsAs<SignUpOtpVerficationArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i13.SignUpOtpVerfication(
              args.vid, args.number, args.resendToken));
    },
    VerifyYourSelfScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i14.VerifyYourSelfScreen());
    },
    RecordVideoScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i15.RecordVideoScreen());
    },
    TakePictureScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i16.TakePictureScreen());
    },
    ApprovedScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i17.ApprovedScreen());
    },
    RejectedScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i18.RejectedScreen());
    },
    ShowYourFavPictureScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i19.ShowYourFavPictureScreen());
    },
    UpdateAboutMeScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i20.UpdateAboutMeScreen());
    },
    NotificationsScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i21.NotificationsScreen());
    },
    EditPreferencesScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i22.EditPreferencesScreen());
    },
    ScheduleMeetingEventScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i23.ScheduleMeetingEventScreen());
    },
    RulesTipsScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i24.RulesTipsScreen());
    },
    ChatScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i25.ChatScreen());
    },
    SettingsScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i26.SettingsScreen());
    },
    GenralSettingsScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i27.GenralSettingsScreen());
    },
    SheUpdateScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i28.SheUpdateScreen());
    },
    AboutShedistrictScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i29.AboutShedistrictScreen());
    },
    SheRulesScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i30.SheRulesScreen());
    },
    MessageFromCEOScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i31.MessageFromCEOScreen());
    },
    SheProtectsScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i32.SheProtectsScreen());
    },
    SheProtectsFriendsListScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i33.SheProtectsFriendsListScreen());
    },
    PrivacyScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i34.PrivacyScreen());
    },
    PrivacyMessageScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i35.PrivacyMessageScreen());
    },
    PrivacyProfileScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i36.PrivacyProfileScreen());
    },
    PrivacyPolicyScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i37.PrivacyPolicyScreen());
    },
    EditProfileScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i38.EditProfileScreen());
    },
    PurchasesScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i39.PurchasesScreen());
    },
    BlockedUserScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i40.BlockedUserScreen());
    },
    ProfileViewScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i41.ProfileViewScreen());
    },
    ProfileNotification.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i42.ProfileNotification());
    },
    TextFriendsScreen.name: (entry) {
      var args = entry.routeData
          .argsAs<TextFriendsScreenArgs>(orElse: () => TextFriendsScreenArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i43.TextFriendsScreen(key: args.key));
    },
    EditMoreAboutMeScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i44.EditMoreAboutMeScreen());
    },
    YourInfoScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i45.YourInfoScreen());
    },
    PasswordResetScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i46.PasswordResetScreen());
    },
    ConversationCommentsScreen.name: (entry) {
      var args = entry.routeData.argsAs<ConversationCommentsScreenArgs>();
      return _i1.MaterialPageX(
          entry: entry, child: _i47.ConversationCommentsScreen(args.postId));
    },
    PostViewScreen.name: (entry) {
      var args = entry.routeData.argsAs<PostViewScreenArgs>();
      return _i1.MaterialPageX(
          entry: entry, child: _i48.PostViewScreen(args.postId));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreen.name, path: '/'),
        _i1.RouteConfig(WelcomeScreen.name, path: '/welcome-screen'),
        _i1.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i1.RouteConfig(LoginOptionScreen.name, path: '/login-option-screen'),
        _i1.RouteConfig(PhoneLoginScreen.name, path: '/phone-login-screen'),
        _i1.RouteConfig(EmailLoginScreen.name, path: '/email-login-screen'),
        _i1.RouteConfig(EnterOtpScreen.name, path: '/enter-otp-screen'),
        _i1.RouteConfig(WhyJoinUsScreen.name, path: '/why-join-us-screen'),
        _i1.RouteConfig(RulesScreen.name, path: '/rules-screen'),
        _i1.RouteConfig(SignupScreen.name, path: '/signup-screen'),
        _i1.RouteConfig(SignupPhoneVerficationScreen.name,
            path: '/signup-phone-verfication-screen'),
        _i1.RouteConfig(SignUpOtpVerfication.name,
            path: '/sign-up-otp-verfication'),
        _i1.RouteConfig(VerifyYourSelfScreen.name,
            path: '/verify-your-self-screen'),
        _i1.RouteConfig(RecordVideoScreen.name, path: '/record-video-screen'),
        _i1.RouteConfig(TakePictureScreen.name, path: '/take-picture-screen'),
        _i1.RouteConfig(ApprovedScreen.name, path: '/approved-screen'),
        _i1.RouteConfig(RejectedScreen.name, path: '/rejected-screen'),
        _i1.RouteConfig(ShowYourFavPictureScreen.name,
            path: '/show-your-fav-picture-screen'),
        _i1.RouteConfig(UpdateAboutMeScreen.name,
            path: '/update-about-me-screen'),
        _i1.RouteConfig(NotificationsScreen.name,
            path: '/notifications-screen'),
        _i1.RouteConfig(EditPreferencesScreen.name,
            path: '/edit-preferences-screen'),
        _i1.RouteConfig(ScheduleMeetingEventScreen.name,
            path: '/schedule-meeting-event-screen'),
        _i1.RouteConfig(RulesTipsScreen.name, path: '/rules-tips-screen'),
        _i1.RouteConfig(ChatScreen.name, path: '/chat-screen'),
        _i1.RouteConfig(SettingsScreen.name, path: '/settings-screen'),
        _i1.RouteConfig(GenralSettingsScreen.name,
            path: '/genral-settings-screen'),
        _i1.RouteConfig(SheUpdateScreen.name, path: '/she-update-screen'),
        _i1.RouteConfig(AboutShedistrictScreen.name,
            path: '/about-shedistrict-screen'),
        _i1.RouteConfig(SheRulesScreen.name, path: '/she-rules-screen'),
        _i1.RouteConfig(MessageFromCEOScreen.name,
            path: '/message-from-ce-oScreen'),
        _i1.RouteConfig(SheProtectsScreen.name, path: '/she-protects-screen'),
        _i1.RouteConfig(SheProtectsFriendsListScreen.name,
            path: '/she-protects-friends-list-screen'),
        _i1.RouteConfig(PrivacyScreen.name, path: '/privacy-screen'),
        _i1.RouteConfig(PrivacyMessageScreen.name,
            path: '/privacy-message-screen'),
        _i1.RouteConfig(PrivacyProfileScreen.name,
            path: '/privacy-profile-screen'),
        _i1.RouteConfig(PrivacyPolicyScreen.name,
            path: '/privacy-policy-screen'),
        _i1.RouteConfig(EditProfileScreen.name, path: '/edit-profile-screen'),
        _i1.RouteConfig(PurchasesScreen.name, path: '/purchases-screen'),
        _i1.RouteConfig(BlockedUserScreen.name, path: '/blocked-user-screen'),
        _i1.RouteConfig(ProfileViewScreen.name, path: '/profile-view-screen'),
        _i1.RouteConfig(ProfileNotification.name,
            path: '/profile-notification'),
        _i1.RouteConfig(TextFriendsScreen.name, path: '/text-friends-screen'),
        _i1.RouteConfig(EditMoreAboutMeScreen.name,
            path: '/edit-more-about-me-screen'),
        _i1.RouteConfig(YourInfoScreen.name, path: '/your-info-screen'),
        _i1.RouteConfig(PasswordResetScreen.name,
            path: '/password-reset-screen'),
        _i1.RouteConfig(ConversationCommentsScreen.name,
            path: '/conversation-comments-screen'),
        _i1.RouteConfig(PostViewScreen.name, path: '/post-view-screen')
      ];
}

class SplashScreen extends _i1.PageRouteInfo {
  const SplashScreen() : super(name, path: '/');

  static const String name = 'SplashScreen';
}

class WelcomeScreen extends _i1.PageRouteInfo {
  const WelcomeScreen() : super(name, path: '/welcome-screen');

  static const String name = 'WelcomeScreen';
}

class HomeScreen extends _i1.PageRouteInfo {
  const HomeScreen() : super(name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

class LoginOptionScreen extends _i1.PageRouteInfo {
  const LoginOptionScreen() : super(name, path: '/login-option-screen');

  static const String name = 'LoginOptionScreen';
}

class PhoneLoginScreen extends _i1.PageRouteInfo {
  const PhoneLoginScreen() : super(name, path: '/phone-login-screen');

  static const String name = 'PhoneLoginScreen';
}

class EmailLoginScreen extends _i1.PageRouteInfo {
  const EmailLoginScreen() : super(name, path: '/email-login-screen');

  static const String name = 'EmailLoginScreen';
}

class EnterOtpScreen extends _i1.PageRouteInfo<EnterOtpScreenArgs> {
  EnterOtpScreen(
      {required String vid,
      required String number,
      required String resendToken})
      : super(name,
            path: '/enter-otp-screen',
            args: EnterOtpScreenArgs(
                vid: vid, number: number, resendToken: resendToken));

  static const String name = 'EnterOtpScreen';
}

class EnterOtpScreenArgs {
  const EnterOtpScreenArgs(
      {required this.vid, required this.number, required this.resendToken});

  final String vid;

  final String number;

  final String resendToken;
}

class WhyJoinUsScreen extends _i1.PageRouteInfo {
  const WhyJoinUsScreen() : super(name, path: '/why-join-us-screen');

  static const String name = 'WhyJoinUsScreen';
}

class RulesScreen extends _i1.PageRouteInfo {
  const RulesScreen() : super(name, path: '/rules-screen');

  static const String name = 'RulesScreen';
}

class SignupScreen extends _i1.PageRouteInfo {
  const SignupScreen() : super(name, path: '/signup-screen');

  static const String name = 'SignupScreen';
}

class SignupPhoneVerficationScreen extends _i1.PageRouteInfo {
  const SignupPhoneVerficationScreen()
      : super(name, path: '/signup-phone-verfication-screen');

  static const String name = 'SignupPhoneVerficationScreen';
}

class SignUpOtpVerfication extends _i1.PageRouteInfo<SignUpOtpVerficationArgs> {
  SignUpOtpVerfication(
      {required String vid,
      required String number,
      required String resendToken})
      : super(name,
            path: '/sign-up-otp-verfication',
            args: SignUpOtpVerficationArgs(
                vid: vid, number: number, resendToken: resendToken));

  static const String name = 'SignUpOtpVerfication';
}

class SignUpOtpVerficationArgs {
  const SignUpOtpVerficationArgs(
      {required this.vid, required this.number, required this.resendToken});

  final String vid;

  final String number;

  final String resendToken;
}

class VerifyYourSelfScreen extends _i1.PageRouteInfo {
  const VerifyYourSelfScreen() : super(name, path: '/verify-your-self-screen');

  static const String name = 'VerifyYourSelfScreen';
}

class RecordVideoScreen extends _i1.PageRouteInfo {
  const RecordVideoScreen() : super(name, path: '/record-video-screen');

  static const String name = 'RecordVideoScreen';
}

class TakePictureScreen extends _i1.PageRouteInfo {
  const TakePictureScreen() : super(name, path: '/take-picture-screen');

  static const String name = 'TakePictureScreen';
}

class ApprovedScreen extends _i1.PageRouteInfo {
  const ApprovedScreen() : super(name, path: '/approved-screen');

  static const String name = 'ApprovedScreen';
}

class RejectedScreen extends _i1.PageRouteInfo {
  const RejectedScreen() : super(name, path: '/rejected-screen');

  static const String name = 'RejectedScreen';
}

class ShowYourFavPictureScreen extends _i1.PageRouteInfo {
  const ShowYourFavPictureScreen()
      : super(name, path: '/show-your-fav-picture-screen');

  static const String name = 'ShowYourFavPictureScreen';
}

class UpdateAboutMeScreen extends _i1.PageRouteInfo {
  const UpdateAboutMeScreen() : super(name, path: '/update-about-me-screen');

  static const String name = 'UpdateAboutMeScreen';
}

class NotificationsScreen extends _i1.PageRouteInfo {
  const NotificationsScreen() : super(name, path: '/notifications-screen');

  static const String name = 'NotificationsScreen';
}

class EditPreferencesScreen extends _i1.PageRouteInfo {
  const EditPreferencesScreen() : super(name, path: '/edit-preferences-screen');

  static const String name = 'EditPreferencesScreen';
}

class ScheduleMeetingEventScreen extends _i1.PageRouteInfo {
  const ScheduleMeetingEventScreen()
      : super(name, path: '/schedule-meeting-event-screen');

  static const String name = 'ScheduleMeetingEventScreen';
}

class RulesTipsScreen extends _i1.PageRouteInfo {
  const RulesTipsScreen() : super(name, path: '/rules-tips-screen');

  static const String name = 'RulesTipsScreen';
}

class ChatScreen extends _i1.PageRouteInfo {
  const ChatScreen() : super(name, path: '/chat-screen');

  static const String name = 'ChatScreen';
}

class SettingsScreen extends _i1.PageRouteInfo {
  const SettingsScreen() : super(name, path: '/settings-screen');

  static const String name = 'SettingsScreen';
}

class GenralSettingsScreen extends _i1.PageRouteInfo {
  const GenralSettingsScreen() : super(name, path: '/genral-settings-screen');

  static const String name = 'GenralSettingsScreen';
}

class SheUpdateScreen extends _i1.PageRouteInfo {
  const SheUpdateScreen() : super(name, path: '/she-update-screen');

  static const String name = 'SheUpdateScreen';
}

class AboutShedistrictScreen extends _i1.PageRouteInfo {
  const AboutShedistrictScreen()
      : super(name, path: '/about-shedistrict-screen');

  static const String name = 'AboutShedistrictScreen';
}

class SheRulesScreen extends _i1.PageRouteInfo {
  const SheRulesScreen() : super(name, path: '/she-rules-screen');

  static const String name = 'SheRulesScreen';
}

class MessageFromCEOScreen extends _i1.PageRouteInfo {
  const MessageFromCEOScreen() : super(name, path: '/message-from-ce-oScreen');

  static const String name = 'MessageFromCEOScreen';
}

class SheProtectsScreen extends _i1.PageRouteInfo {
  const SheProtectsScreen() : super(name, path: '/she-protects-screen');

  static const String name = 'SheProtectsScreen';
}

class SheProtectsFriendsListScreen extends _i1.PageRouteInfo {
  const SheProtectsFriendsListScreen()
      : super(name, path: '/she-protects-friends-list-screen');

  static const String name = 'SheProtectsFriendsListScreen';
}

class PrivacyScreen extends _i1.PageRouteInfo {
  const PrivacyScreen() : super(name, path: '/privacy-screen');

  static const String name = 'PrivacyScreen';
}

class PrivacyMessageScreen extends _i1.PageRouteInfo {
  const PrivacyMessageScreen() : super(name, path: '/privacy-message-screen');

  static const String name = 'PrivacyMessageScreen';
}

class PrivacyProfileScreen extends _i1.PageRouteInfo {
  const PrivacyProfileScreen() : super(name, path: '/privacy-profile-screen');

  static const String name = 'PrivacyProfileScreen';
}

class PrivacyPolicyScreen extends _i1.PageRouteInfo {
  const PrivacyPolicyScreen() : super(name, path: '/privacy-policy-screen');

  static const String name = 'PrivacyPolicyScreen';
}

class EditProfileScreen extends _i1.PageRouteInfo {
  const EditProfileScreen() : super(name, path: '/edit-profile-screen');

  static const String name = 'EditProfileScreen';
}

class PurchasesScreen extends _i1.PageRouteInfo {
  const PurchasesScreen() : super(name, path: '/purchases-screen');

  static const String name = 'PurchasesScreen';
}

class BlockedUserScreen extends _i1.PageRouteInfo {
  const BlockedUserScreen() : super(name, path: '/blocked-user-screen');

  static const String name = 'BlockedUserScreen';
}

class ProfileViewScreen extends _i1.PageRouteInfo {
  const ProfileViewScreen() : super(name, path: '/profile-view-screen');

  static const String name = 'ProfileViewScreen';
}

class ProfileNotification extends _i1.PageRouteInfo {
  const ProfileNotification() : super(name, path: '/profile-notification');

  static const String name = 'ProfileNotification';
}

class TextFriendsScreen extends _i1.PageRouteInfo<TextFriendsScreenArgs> {
  TextFriendsScreen({_i49.Key? key})
      : super(name,
            path: '/text-friends-screen',
            args: TextFriendsScreenArgs(key: key));

  static const String name = 'TextFriendsScreen';
}

class TextFriendsScreenArgs {
  const TextFriendsScreenArgs({this.key});

  final _i49.Key? key;
}

class EditMoreAboutMeScreen extends _i1.PageRouteInfo {
  const EditMoreAboutMeScreen()
      : super(name, path: '/edit-more-about-me-screen');

  static const String name = 'EditMoreAboutMeScreen';
}

class YourInfoScreen extends _i1.PageRouteInfo {
  const YourInfoScreen() : super(name, path: '/your-info-screen');

  static const String name = 'YourInfoScreen';
}

class PasswordResetScreen extends _i1.PageRouteInfo {
  const PasswordResetScreen() : super(name, path: '/password-reset-screen');

  static const String name = 'PasswordResetScreen';
}

class ConversationCommentsScreen
    extends _i1.PageRouteInfo<ConversationCommentsScreenArgs> {
  ConversationCommentsScreen({required String postId})
      : super(name,
            path: '/conversation-comments-screen',
            args: ConversationCommentsScreenArgs(postId: postId));

  static const String name = 'ConversationCommentsScreen';
}

class ConversationCommentsScreenArgs {
  const ConversationCommentsScreenArgs({required this.postId});

  final String postId;
}

class PostViewScreen extends _i1.PageRouteInfo<PostViewScreenArgs> {
  PostViewScreen({required String postId})
      : super(name,
            path: '/post-view-screen',
            args: PostViewScreenArgs(postId: postId));

  static const String name = 'PostViewScreen';
}

class PostViewScreenArgs {
  const PostViewScreenArgs({required this.postId});

  final String postId;
}
