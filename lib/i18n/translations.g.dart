
/*
 * Generated file. Do not edit.
 *
 * Locales: 3
 * Strings: 60 (20.0 per locale)
 *
 * Built on 2022-07-22 at 13:46 UTC
 */

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unnecessary_string_interpolations, avoid_escaping_inner_quotes

import 'package:flutter/widgets.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<_TranslationsEn> {
	en(languageCode: 'en', build: _TranslationsEn.build),
	zhCn(languageCode: 'zh', countryCode: 'CN', build: _TranslationsZhCn.build),
	zhHk(languageCode: 'zh', countryCode: 'HK', build: _TranslationsZhHk.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<_TranslationsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_TranslationsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _TranslationsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _TranslationsEn> {
	TranslationProvider({required super.child}) : super(
		initLocale: LocaleSettings.instance.currentLocale,
		initTranslations: LocaleSettings.instance.currentTranslations,
	);

	static InheritedLocaleData<AppLocale, _TranslationsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_TranslationsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEn> {
	LocaleSettings._() : super(
		locales: AppLocale.values,
		baseLocale: _baseLocale,
		utils: AppLocaleUtils.instance,
	);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
	static AppLocale setLocaleRaw(String rawLocale) => instance.setLocaleRaw(rawLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
}

// translations

// Path: <root>
class _TranslationsEn implements BaseTranslations {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	final PluralResolver? _cardinalResolver; // ignore: unused_field
	final PluralResolver? _ordinalResolver; // ignore: unused_field

	late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
	late final _TranslationsErrorEn error = _TranslationsErrorEn._(_root);
	late final _TranslationsLoginEn login = _TranslationsLoginEn._(_root);
	late final _TranslationsAccountEn account = _TranslationsAccountEn._(_root);
}

// Path: common
class _TranslationsCommonEn {
	_TranslationsCommonEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get email => 'Email';
	String get password => 'Password';
	String get confirm => 'Confirm';
	String get cancel => 'Cancel';
	String get continueText => 'Continue';
}

// Path: error
class _TranslationsErrorEn {
	_TranslationsErrorEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get common => 'Error, please try again';
	String fieldEmpty({required Object field}) => '$field must not be empty';
	String get emailFormat => 'Email format is incorrect';
	String get passwordLength => 'Password must be at least 6 characters long';
	String get login => 'Email or Password incorrect';
	String get emailInUse => 'Email is already in use';
	String get passwordTooWeak => 'Password too weak';
	String get signup => 'Signup error';
}

// Path: login
class _TranslationsLoginEn {
	_TranslationsLoginEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get login => 'Login';
	String get signup => 'Sign up';
	String get forgotPassword => 'Forgot password';
	String get noAccount => 'No Account?';
	String get createANewAccount => 'Create a new account';
}

// Path: account
class _TranslationsAccountEn {
	_TranslationsAccountEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'My Account';
	String get logout => 'Logout';
}

// Path: <root>
class _TranslationsZhCn extends _TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsZhCn.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver,
		super.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key] ?? super._flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override final PluralResolver? _cardinalResolver; // ignore: unused_field
	@override final PluralResolver? _ordinalResolver; // ignore: unused_field

	@override late final _TranslationsZhCn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsCommonZhCn common = _TranslationsCommonZhCn._(_root);
	@override late final _TranslationsErrorZhCn error = _TranslationsErrorZhCn._(_root);
	@override late final _TranslationsLoginZhCn login = _TranslationsLoginZhCn._(_root);
	@override late final _TranslationsAccountZhCn account = _TranslationsAccountZhCn._(_root);
}

// Path: common
class _TranslationsCommonZhCn extends _TranslationsCommonEn {
	_TranslationsCommonZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get email => '电子邮件';
	@override String get password => '密码';
	@override String get confirm => '确认';
	@override String get cancel => '取消';
	@override String get continueText => '继续';
}

// Path: error
class _TranslationsErrorZhCn extends _TranslationsErrorEn {
	_TranslationsErrorZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get common => '发生错误，请重试';
	@override String fieldEmpty({required Object field}) => '$field 不能为空';
	@override String get emailFormat => '电子邮件格式不正确';
	@override String get passwordLength => '密码必须至少6个字符长';
	@override String get login => '电子邮件或密码不正确';
	@override String get emailInUse => '电子邮件已经在使用';
	@override String get passwordTooWeak => '密码太弱了';
	@override String get signup => '注册错误';
}

// Path: login
class _TranslationsLoginZhCn extends _TranslationsLoginEn {
	_TranslationsLoginZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get login => '登录';
	@override String get signup => '注册';
	@override String get forgotPassword => '忘记了密码';
	@override String get noAccount => '没有帐户？';
	@override String get createANewAccount => '创建一个新帐户';
}

// Path: account
class _TranslationsAccountZhCn extends _TranslationsAccountEn {
	_TranslationsAccountZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '我的帐户';
	@override String get logout => '登出';
}

// Path: <root>
class _TranslationsZhHk extends _TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsZhHk.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver,
		super.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key] ?? super._flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override final PluralResolver? _cardinalResolver; // ignore: unused_field
	@override final PluralResolver? _ordinalResolver; // ignore: unused_field

	@override late final _TranslationsZhHk _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsCommonZhHk common = _TranslationsCommonZhHk._(_root);
	@override late final _TranslationsErrorZhHk error = _TranslationsErrorZhHk._(_root);
	@override late final _TranslationsLoginZhHk login = _TranslationsLoginZhHk._(_root);
	@override late final _TranslationsAccountZhHk account = _TranslationsAccountZhHk._(_root);
}

// Path: common
class _TranslationsCommonZhHk extends _TranslationsCommonEn {
	_TranslationsCommonZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get email => '電子郵件';
	@override String get password => '密碼 ';
	@override String get confirm => '確認';
	@override String get cancel => '取消';
	@override String get continueText => '繼續';
}

// Path: error
class _TranslationsErrorZhHk extends _TranslationsErrorEn {
	_TranslationsErrorZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get common => '發生錯誤，請重試';
	@override String fieldEmpty({required Object field}) => '$field 不能為空';
	@override String get emailFormat => '電子郵件格式不正確';
	@override String get passwordLength => '密碼必須至少6個字符長';
	@override String get login => '電子郵件或密碼不正確';
	@override String get emailInUse => '電子郵件已經在使用';
	@override String get passwordTooWeak => '密碼太弱了';
	@override String get signup => '註冊錯誤';
}

// Path: login
class _TranslationsLoginZhHk extends _TranslationsLoginEn {
	_TranslationsLoginZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get login => '登錄';
	@override String get signup => '註冊';
	@override String get forgotPassword => '忘記了密碼';
	@override String get noAccount => '沒有帳戶？';
	@override String get createANewAccount => '創建一個新帳戶';
}

// Path: account
class _TranslationsAccountZhHk extends _TranslationsAccountEn {
	_TranslationsAccountZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '我的帳戶';
	@override String get logout => '登出';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'common.email': 'Email',
			'common.password': 'Password',
			'common.confirm': 'Confirm',
			'common.cancel': 'Cancel',
			'common.continueText': 'Continue',
			'error.common': 'Error, please try again',
			'error.fieldEmpty': ({required Object field}) => '$field must not be empty',
			'error.emailFormat': 'Email format is incorrect',
			'error.passwordLength': 'Password must be at least 6 characters long',
			'error.login': 'Email or Password incorrect',
			'error.emailInUse': 'Email is already in use',
			'error.passwordTooWeak': 'Password too weak',
			'error.signup': 'Signup error',
			'login.login': 'Login',
			'login.signup': 'Sign up',
			'login.forgotPassword': 'Forgot password',
			'login.noAccount': 'No Account?',
			'login.createANewAccount': 'Create a new account',
			'account.title': 'My Account',
			'account.logout': 'Logout',
		};
	}
}

extension on _TranslationsZhCn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'common.email': '电子邮件',
			'common.password': '密码',
			'common.confirm': '确认',
			'common.cancel': '取消',
			'common.continueText': '继续',
			'error.common': '发生错误，请重试',
			'error.fieldEmpty': ({required Object field}) => '$field 不能为空',
			'error.emailFormat': '电子邮件格式不正确',
			'error.passwordLength': '密码必须至少6个字符长',
			'error.login': '电子邮件或密码不正确',
			'error.emailInUse': '电子邮件已经在使用',
			'error.passwordTooWeak': '密码太弱了',
			'error.signup': '注册错误',
			'login.login': '登录',
			'login.signup': '注册',
			'login.forgotPassword': '忘记了密码',
			'login.noAccount': '没有帐户？',
			'login.createANewAccount': '创建一个新帐户',
			'account.title': '我的帐户',
			'account.logout': '登出',
		};
	}
}

extension on _TranslationsZhHk {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'common.email': '電子郵件',
			'common.password': '密碼 ',
			'common.confirm': '確認',
			'common.cancel': '取消',
			'common.continueText': '繼續',
			'error.common': '發生錯誤，請重試',
			'error.fieldEmpty': ({required Object field}) => '$field 不能為空',
			'error.emailFormat': '電子郵件格式不正確',
			'error.passwordLength': '密碼必須至少6個字符長',
			'error.login': '電子郵件或密碼不正確',
			'error.emailInUse': '電子郵件已經在使用',
			'error.passwordTooWeak': '密碼太弱了',
			'error.signup': '註冊錯誤',
			'login.login': '登錄',
			'login.signup': '註冊',
			'login.forgotPassword': '忘記了密碼',
			'login.noAccount': '沒有帳戶？',
			'login.createANewAccount': '創建一個新帳戶',
			'account.title': '我的帳戶',
			'account.logout': '登出',
		};
	}
}
