// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `By continuing with the services above, you agree to`
  String get term_and_privacy_message {
    return Intl.message(
      'By continuing with the services above, you agree to',
      name: 'term_and_privacy_message',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of service`
  String get terms_of_service {
    return Intl.message(
      'Terms of service',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get home_screen {
    return Intl.message(
      'Home Screen',
      name: 'home_screen',
      desc: '',
      args: [],
    );
  }

  /// `Guide Screen`
  String get guide_screen {
    return Intl.message(
      'Guide Screen',
      name: 'guide_screen',
      desc: '',
      args: [],
    );
  }

  /// `Report Screen`
  String get report_screen {
    return Intl.message(
      'Report Screen',
      name: 'report_screen',
      desc: '',
      args: [],
    );
  }

  /// `Setting Screen`
  String get setting_screen {
    return Intl.message(
      'Setting Screen',
      name: 'setting_screen',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navigation_home {
    return Intl.message(
      'Home',
      name: 'navigation_home',
      desc: '',
      args: [],
    );
  }

  /// `Guide`
  String get navigation_guide {
    return Intl.message(
      'Guide',
      name: 'navigation_guide',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get navigation_report {
    return Intl.message(
      'Report',
      name: 'navigation_report',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get navigation_setting {
    return Intl.message(
      'Setting',
      name: 'navigation_setting',
      desc: '',
      args: [],
    );
  }

  /// `Which timer is suitable for your mood now?`
  String get home_title {
    return Intl.message(
      'Which timer is suitable for your mood now?',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `Add my own timer`
  String get add_my_own_theme {
    return Intl.message(
      'Add my own timer',
      name: 'add_my_own_theme',
      desc: '',
      args: [],
    );
  }

  /// `{min} mins`
  String mins(Object min) {
    return Intl.message(
      '$min mins',
      name: 'mins',
      desc: '',
      args: [min],
    );
  }

  /// `Every {min} mins with {songName}`
  String every_mins(Object min, Object songName) {
    return Intl.message(
      'Every $min mins with $songName',
      name: 'every_mins',
      desc: '',
      args: [min, songName],
    );
  }

  /// `Access other features from the menu`
  String get tutorial_bottom_nav_guide {
    return Intl.message(
      'Access other features from the menu',
      name: 'tutorial_bottom_nav_guide',
      desc: '',
      args: [],
    );
  }

  /// `Set up a timer with your desired timing,`
  String get tutorial_home_and_theme_guide_1 {
    return Intl.message(
      'Set up a timer with your desired timing,',
      name: 'tutorial_home_and_theme_guide_1',
      desc: '',
      args: [],
    );
  }

  /// `favorite sound by yourself`
  String get tutorial_home_and_theme_guide_2 {
    return Intl.message(
      'favorite sound by yourself',
      name: 'tutorial_home_and_theme_guide_2',
      desc: '',
      args: [],
    );
  }

  /// `Select favorite timer, press Play button to start meditating`
  String get tutorial_play_botton_guide {
    return Intl.message(
      'Select favorite timer, press Play button to start meditating',
      name: 'tutorial_play_botton_guide',
      desc: '',
      args: [],
    );
  }

  /// `Ambient Sounds`
  String get ambient_sounds {
    return Intl.message(
      'Ambient Sounds',
      name: 'ambient_sounds',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound {
    return Intl.message(
      'Sound',
      name: 'sound',
      desc: '',
      args: [],
    );
  }

  /// `Add My Timer`
  String get add_my_theme {
    return Intl.message(
      'Add My Timer',
      name: 'add_my_theme',
      desc: '',
      args: [],
    );
  }

  /// `Interval Bell`
  String get interval_bell {
    return Intl.message(
      'Interval Bell',
      name: 'interval_bell',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name`
  String get enter_name {
    return Intl.message(
      'Enter Name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Save Timer`
  String get save_theme {
    return Intl.message(
      'Save Timer',
      name: 'save_theme',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Timer Name`
  String get theme_name {
    return Intl.message(
      'Timer Name',
      name: 'theme_name',
      desc: '',
      args: [],
    );
  }

  /// `Select Sound`
  String get select_sound {
    return Intl.message(
      'Select Sound',
      name: 'select_sound',
      desc: '',
      args: [],
    );
  }

  /// `Interval Bell Sound`
  String get interval_bell_sound {
    return Intl.message(
      'Interval Bell Sound',
      name: 'interval_bell_sound',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Select Music`
  String get select_music {
    return Intl.message(
      'Select Music',
      name: 'select_music',
      desc: '',
      args: [],
    );
  }

  /// `Paused`
  String get paused {
    return Intl.message(
      'Paused',
      name: 'paused',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Now`
  String get upgrade_now {
    return Intl.message(
      'Upgrade Now',
      name: 'upgrade_now',
      desc: '',
      args: [],
    );
  }

  /// `To access more music, upgrade your plan`
  String get upgrade_message {
    return Intl.message(
      'To access more music, upgrade your plan',
      name: 'upgrade_message',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Premium Plan`
  String get upgrade_premium_plan {
    return Intl.message(
      'Upgrade Premium Plan',
      name: 'upgrade_premium_plan',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Review Us`
  String get review_us {
    return Intl.message(
      'Review Us',
      name: 'review_us',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message(
      'Premium',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `Sad`
  String get feeling_sad {
    return Intl.message(
      'Sad',
      name: 'feeling_sad',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get feeling_normal {
    return Intl.message(
      'Normal',
      name: 'feeling_normal',
      desc: '',
      args: [],
    );
  }

  /// `Happy`
  String get feeling_happy {
    return Intl.message(
      'Happy',
      name: 'feeling_happy',
      desc: '',
      args: [],
    );
  }

  /// `Excited`
  String get feeling_excited {
    return Intl.message(
      'Excited',
      name: 'feeling_excited',
      desc: '',
      args: [],
    );
  }

  /// `How are you feeling after meditation?`
  String get feeling_message {
    return Intl.message(
      'How are you feeling after meditation?',
      name: 'feeling_message',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get survey_send {
    return Intl.message(
      'Send',
      name: 'survey_send',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get survey_submit {
    return Intl.message(
      'Submit',
      name: 'survey_submit',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your time!`
  String get survey_toast {
    return Intl.message(
      'Thank you for your time!',
      name: 'survey_toast',
      desc: '',
      args: [],
    );
  }

  /// `We offer a Premium plan with`
  String get title_bullet_list {
    return Intl.message(
      'We offer a Premium plan with',
      name: 'title_bullet_list',
      desc: '',
      args: [],
    );
  }

  /// `Have more timers`
  String get describe_plan_1 {
    return Intl.message(
      'Have more timers',
      name: 'describe_plan_1',
      desc: '',
      args: [],
    );
  }

  /// `Customize timers by yourself`
  String get describe_plan_2 {
    return Intl.message(
      'Customize timers by yourself',
      name: 'describe_plan_2',
      desc: '',
      args: [],
    );
  }

  /// `Have more music`
  String get describe_plan_3 {
    return Intl.message(
      'Have more music',
      name: 'describe_plan_3',
      desc: '',
      args: [],
    );
  }

  /// `Add music from your device`
  String get describe_plan_4 {
    return Intl.message(
      'Add music from your device',
      name: 'describe_plan_4',
      desc: '',
      args: [],
    );
  }

  /// `Get more premium guides`
  String get describe_plan_5 {
    return Intl.message(
      'Get more premium guides',
      name: 'describe_plan_5',
      desc: '',
      args: [],
    );
  }

  /// `Your purchase was successful`
  String get your_purchase_was_successful {
    return Intl.message(
      'Your purchase was successful',
      name: 'your_purchase_was_successful',
      desc: '',
      args: [],
    );
  }

  /// `Ad removal`
  String get describe_plan_6 {
    return Intl.message(
      'Ad removal',
      name: 'describe_plan_6',
      desc: '',
      args: [],
    );
  }

  /// `Your subscribed plan`
  String get your_subscribed_plan {
    return Intl.message(
      'Your subscribed plan',
      name: 'your_subscribed_plan',
      desc: '',
      args: [],
    );
  }

  /// `Select a plan`
  String get select_a_plan {
    return Intl.message(
      'Select a plan',
      name: 'select_a_plan',
      desc: '',
      args: [],
    );
  }

  /// `Best Value`
  String get best_value {
    return Intl.message(
      'Best Value',
      name: 'best_value',
      desc: '',
      args: [],
    );
  }

  /// `Most Popular`
  String get most_popular {
    return Intl.message(
      'Most Popular',
      name: 'most_popular',
      desc: '',
      args: [],
    );
  }

  /// `Payment error for purchased product`
  String get get_error_when_get_product {
    return Intl.message(
      'Payment error for purchased product',
      name: 'get_error_when_get_product',
      desc: '',
      args: [],
    );
  }

  /// ` You got`
  String get report_message_1 {
    return Intl.message(
      ' You got',
      name: 'report_message_1',
      desc: '',
      args: [],
    );
  }

  /// ` streak meditation! `
  String get report_message_2 {
    return Intl.message(
      ' streak meditation! ',
      name: 'report_message_2',
      desc: '',
      args: [],
    );
  }

  /// `This product can not find on the app store`
  String get can_not_get_product_on_the_store {
    return Intl.message(
      'This product can not find on the app store',
      name: 'can_not_get_product_on_the_store',
      desc: '',
      args: [],
    );
  }

  /// `Mins`
  String get min {
    return Intl.message(
      'Mins',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Do you have a suggestion or found a bug? We would like to hear your feedback to improve our application.`
  String get message_feedback {
    return Intl.message(
      'Do you have a suggestion or found a bug? We would like to hear your feedback to improve our application.',
      name: 'message_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Enter your feedback here!`
  String get thought_feedback {
    return Intl.message(
      'Enter your feedback here!',
      name: 'thought_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get thought_email {
    return Intl.message(
      'Enter Email',
      name: 'thought_email',
      desc: '',
      args: [],
    );
  }

  /// `Subscription Dialog`
  String get subscription_dialog {
    return Intl.message(
      'Subscription Dialog',
      name: 'subscription_dialog',
      desc: '',
      args: [],
    );
  }

  /// `Submit Feedback`
  String get feedback_submit {
    return Intl.message(
      'Submit Feedback',
      name: 'feedback_submit',
      desc: '',
      args: [],
    );
  }

  /// `Feedback sent! Thank you for your time!`
  String get feedback_toast {
    return Intl.message(
      'Feedback sent! Thank you for your time!',
      name: 'feedback_toast',
      desc: '',
      args: [],
    );
  }

  /// `Something Wrong!`
  String get toast_error {
    return Intl.message(
      'Something Wrong!',
      name: 'toast_error',
      desc: '',
      args: [],
    );
  }

  /// `You have completed the installation`
  String get you_have_completed_the_installation {
    return Intl.message(
      'You have completed the installation',
      name: 'you_have_completed_the_installation',
      desc: '',
      args: [],
    );
  }

  /// `Please select sound`
  String get please_select_sound {
    return Intl.message(
      'Please select sound',
      name: 'please_select_sound',
      desc: '',
      args: [],
    );
  }

  /// `Please select music`
  String get please_select_music {
    return Intl.message(
      'Please select music',
      name: 'please_select_music',
      desc: '',
      args: [],
    );
  }

  /// `Please enter timer name`
  String get Please_enter_theme_name {
    return Intl.message(
      'Please enter timer name',
      name: 'Please_enter_theme_name',
      desc: '',
      args: [],
    );
  }

  /// `Create meditation timer failed`
  String get create_meditation_theme_failed {
    return Intl.message(
      'Create meditation timer failed',
      name: 'create_meditation_theme_failed',
      desc: '',
      args: [],
    );
  }

  /// `Please select ambient sounds`
  String get please_select_ambient_sounds {
    return Intl.message(
      'Please select ambient sounds',
      name: 'please_select_ambient_sounds',
      desc: '',
      args: [],
    );
  }

  /// `Get list meditation timer failed`
  String get get_list_meditation_theme_failed {
    return Intl.message(
      'Get list meditation timer failed',
      name: 'get_list_meditation_theme_failed',
      desc: '',
      args: [],
    );
  }

  /// `Get list music failed`
  String get get_list_music_failed {
    return Intl.message(
      'Get list music failed',
      name: 'get_list_music_failed',
      desc: '',
      args: [],
    );
  }

  /// `Save up to 30% per year`
  String get save_up_to_30_per_year {
    return Intl.message(
      'Save up to 30% per year',
      name: 'save_up_to_30_per_year',
      desc: '',
      args: [],
    );
  }

  /// `Save 10% per 3 months`
  String get save_10_per_3_months {
    return Intl.message(
      'Save 10% per 3 months',
      name: 'save_10_per_3_months',
      desc: '',
      args: [],
    );
  }

  /// `Add music from device`
  String get add_music_from_device {
    return Intl.message(
      'Add music from device',
      name: 'add_music_from_device',
      desc: '',
      args: [],
    );
  }

  /// `You’ve subscribed this plan since {date}.`
  String subscribed_plan(Object date) {
    return Intl.message(
      'You’ve subscribed this plan since $date.',
      name: 'subscribed_plan',
      desc: '',
      args: [date],
    );
  }

  /// `Edit Timer`
  String get edit_theme {
    return Intl.message(
      'Edit Timer',
      name: 'edit_theme',
      desc: '',
      args: [],
    );
  }

  /// `Delete Timer`
  String get delete_theme {
    return Intl.message(
      'Delete Timer',
      name: 'delete_theme',
      desc: '',
      args: [],
    );
  }

  /// `Timer name must be 1-30 characters`
  String get theme_name_must_be_1_30_characters {
    return Intl.message(
      'Timer name must be 1-30 characters',
      name: 'theme_name_must_be_1_30_characters',
      desc: '',
      args: [],
    );
  }

  /// `Edit meditation timer failed`
  String get edit_meditation_theme_failed {
    return Intl.message(
      'Edit meditation timer failed',
      name: 'edit_meditation_theme_failed',
      desc: '',
      args: [],
    );
  }

  /// `Delete meditation timer failed`
  String get delete_meditation_theme_failed {
    return Intl.message(
      'Delete meditation timer failed',
      name: 'delete_meditation_theme_failed',
      desc: '',
      args: [],
    );
  }

  /// `Delete Confirmation`
  String get delete_confirmation {
    return Intl.message(
      'Delete Confirmation',
      name: 'delete_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `?`
  String get question_mask {
    return Intl.message(
      '?',
      name: 'question_mask',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to permanently delete timer `
  String get are_you_sure_to_permanently_delete_theme {
    return Intl.message(
      'Are you sure to permanently delete timer ',
      name: 'are_you_sure_to_permanently_delete_theme',
      desc: '',
      args: [],
    );
  }

  /// `Timer`
  String get theme {
    return Intl.message(
      'Timer',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `deleted!`
  String get deleted {
    return Intl.message(
      'deleted!',
      name: 'deleted',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least 1 sound`
  String get please_select_at_least_1_sound {
    return Intl.message(
      'Please select at least 1 sound',
      name: 'please_select_at_least_1_sound',
      desc: '',
      args: [],
    );
  }

  /// `To access more meditation guide, upgrade your plan`
  String get to_access_more_meditation_guide_upgrade_your_plan {
    return Intl.message(
      'To access more meditation guide, upgrade your plan',
      name: 'to_access_more_meditation_guide_upgrade_your_plan',
      desc: '',
      args: [],
    );
  }

  /// `Rate my app !`
  String get rate_my_app {
    return Intl.message(
      'Rate my app !',
      name: 'rate_my_app',
      desc: '',
      args: [],
    );
  }

  /// `Please leave a rating!`
  String get leave_rating {
    return Intl.message(
      'Please leave a rating!',
      name: 'leave_rating',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get day {
    return Intl.message(
      'day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Downloading Music`
  String get downloading_music {
    return Intl.message(
      'Downloading Music',
      name: 'downloading_music',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to stop meditating?`
  String get stop_confirmation {
    return Intl.message(
      'Do you want to stop meditating?',
      name: 'stop_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Restore Purchase`
  String get restore_purchase {
    return Intl.message(
      'Restore Purchase',
      name: 'restore_purchase',
      desc: '',
      args: [],
    );
  }

  /// `Your restoration purchase was successful`
  String get your_restore_purchase_was_successful {
    return Intl.message(
      'Your restoration purchase was successful',
      name: 'your_restore_purchase_was_successful',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
