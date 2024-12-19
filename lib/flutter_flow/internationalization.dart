import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? arText = '',
  }) =>
      [enText, esText, frText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Start
  {
    'ogc6h2r9': {
      'en': 'Welcome.',
      'ar': 'مرحبا بكم في 👋',
      'es': 'Bienvenido a 👋',
      'fr': 'Bienvenue sur 👋',
    },
    '4iq7slee': {
      'en': 'The best e-commerce app of the century for your daily needs!',
      'ar': 'أفضل تطبيق للتجارة الإلكترونية في القرن لتلبية احتياجاتك اليومية!',
      'es':
          '¡La mejor aplicación de comercio electrónico del siglo para tus necesidades diarias!',
      'fr':
          'La meilleure application e-commerce du siècle pour vos besoins quotidiens !',
    },
    'ieysq8ov': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginMethod
  {
    'k0nviovj': {
      'en': 'Let’s get you in',
      'ar': 'دعنا ندخلك',
      'es': 'Vamos a entrar',
      'fr': 'Laissez-vous entrer',
    },
    'xoym072d': {
      'en': 'Signin with Google',
      'ar': 'الدخول مع جوجل',
      'es': 'Inicia sesión con Google',
      'fr': 'Connectez-vous avec Google',
    },
    'bh7bb7gm': {
      'en': 'Signin with Apple',
      'ar': 'تسجيل الدخول مع أبل',
      'es': 'Iniciar sesión con Apple',
      'fr': 'Connectez-vous avec Apple',
    },
    'yprnjbub': {
      'en': 'or',
      'ar': 'أو',
      'es': 'o',
      'fr': 'ou',
    },
    'oudo6rps': {
      'en': 'Sign in with email',
      'ar': 'قم بتسجيل الدخول باستخدام البريد الإلكتروني',
      'es': 'Iniciar sesión con correo electrónico',
      'fr': 'Connectez-vous avec e-mail',
    },
    'xauqkdx9': {
      'en': 'Don’t have an account?',
      'ar': 'ليس لديك حساب؟',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'pqomncy5': {
      'en': '  Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'tdtto5un': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OnBoarding
  {
    'i74467xr': {
      'en': 'World of perfection',
      'ar': 'عالم الكمال',
      'es': 'mundo de perfección',
      'fr': 'Monde de perfection',
    },
    'lc4263su': {
      'en':
          'Feel like you are a queen in the world of perfection, to find your best fits.',
      'ar': 'أشعري وكأنك ملكة في عالم الكمال، لتجدي ما يناسبك.',
      'es':
          'Siéntete una reina en el mundo de la perfección, para encontrar tus mejores ajustes.',
      'fr':
          'Sentez-vous comme la reine du monde de la perfection, pour trouver vos meilleurs ajustements.',
    },
    '7hqn9soo': {
      'en': 'More than just a mall',
      'ar': 'أكثر من مجرد مركز تجاري',
      'es': 'Más que un simple centro comercial',
      'fr': 'Plus qu\'un simple centre commercial',
    },
    'tnxo13x1': {
      'en':
          'Exprience the shopping on clouds with Hiva shopping card system and feel the perfection',
      'ar':
          'استمتع بتجربة التسوق على السحابة باستخدام نظام بطاقة التسوق Evira واشعر بالكمال',
      'es':
          'Experimente las compras en las nubes con el sistema de tarjetas de compras Evira y sienta la perfección',
      'fr':
          'Faites l\'expérience du shopping sur les nuages ​​avec le système de carte d\'achat Evira et ressentez la perfection',
    },
    '39yd2a4n': {
      'en': 'Gifts are here',
      'ar': 'الهدايا هنا',
      'es': 'Los regalos estan aqui',
      'fr': 'Les cadeaux sont ici',
    },
    'wwlz7lve': {
      'en':
          'Direct gift sending system, You just need to buy it we deliver it to your beloved ones.',
      'ar':
          'نظام إرسال الهدايا المباشر، ما عليك سوى شرائه وسنقوم بتوصيلها إلى أحبائك.',
      'es':
          'Sistema de envío directo de regalos, solo necesitas comprarlo y nosotros se lo entregamos a tus seres queridos.',
      'fr':
          'Système d\'envoi direct de cadeaux, il vous suffit de l\'acheter, nous le livrons à vos proches.',
    },
    'ztazuz7n': {
      'en': 'Skip',
      'ar': 'يتخطى',
      'es': 'Saltar',
      'fr': 'Sauter',
    },
    '3tja30tz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Login
  {
    'ze3m37np': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    '497xdiy9': {
      'en': 'Use demo account to have a better vision, it\'s pre filled.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'm5qo8hnd': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'bi6iuwsb': {
      'en': 'demo@email.com',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'eefxbplv': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'yikxp0nv': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'g2h6badc': {
      'en': '111111',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '7v52ifuz': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
    },
    'nflzaz0l': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    '1d0ycpt5': {
      'en': 'Forgot the password?',
      'ar': 'هل نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Mot de passe oublié ?',
    },
    'vpd2uinh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'cf6o6r5k': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'sapcnpa8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'qhxn38kh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w1zmrs5c': {
      'en': 'Don’t have an account?',
      'ar': 'ليس لديك حساب؟',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    '64p75hm8': {
      'en': '   Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'f4f5yys3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // onBoard_Profile
  {
    '91bw3rji': {
      'en': 'Complete Your Profile',
      'ar': 'أكمل ملفك الشخصي',
      'es': 'Completa tu perfil',
      'fr': 'Complète ton profil',
    },
    '0j9b3tya': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    '6pd5svw3': {
      'en': 'User Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'jkvasdhi': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'z7pfbcwu': {
      'en': '+13025079012',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'wkhri8fk': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'oaisacjy': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'r08pyo3b': {
      'en': 'Other',
      'ar': 'آخر',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'tmuiwm99': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
    },
    '5n8x2g4l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '9dyjpeqh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'x0bohqc8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ndlygltm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '64m1o5fr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qemubkgi': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '3tzewo4c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'b1bjuo7w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '2qey04bw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qpeypoks': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'lnb8l6m1': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // pinCodeSet
  {
    '5d0y4e1q': {
      'en': 'Set you app pin code',
      'ar': 'قم بتعيين الرمز السري للتطبيق الخاص بك',
      'es': 'Configura el código PIN de tu aplicación',
      'fr': 'Définir le code PIN de votre application',
    },
    'pewldnzf': {
      'en': 'Add a PIN number to make your account more secure.',
      'ar': 'أضف رقم PIN لجعل حسابك أكثر أمانًا.',
      'es': 'Agregue un número PIN para que su cuenta sea más segura.',
      'fr': 'Ajoutez un code PIN pour rendre votre compte plus sécurisé.',
    },
    'qju1ouas': {
      'en': 'Clear',
      'ar': 'واضح',
      'es': 'Claro',
      'fr': 'Clair',
    },
    '5dbtzo9n': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'dq8nxll0': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // BiometricSet
  {
    'r383okhi': {
      'en': 'Set Your Fingerprint',
      'ar': 'تعيين بصمة الإصبع الخاصة بك',
      'es': 'Establece tu huella digital',
      'fr': 'Définir votre empreinte digitale',
    },
    'w6hnxwg3': {
      'en': 'Please put your finger on the fingerprint scanner to get started.',
      'ar': 'يرجى وضع إصبعك على الماسح الضوئي لبصمات الأصابع للبدء.',
      'es': 'Coloque su dedo en el escáner de huellas digitales para comenzar.',
      'fr':
          'Veuillez mettre votre doigt sur le scanner d\'empreintes digitales pour commencer.',
    },
    'c2puqt79': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    '1aj8l8ph': {
      'en': 'You want to enable the biometric as your second security level?',
      'ar': 'هل تريد تمكين القياسات الحيوية كمستوى الأمان الثاني لديك؟',
      'es':
          '¿Quiere habilitar la biometría como su segundo nivel de seguridad?',
      'fr':
          'Vous souhaitez activer la biométrie comme deuxième niveau de sécurité ?',
    },
  },
  // ForgotPass
  {
    '77w38e6m': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    '8xwi23a0': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
    },
    'ax3mwrz0': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '0lpnh5xu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '0qht8p3m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8nrbmp0g': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    '42pnql6x': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Home
  {
    '24g3kmmn': {
      'en': 'Wekcome.',
      'ar': 'صباح الخير 👋',
      'es': 'Buenos días 👋',
      'fr': 'Bonjour 👋',
    },
    'f3cyodoy': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'qnlsh580': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
    },
    'h33nnah4': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'firj5o16': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    '2ks332x6': {
      'en': 'Clothe',
      'ar': 'الملبس',
      'es': 'Vestir',
      'fr': 'Vêtir',
    },
    '858ry1by': {
      'en': 'Shoe',
      'ar': 'حذاء',
      'es': 'Zapato',
      'fr': 'Chaussure',
    },
    '2g5j0kf5': {
      'en': 'Kitchen',
      'ar': 'مطبخ',
      'es': 'Cocina',
      'fr': 'Cuisine',
    },
    '9pj7tagr': {
      'en': 'Most Popular',
      'ar': 'الأكثر شعبية',
      'es': 'Más popular',
      'fr': 'Le plus populaire',
    },
    'eyna5twi': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    '47i0hta4': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'zxaa93yz': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
    },
    '2y7zlnyw': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
    },
    'tq449bq7': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
    },
    'ak70dpwq': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'gzq2lmhb': {
      'en': 'Hot Items',
      'ar': 'العناصر الساخنة',
      'es': 'Artículos calientes',
      'fr': 'Articles chauds',
    },
    'd17piusd': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'utj6tpf5': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'pc8oumjn': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
    },
    '2hgoegi9': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
    },
    '93twypmk': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
    },
    '9rh9ndl3': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'okl5cw0v': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'mqvueu06': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Cart
  {
    'ga7suyqp': {
      'en': 'My Cart',
      'ar': 'سلة التسوق الخاصة بي',
      'es': 'Mi carrito',
      'fr': 'Mon panier',
    },
    'm0wx4dh4': {
      'en': 'Cart',
      'ar': 'عربة التسوق',
      'es': 'Carro',
      'fr': 'Chariot',
    },
  },
  // Notifications
  {
    '03vq7asq': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'gnsmzrop': {
      'en': 'New',
      'ar': 'جديد',
      'es': 'Nuevo',
      'fr': 'Nouveau',
    },
    'z5cmvjlf': {
      'en': 'Seen',
      'ar': 'مرئي',
      'es': 'Visto',
      'fr': 'Vu',
    },
    'mk8tsw4k': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // WishLIst
  {
    'i9uwytp0': {
      'en': 'My Wishlist',
      'ar': 'قائمة امنياتي',
      'es': 'mi lista de deseos',
      'fr': 'Ma liste d\'envies',
    },
    'eh0ixqg8': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SpecialOffers
  {
    'h7pm8ha0': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
    },
    'drtfgb0f': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Products
  {
    'j4ql5ja1': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'cbrfrqgs': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
    },
    'ep1xdj7s': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
    },
    'tzt6shbw': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
    },
    '8upw0qut': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Search
  {
    '0qzixbfu': {
      'en': 'Search in products',
      'ar': 'البحث في المنتجات',
      'es': 'Buscar en productos',
      'fr': 'Rechercher dans les produits',
    },
    'j78klw2g': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '2i311bt7': {
      'en': 'Clear',
      'ar': 'واضح',
      'es': 'Claro',
      'fr': 'Clair',
    },
    'u2ud0w1d': {
      'en': 'Recent',
      'ar': 'مؤخرًا',
      'es': 'Reciente',
      'fr': 'Récent',
    },
    'fovdu1w3': {
      'en': 'Clear All',
      'ar': 'امسح الكل',
      'es': 'Limpiar todo',
      'fr': 'Tout effacer',
    },
    'ja6kvgid': {
      'en': 'Set Silter',
      'ar': 'تعيين سيلتر',
      'es': 'Establecer filtro',
      'fr': 'Définir le filtre',
    },
    'w1d1a58b': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    'uowa8nmy': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'w57psrgq': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
    },
    'p7nrhsmv': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
    },
    'jx7t74kq': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
    },
    'ex9mvks4': {
      'en': 'Price Range',
      'ar': 'نطاق السعر',
      'es': 'Rango de precios',
      'fr': 'Échelle des prix',
    },
    'saebe8dt': {
      'en': ' Bigger than',
      'ar': 'أكبر من',
      'es': 'Más grande que',
      'fr': 'Plus grand que',
    },
    'gb5tjvja': {
      'en': 'Rating',
      'ar': 'تقييم',
      'es': 'Clasificación',
      'fr': 'Notation',
    },
    '6he5ti4q': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
    },
    'i61rorb6': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'es': 'Aplicar',
      'fr': 'Appliquer',
    },
    '5xuhsyxb': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Detail
  {
    'o5wkoto8': {
      'en': 'Description',
      'ar': 'وصف',
      'es': 'Descripción',
      'fr': 'Description',
    },
    't4bmaz0f': {
      'en': 'Size',
      'ar': 'مقاس',
      'es': 'Tamaño',
      'fr': 'Taille',
    },
    '28n06hrc': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'bg34hrvp': {
      'en': 'Quantity',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Quantité',
    },
    'xic97283': {
      'en': 'Last 3 reviews',
      'ar': 'آخر 3 مراجعات',
      'es': 'Últimas 3 reseñas',
      'fr': '3 derniers avis',
    },
    'gqq3y3bn': {
      'en': 'See All Review',
      'ar': 'شاهد كل المراجعة',
      'es': 'Ver toda la reseña',
      'fr': 'Voir tous les avis',
    },
    'rp699b33': {
      'en': 'Give Review',
      'ar': 'إعطاء مراجعة',
      'es': 'Dar reseña',
      'fr': 'Donner un avis',
    },
    'a20jna9f': {
      'en': 'Total price',
      'ar': 'السعر الكلي',
      'es': 'Precio total',
      'fr': 'Prix ​​total',
    },
    'ks32533k': {
      'en': 'Add To Cart',
      'ar': 'أضف إلى السلة',
      'es': 'Añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    'oi35mceo': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Reviews
  {
    'zcp7cypr': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CheckOut
  {
    'lcnyw3hc': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'cr0qzef5': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
      'es': 'Dirección de envío',
      'fr': 'adresse de livraison',
    },
    'q65z9dgb': {
      'en': 'Add address',
      'ar': 'اضف عنوان',
      'es': 'Añadir dirección',
      'fr': 'Ajoutez l\'adresse',
    },
    'soey72ow': {
      'en': 'You don\'t have an address you need to add one',
      'ar': 'ليس لديك عنوان تحتاج إلى إضافته',
      'es': 'No tienes una dirección, necesitas agregar una.',
      'fr': 'Vous n\'avez pas d\'adresse, vous devez en ajouter une',
    },
    'gxxkgt1t': {
      'en': 'Add Address',
      'ar': 'اضف عنوان',
      'es': 'Añadir dirección',
      'fr': 'Ajoutez l\'adresse',
    },
    'zchnfbgp': {
      'en': 'Order List',
      'ar': 'لائحة الطلبات',
      'es': 'Lista de orden',
      'fr': 'Liste de commande',
    },
    '1tzdw8n3': {
      'en': 'Choose Shipping ',
      'ar': 'اختر الشحن',
      'es': 'Elige Envío',
      'fr': 'Choisissez l\'expédition',
    },
    '63ukigmn': {
      'en': 'Shipping Type',
      'ar': 'نوع الشحن',
      'es': 'Tipo de envío',
      'fr': 'Type d\'expédition',
    },
    'hpkhn6l4': {
      'en': 'Promo Code',
      'ar': 'رمز ترويجي',
      'es': 'Código promocional',
      'fr': 'Code promo',
    },
    'zoauj27p': {
      'en': 'Add promo code',
      'ar': 'أضف الرمز الترويجي',
      'es': 'Agregar código de promoción',
      'fr': 'Ajouter un code promotionnel',
    },
    'l3ywbl1a': {
      'en': 'Amount',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    'faj38kvq': {
      'en': 'Discount Promo',
      'ar': 'عرض ترويجي للخصم',
      'es': 'Promoción de descuento',
      'fr': 'Promotion de réduction',
    },
    '2z3oxb96': {
      'en': 'Tax',
      'ar': 'ضريبة',
      'es': 'Impuesto',
      'fr': 'Impôt',
    },
    'py9hn48c': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
    },
    '1ra0ur6u': {
      'en': 'Continue to Payment',
      'ar': 'الاستمرار في الدفع',
      'es': 'Continuar con el pago',
      'fr': 'Continuer vers le paiement',
    },
    'edogkbdu': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ShippingMethods
  {
    'l1dhmm8m': {
      'en': 'Shipping Methods',
      'ar': 'طرق الشحن',
      'es': 'Métodos de envío',
      'fr': 'méthodes de livraison',
    },
    '8fd1mbm0': {
      'en': 'Default shipping method',
      'ar': 'طريقة الشحن الافتراضية',
      'es': 'Método de envío predeterminado',
      'fr': 'Méthode d\'expédition par défaut',
    },
    'yedvbog3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginSecure
  {
    '8sxihnt1': {
      'en': 'Enter Your PIN',
      'ar': 'أدخل الكود الشخصي التعريفي',
      'es': 'Introduce tu PIN',
      'fr': 'Entrez votre code PIN',
    },
    'g7bnztdx': {
      'en':
          'Enter your pin number\n\nNote: Demo pincode is 1111\n\nYou can enable/desable pincode secure layer in profile page / security',
      'ar':
          'أدخل الرقم السري الخاص بك\n\nملاحظة: الرمز السري التجريبي هو 1111\n\nيمكنك تمكين/إلغاء تمكين الطبقة الآمنة للرمز السري في صفحة الملف الشخصي/الأمان',
      'es':
          'Introduce tu número pin\n\nNota: el código PIN de demostración es 1111\n\nPuede habilitar/deshabilitar la capa segura de código PIN en la página de perfil/seguridad',
      'fr':
          'Entrez votre code PIN\n\nRemarque : le code PIN de la démo est 1111.\n\nVous pouvez activer/désactiver la couche sécurisée par code PIN dans la page de profil/sécurité',
    },
    '4gjcta9j': {
      'en': 'Clear',
      'ar': 'واضح',
      'es': 'Claro',
      'fr': 'Clair',
    },
    'sn8b4cor': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OrderHistory
  {
    'h91dyz18': {
      'en': 'My Orders',
      'ar': 'طلباتي',
      'es': 'Mis ordenes',
      'fr': 'Mes commandes',
    },
    'irz85r12': {
      'en': 'Ongoing',
      'ar': 'جاري التنفيذ',
      'es': 'En curso',
      'fr': 'En cours',
    },
    'm3zjlodp': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
    },
    'gujt0dxc': {
      'en': 'Track Order',
      'ar': 'ترتيب المسار',
      'es': 'Orden de pista',
      'fr': 'Suivi de commande',
    },
    'kn1523mk': {
      'en': 'Completed',
      'ar': 'مكتمل',
      'es': 'Terminado',
      'fr': 'Complété',
    },
    'ih5vjybb': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
    },
    'oqduju2y': {
      'en': 'E-Receipt',
      'ar': 'الإيصال الإلكتروني',
      'es': 'Recibo electrónico',
      'fr': 'Reçu électronique',
    },
    'p1a2sd5k': {
      'en': 'Orders',
      'ar': 'طلبات',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // Wallet
  {
    'h22regvw': {
      'en': 'My E-Wallet',
      'ar': 'محفظتي الإلكترونية',
      'es': 'Mi billetera electrónica',
      'fr': 'Mon portefeuille électronique',
    },
    'rc1yod64': {
      'en': 'Transaction History',
      'ar': 'تاريخ المعاملات',
      'es': 'Historial de transacciones',
      'fr': 'Historique des transactions',
    },
    'wfy9x3xk': {
      'en': 'See all',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'iub39qmr': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'es': 'Billetera',
      'fr': 'Portefeuille',
    },
    'jtx8cfu7': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'es': 'Billetera',
      'fr': 'Portefeuille',
    },
  },
  // TrackOrder
  {
    '0fdxovbj': {
      'en': 'Track Order',
      'ar': 'ترتيب المسار',
      'es': 'Orden de pista',
      'fr': 'Suivi de commande',
    },
    'iutxeqb9': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
    },
    'dg29me9q': {
      'en': 'E-Receipt',
      'ar': 'الإيصال الإلكتروني',
      'es': 'Recibo electrónico',
      'fr': 'Reçu électronique',
    },
    'vd90fj5x': {
      'en': 'Packet In Delivery',
      'ar': 'الحزمة في التسليم',
      'es': 'Paquete en entrega',
      'fr': 'Paquet en livraison',
    },
    'nj6cdd5z': {
      'en': 'Order Status Details',
      'ar': 'تفاصيل حالة الطلب',
      'es': 'Detalles del estado del pedido',
      'fr': 'Détails de l\'état de la commande',
    },
    'csopoxiy': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // TopUp
  {
    '3d3aqmtv': {
      'en': 'Top Up E-Wallet',
      'ar': 'تعبئة المحفظة الإلكترونية',
      'es': 'Recargar billetera electrónica',
      'fr': 'Recharger le portefeuille électronique',
    },
    'pzupt8m5': {
      'en': 'Enter the amount of top up',
      'ar': 'أدخل مبلغ التعبئة',
      'es': 'Introduce el importe de la recarga',
      'fr': 'Entrez le montant de la recharge',
    },
    'cnnh6e81': {
      'en': '0.0',
      'ar': '0.0',
      'es': '0.0',
      'fr': '0,0',
    },
    'jsvfx8p6': {
      'en': '5',
      'ar': '5',
      'es': '5',
      'fr': '5',
    },
    'z9h65pf4': {
      'en': '10',
      'ar': '10',
      'es': '10',
      'fr': 'dix',
    },
    'b1o1gw6t': {
      'en': '20',
      'ar': '20',
      'es': '20',
      'fr': '20',
    },
    '7i1itpc8': {
      'en': '50',
      'ar': '50',
      'es': '50',
      'fr': '50',
    },
    'mcp6h3ns': {
      'en': '100',
      'ar': '100',
      'es': '100',
      'fr': '100',
    },
    'rxbiahry': {
      'en': '200',
      'ar': '200',
      'es': '200',
      'fr': '200',
    },
    'xzqdetmv': {
      'en': '500',
      'ar': '500',
      'es': '500',
      'fr': '500',
    },
    'g27pv8ec': {
      'en': '750',
      'ar': '750',
      'es': '750',
      'fr': '750',
    },
    'jptmy9nn': {
      'en': '1000',
      'ar': '1000',
      'es': '1000',
      'fr': '1000',
    },
    'mnc7keh8': {
      'en': 'Top Up',
      'ar': 'فوق حتى',
      'es': 'Completar',
      'fr': 'Recharger',
    },
    '4b5l85ur': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Transactions
  {
    '8sx1aoam': {
      'en': 'Transaction History',
      'ar': 'تاريخ المعاملات',
      'es': 'Historial de transacciones',
      'fr': 'Historique des transactions',
    },
    '0vdt33tx': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // E-Receipt
  {
    '4pnbmsvt': {
      'en': 'E-Receipt',
      'ar': 'الإيصال الإلكتروني',
      'es': 'Recibo electrónico',
      'fr': 'Reçu électronique',
    },
    'rku8ashr': {
      'en': 'Products',
      'ar': 'منتجات',
      'es': 'Productos',
      'fr': 'Des produits',
    },
    'juoncty0': {
      'en': 'Amount',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    'bgfj2b8l': {
      'en': 'Discount Promo',
      'ar': 'عرض ترويجي للخصم',
      'es': 'Promoción de descuento',
      'fr': 'Promotion de réduction',
    },
    'zlo1vf83': {
      'en': 'Tax',
      'ar': 'ضريبة',
      'es': 'Impuesto',
      'fr': 'Impôt',
    },
    'qybu93v0': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
    },
    'zw5b09tu': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
    },
    'ekgrm4n3': {
      'en': 'Date',
      'ar': 'تاريخ',
      'es': 'Fecha',
      'fr': 'Date',
    },
    '1c2rw0yq': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
    },
    '8ztetcy5': {
      'en': 'Transaction ID',
      'ar': 'رقم المعاملة',
      'es': 'ID de transacción',
      'fr': 'identifiant de transaction',
    },
    'lt24pjd9': {
      'en': 'Status',
      'ar': 'حالة',
      'es': 'Estado',
      'fr': 'Statut',
    },
    'ikue898l': {
      'en': 'Export Options',
      'ar': 'خيارات التصدير',
      'es': 'Opciones de exportación',
      'fr': 'Options d\'exportation',
    },
    '531ilq7y': {
      'en': 'Print',
      'ar': 'مطبعة',
      'es': 'Imprimir',
      'fr': 'Imprimer',
    },
    'qcgia77v': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Profile
  {
    'x822uhsy': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'q4zj3jy0': {
      'en': 'Customer Chat Support',
      'ar': 'دعم دردشة العملاء',
      'es': 'Atención al cliente por chat',
      'fr': 'Assistance par chat client',
    },
    'x2llmv2u': {
      'en': 'Addresses',
      'ar': 'عناوين',
      'es': 'Direcciones',
      'fr': 'Adresses',
    },
    'ote9d9i8': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
    },
    'wajvm8iv': {
      'en': 'Shipping Methods',
      'ar': 'طرق الشحن',
      'es': 'Métodos de envío',
      'fr': 'méthodes de livraison',
    },
    '48m6c0zu': {
      'en': 'Notification Setting',
      'ar': 'إعداد الإخطار',
      'es': 'Notificación de configuración',
      'fr': 'Paramètre de notification',
    },
    'f6fyav1f': {
      'en': 'Security',
      'ar': 'حماية',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '0rumd0pk': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'dbzxin7z': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
    },
    '0ipgjiew': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    '9afh9kgi': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
    },
    '197fiunp': {
      'en': 'Invite Friends',
      'ar': 'ادعو أصدقاء',
      'es': 'Invitar a amigos',
      'fr': 'Inviter des amis',
    },
    '1tw19m51': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'i1heuel7': {
      'en': 'Evira Version 1.0.01 Build 21',
      'ar': 'إيفيرا الإصدار 1.0.01 البناء 21',
      'es': 'Evira Versión 1.0.01 Compilación 21',
      'fr': 'Evira Version 1.0.01 Construire 21',
    },
    'wfwrzw0c': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    'ksujdsg6': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // ProfileEdit
  {
    'tottirw2': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'jusrtbjm': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'pzwy4ayf': {
      'en': 'User Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'aekq22u1': {
      'en': 'Email',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'a5mm73r4': {
      'en': '+13025079012',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'ymwhud55': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'xywk2uk2': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'k4opv0hy': {
      'en': 'Other',
      'ar': 'آخر',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'lqwznadd': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
    },
    'exh54exr': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'luoj2o3j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'cm344mut': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w3pxefrr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'imu046hc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'q6q7tf4d': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    't1u4ox74': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9imci6ne': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'fm7iixkz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'x0wogarh': {
      'en': 'Update',
      'ar': 'تحديث',
      'es': 'Actualizar',
      'fr': 'Mise à jour',
    },
    '8gdcsc2y': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Address
  {
    'c7ly452e': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
      'es': 'Dirección de envío',
      'fr': 'adresse de livraison',
    },
    'fb0n9snd': {
      'en': 'Your Shipping Address',
      'ar': 'عنوان الشحن الخاص بك',
      'es': 'Tu Dirección de Envío',
      'fr': 'Votre adresse de livraison',
    },
    'sw58aq4r': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'es': 'Agregar nueva dirección',
      'fr': 'Ajouter une nouvelle adresse',
    },
    'ze2rpmir': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SettingNotification
  {
    '5o6xxes2': {
      'en': 'Notification',
      'ar': 'إشعار',
      'es': 'Notificación',
      'fr': 'Notification',
    },
    'u75lm5yr': {
      'en': 'Configure Notification',
      'ar': 'تكوين الإخطار',
      'es': 'Configurar notificación',
      'fr': 'Configurer les notifications',
    },
    'bmzfuj0j': {
      'en': 'General Notification',
      'ar': 'إشعار عام',
      'es': 'Notificación general',
      'fr': 'Notification générale',
    },
    '3pb2p19r': {
      'en': 'Sound',
      'ar': 'صوت',
      'es': 'Sonido',
      'fr': 'Son',
    },
    'sv3dtx8s': {
      'en': 'Vibrate',
      'ar': 'تذبذب',
      'es': 'Vibrar',
      'fr': 'Vibrer',
    },
    '88hrozp4': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
    },
    '9xke2qz8': {
      'en': 'Promo & Discount',
      'ar': 'الترويجي والخصم',
      'es': 'Promoción y descuento',
      'fr': 'Promotion et réduction',
    },
    '4h1tco6v': {
      'en': 'Payments',
      'ar': 'المدفوعات',
      'es': 'Pagos',
      'fr': 'Paiements',
    },
    '08nzc77s': {
      'en': 'Cashback',
      'ar': 'استرداد النقود',
      'es': 'Devolución de dinero',
      'fr': 'Remise en argent',
    },
    'chd8b0nf': {
      'en': 'App Updates',
      'ar': 'تحديثات التطبيق',
      'es': 'Actualizaciones de aplicaciones',
      'fr': 'Mises à jour de l\'application',
    },
    '05bcm3xa': {
      'en': 'New Service Available',
      'ar': 'خدمة جديدة متاحة',
      'es': 'Nuevo servicio disponible',
      'fr': 'Nouveau service disponible',
    },
    'yojei26s': {
      'en': 'New Tips Available',
      'ar': 'نصائح جديدة متاحة',
      'es': 'Nuevos consejos disponibles',
      'fr': 'Nouveaux conseils disponibles',
    },
    'k1bv65hz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // PaymentMethods
  {
    'bev5ue3s': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
    },
    'fcu8uthh': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // NewCard
  {
    'rolsy80a': {
      'en': 'New Card',
      'ar': 'بطاقة جديدة',
      'es': 'Nueva tarjeta',
      'fr': 'Nouvelle carte',
    },
    '9aaitteo': {
      'en': 'Card Name',
      'ar': 'اسم البطاقة',
      'es': 'Nombre de tarjeta',
      'fr': 'Nom de la carte',
    },
    '1gd0l5o1': {
      'en': 'Andrew Ainsley',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'bw3zj64t': {
      'en': 'Card Number',
      'ar': 'رقم البطاقة',
      'es': 'Número de tarjeta',
      'fr': 'Numéro de carte',
    },
    '7dh33brk': {
      'en': '2672 4738 7837 7285',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'vs071uch': {
      'en': 'Expiry Date',
      'ar': 'تاريخ الانتهاء',
      'es': 'Fecha de caducidad',
      'fr': 'Date d\'expiration',
    },
    '2syiaj3p': {
      'en': '09 27',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'o6v55o1p': {
      'en': 'CVV',
      'ar': 'CVV',
      'es': 'CVV',
      'fr': 'CVV',
    },
    'kls0u6i8': {
      'en': '699',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'o80vxr8j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'eg6finlp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jsy8ld9s': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'loayp4l4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '5kpb65hf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'i17iku7a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'it1l2wpy': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'zxx0bgkl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'tseibstk': {
      'en': 'Add Card',
      'ar': 'تغيير الرمز السري',
      'es': 'Cambiar código PIN',
      'fr': 'Changer le code PIN',
    },
    'u2qza7xq': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'es': 'Billetera',
      'fr': 'Portefeuille',
    },
  },
  // Security
  {
    'b1nflqgx': {
      'en': 'Security',
      'ar': 'حماية',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '1w8hfj8z': {
      'en': 'Security',
      'ar': 'حماية',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'ar0kdv8s': {
      'en': 'Security Layer',
      'ar': 'طبقة الأمان',
      'es': 'Capa de seguridad',
      'fr': 'Couche de sécurité',
    },
    'riyxv8j2': {
      'en': 'Pin Code',
      'ar': 'الرمز السري',
      'es': 'Código PIN',
      'fr': 'Code PIN',
    },
    'm98d4gqt': {
      'en': 'Biometric ID',
      'ar': 'معرف البيومترية',
      'es': 'Identificación biométrica',
      'fr': 'ID biométrique',
    },
    'c9mprpxi': {
      'en': 'Google Authenticator',
      'ar': 'أداة مصادقة جوجل',
      'es': 'Autenticador de Google',
      'fr': 'Authentificateur Google',
    },
    'srv17ln0': {
      'en': 'Change Pin code',
      'ar': 'تغيير الرمز السري',
      'es': 'Cambiar código PIN',
      'fr': 'Changer le code PIN',
    },
    'ar8maxfm': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Language
  {
    '5fhgfbyz': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'ekmdo5ts': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
      'es': 'Cambiar idioma',
      'fr': 'Changer de langue',
    },
    'c49dobms': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // PrivacyPolicy
  {
    '04ty6g4f': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'xltlyert': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // InviteContacts
  {
    'j5qxl9gm': {
      'en': 'Invite Friends In Your Contacts',
      'ar': 'دعوة الأصدقاء في جهات الاتصال الخاصة بك',
      'es': 'Invita amigos a tus contactos',
      'fr': 'Invitez des amis dans vos contacts',
    },
    'g97seig8': {
      'en': 'Note: ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'nsd406yt': {
      'en':
          'This feature only works in real devices as it needs to access to phone contacts',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xandwufc': {
      'en': 'Sync Contacts',
      'ar': 'مزامنة جهات الاتصال',
      'es': 'Sincronizar contactos',
      'fr': 'Synchroniser les contacts',
    },
    'a2v5ibvi': {
      'en': 'Start Sync your conatcts now.',
      'ar': 'ابدأ مزامنة جهات الاتصال الخاصة بك الآن.',
      'es': 'Comience a sincronizar sus contactos ahora.',
      'fr': 'Commencez à synchroniser vos contacts maintenant.',
    },
    'lq22x372': {
      'en': 'Sync Your Contacts',
      'ar': 'مزامنة جهات الاتصال الخاصة بك',
      'es': 'Sincroniza tus contactos',
      'fr': 'Synchronisez vos contacts',
    },
    '3hhwynae': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // HelpCenter
  {
    '0z4kt7o4': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
    },
    'nt9ezckm': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
    },
    '23qalclq': {
      'en': 'General Support Tips',
      'ar': 'نصائح الدعم العامة',
      'es': 'Consejos generales de soporte',
      'fr': 'Conseils d\'assistance généraux',
    },
    'pvuurlly': {
      'en': 'Refudn policy',
      'ar': 'سياسة الإرجاع',
      'es': 'Política de reembolso',
      'fr': 'Politique de remboursement',
    },
    '8we9hw49': {
      'en': 'Starting to buy',
      'ar': 'البدء في الشراء',
      'es': 'empezando a comprar',
      'fr': 'Commencer à acheter',
    },
    'nfh9wa8y': {
      'en': 'How to get help',
      'ar': 'كيف أحصل على المساعدة',
      'es': 'Cómo obtener ayuda',
      'fr': 'Comment obtenir de l\'aide',
    },
    'ladgp49w': {
      'en': 'General Support Tips',
      'ar': 'نصائح الدعم العامة',
      'es': 'Consejos generales de soporte',
      'fr': 'Conseils d\'assistance généraux',
    },
    '1cg5efnr': {
      'en': 'Which post service?',
      'ar': 'أي خدمة بريدية؟',
      'es': '¿Qué servicio postal?',
      'fr': 'Quel service postal ?',
    },
    'p4i85uig': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    '3r368foz': {
      'en': 'Customer Service',
      'ar': 'خدمة الزبائن',
      'es': 'Servicio al Cliente',
      'fr': 'Service client',
    },
    'tqhl059h': {
      'en': 'Support',
      'ar': 'يدعم',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    '5l5shah5': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'dryehphj': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CustomerSupport
  {
    '86er6dcw': {
      'en': 'Customer Service',
      'ar': 'خدمة الزبائن',
      'es': 'Servicio al Cliente',
      'fr': 'Service client',
    },
    'n8zkrsnu': {
      'en': 'Message...',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'u2xnl1e6': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Signup
  {
    'qoeoz6qe': {
      'en': 'Signup',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    's7bqyqpk': {
      'en': 'Create new account',
      'ar': 'انشاء حساب جديد',
      'es': 'Crear una nueva cuenta',
      'fr': 'Créer un nouveau compte',
    },
    '9bakqz1g': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'u9etdywn': {
      'en': 'Password',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'u2wxlynf': {
      'en': 'Retry Password',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '5akph81w': {
      'en': 'Signup',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'ysut8ogx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'q9u655km': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'yha59gtw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '17i9h1gu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '6nugwj54': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '9e8matkp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    't5r24t2l': {
      'en': 'Have an account?',
      'ar': 'هل لديك حساب؟',
      'es': '¿Tener una cuenta?',
      'fr': 'Avoir un compte?',
    },
    '8jt08qlz': {
      'en': '  Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    '4kthvvdn': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SecurityChoice
  {
    'vkbumnqp': {
      'en': 'Set Second Security Mesure',
      'ar': 'ضبط مقياس الأمان الثاني',
      'es': 'Establecer una segunda medida de seguridad',
      'fr': 'Définir une deuxième mesure de sécurité',
    },
    'bbjvse3n': {
      'en':
          'If you want you can set another layer of security, Choice one or skip',
      'ar':
          'إذا أردت، يمكنك تعيين طبقة أخرى من الأمان، اختر طبقة واحدة أو تخطيها',
      'es':
          'Si lo desea, puede establecer otra capa de seguridad, elija una u omita',
      'fr':
          'Si vous le souhaitez, vous pouvez définir un autre niveau de sécurité, en choisir un ou ignorer',
    },
    'edlk8l7s': {
      'en': 'Pin code',
      'ar': 'رمز التعريف الشخصي',
      'es': 'Código PIN',
      'fr': 'Code PIN',
    },
    'z1ie4cqr': {
      'en': 'Set a 4 digit number as your pincode',
      'ar': 'قم بتعيين رقم مكون من 4 أرقام ليكون الرمز السري الخاص بك',
      'es': 'Establece un número de 4 dígitos como tu código PIN',
      'fr': 'Définissez un numéro à 4 chiffres comme code PIN',
    },
    'b4t3pggm': {
      'en': 'Biometrics',
      'ar': 'القياسات الحيوية',
      'es': 'Biometría',
      'fr': 'Biométrie',
    },
    '3pfvop1f': {
      'en': 'We use your device biometric hardware',
      'ar': 'نحن نستخدم الأجهزة البيومترية الخاصة بجهازك',
      'es': 'Utilizamos el hardware biométrico de tu dispositivo',
      'fr': 'Nous utilisons le matériel biométrique de votre appareil',
    },
    '5tpg8kvu': {
      'en': 'Skip, No need',
      'ar': 'تخطي، لا حاجة',
      'es': 'Saltar, no es necesario',
      'fr': 'Sauter, pas besoin',
    },
    'qf0t8unz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // onBoardComplete_modal
  {
    'prn4cih5': {
      'en': 'Congratulations!',
      'ar': 'تهانينا!',
      'es': '¡Felicidades!',
      'fr': 'Toutes nos félicitations!',
    },
    '7y5lbqhc': {
      'en':
          'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
      'ar':
          'حسابك جاهز للاستخدام. ستتم إعادة توجيهك إلى الصفحة الرئيسية خلال ثوانٍ قليلة.',
      'es':
          'Su cuenta está lista para usar. Serás redirigido a la página de inicio en unos segundos.',
      'fr':
          'Votre compte est prêt à être utilisé. Vous serez redirigé vers la page d\'accueil dans quelques secondes.',
    },
  },
  // HeaderProfile
  {
    'kpcuyrzl': {
      'en': 'Good Morning 👋',
      'ar': 'صباح الخير 👋',
      'es': 'Buenos días 👋',
      'fr': 'Bonjour 👋',
    },
    'xeo7oa3y': {
      'en': 'Andrew Ainsley',
      'ar': 'أندرو أينسلي',
      'es': 'Andres Ainsley',
      'fr': 'Andrew Ainsley',
    },
  },
  // ProductItem
  {
    'fquf478k': {
      'en': ' sold',
      'ar': 'مُباع',
      'es': 'vendido',
      'fr': 'vendu',
    },
  },
  // SpecialOffersItem
  {
    'r2kf44eg': {
      'en': ' %',
      'ar': '%',
      'es': '%',
      'fr': '%',
    },
  },
  // SortAndFilterModal37
  {
    't4fcdpd6': {
      'en': 'Sort & Filter',
      'ar': 'فرز وتصفية',
      'es': 'Filtro de clasificación',
      'fr': 'Trier et filtrer',
    },
    'svtegslf': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    'uhjy6l7k': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'xmy7kwv8': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
    },
    'ul0qwfmp': {
      'en': 'Price Range',
      'ar': 'نطاق السعر',
      'es': 'Rango de precios',
      'fr': 'Échelle des prix',
    },
    '3dznnynk': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'ox1xjq86': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
    },
    'bycm9h11': {
      'en': 'Sort By',
      'ar': 'ترتيب حسب',
      'es': 'Ordenar por',
      'fr': 'Trier par',
    },
    'pdnb4849': {
      'en': 'Popular',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
    },
    'e7l9xvaw': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Más reciente',
      'fr': 'Le plus récent',
    },
    '8hnkgb4f': {
      'en': 'Rating',
      'ar': 'تقييم',
      'es': 'Clasificación',
      'fr': 'Notation',
    },
    'rohyjnig': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'cq6n9owh': {
      'en': '5',
      'ar': '5',
      'es': '5',
      'fr': '5',
    },
    '08bjsrur': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
    },
    '528bcv9p': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'es': 'Aplicar',
      'fr': 'Appliquer',
    },
  },
  // Review
  {
    'ivxsdktc': {
      'en': '4.4',
      'ar': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
  },
  // productInCard
  {
    'jjfgh6ew': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'al5ea7s5': {
      'en': 'Size  = ',
      'ar': 'الحجم =',
      'es': 'Tamaño =',
      'fr': 'Taille =',
    },
  },
  // RemoveFromCardConfirm
  {
    'pq99mh1o': {
      'en': 'Remove Product?',
      'ar': 'هل ترغب في إزالة المنتج؟',
      'es': '¿Quitar producto?',
      'fr': 'Supprimer le produit ?',
    },
    'dhnacgix': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'es0xob3g': {
      'en': 'Yes, Remove',
      'ar': 'نعم، إزالة',
      'es': 'Sí, eliminar',
      'fr': 'Oui, supprimer',
    },
  },
  // OrderItem
  {
    'k5z1lp7b': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
  },
  // ShippingItemRadioBTn
  {
    'lkvkur3i': {
      'en': 'Default',
      'ar': 'تقصير',
      'es': 'Por defecto',
      'fr': 'Défaut',
    },
  },
  // AddPromoItem
  {
    'm6adkvge': {
      'en': 'Default',
      'ar': 'تقصير',
      'es': 'Por defecto',
      'fr': 'Défaut',
    },
  },
  // CheckOutSuccessfulModal65
  {
    'huy1t7vw': {
      'en': 'Order Successful!',
      'ar': 'تم الطلب بنجاح!',
      'es': '¡Orden exitosa!',
      'fr': 'Commande réussie !',
    },
    'onl8csfz': {
      'en': 'You have successfully made order',
      'ar': 'لقد قمت بالطلب بنجاح',
      'es': 'Has realizado el pedido correctamente',
      'fr': 'Vous avez passé commande avec succès',
    },
    '5nsud8h1': {
      'en': 'View Order',
      'ar': 'مشاهدة الطلب',
      'es': 'Ver pedido',
      'fr': 'Voir l\'ordre',
    },
    '6pgr229g': {
      'en': 'View E-Receipt',
      'ar': 'عرض الإيصال الإلكتروني',
      'es': 'Ver recibo electrónico',
      'fr': 'Afficher le reçu électronique',
    },
  },
  // OrderOngoingItem
  {
    '5irw8aul': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'hb6m693k': {
      'en': '\$ ',
      'ar': '\$',
      'es': 'ps',
      'fr': '\$',
    },
    '4tzvev7a': {
      'en': 'Leave Review',
      'ar': 'اترك مراجعة',
      'es': 'Deje opinión',
      'fr': 'Laisser un avis',
    },
  },
  // OrderTrackItem
  {
    'wd9vey3j': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'shy2a38b': {
      'en': '\$ ',
      'ar': '\$',
      'es': 'ps',
      'fr': '\$',
    },
  },
  // ReviewGive
  {
    'b167nkp3': {
      'en': 'Leave a Review',
      'ar': 'ترك التعليق',
      'es': 'Dejar un comentario',
      'fr': 'Laisser un commentaire',
    },
    'p4v8fyel': {
      'en': 'Please give your rating & also your review...',
      'ar': 'يرجى إعطاء تقييمك وأيضا رأيك ...',
      'es': 'Por favor dé su calificación y también su opinión...',
      'fr': 'Veuillez donner votre note et également votre avis...',
    },
    'j2v4qpw3': {
      'en': 'Smoe text like: Very good product & fast delivery!',
      'ar': 'نص Smoe مثل: منتج جيد جدًا وتسليم سريع!',
      'es': 'Smoe texto como: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte smoe comme : Très bon produit et livraison rapide !',
    },
    'pmb9suod': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'zjspktyl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'oe33acjy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'zs6j4hc7': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'es': 'Entregar',
      'fr': 'Soumettre',
    },
  },
  // TopUpSuccessfulModal75
  {
    '4szqetn3': {
      'en': 'Top Up Successful!',
      'ar': 'تم تعبئة الرصيد بنجاح!',
      'es': '¡Recarga exitosa!',
      'fr': 'Recharge réussie !',
    },
    'ewdqtrqz': {
      'en': 'You have successfully top up\ne-wallet for \$500',
      'ar': 'لقد قمت بتعبئة الرصيد بنجاح\nالمحفظة الإلكترونية بمبلغ 500 دولار',
      'es': 'Has recargado correctamente\nbilletera electrónica por \$500',
      'fr':
          'Vous avez réussi à recharger\nportefeuille électronique pour 500 \$',
    },
    'en793tfo': {
      'en': 'View E-Receipt',
      'ar': 'عرض الإيصال الإلكتروني',
      'es': 'Ver recibo electrónico',
      'fr': 'Afficher le reçu électronique',
    },
    'u3wurren': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // E-ReceiptItem
  {
    'cf6c881o': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'ln03i5vy': {
      'en': 'Qty = ',
      'ar': 'الكمية =',
      'es': 'Cantidad =',
      'fr': 'Quantité =',
    },
    'pudj1h2p': {
      'en': 'Size = ',
      'ar': 'الحجم =',
      'es': 'Tamaño =',
      'fr': 'Taille =',
    },
  },
  // InviteItem
  {
    'sp71eqpn': {
      'en': 'Invited',
      'ar': 'مدعو',
      'es': 'Invitado',
      'fr': 'Invité',
    },
    'egrx7d3t': {
      'en': 'Invite',
      'ar': 'يدعو',
      'es': 'Invitar',
      'fr': 'Inviter',
    },
  },
  // LogoutConfirm_Modal
  {
    'a68c7jwy': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    '50ivrv6h': {
      'en': 'Are you sure you want to log out?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      'es': '¿Está seguro de que desea cerrar sesión?',
      'fr': 'Êtes-vous sûr de vouloir vous déconnecter?',
    },
    'p0z4sjdl': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'a6j51z22': {
      'en': 'Yes, Logout',
      'ar': 'نعم، تسجيل الخروج',
      'es': 'Sí, cerrar sesión',
      'fr': 'Oui, déconnexion',
    },
  },
  // InfoConfirm_Modal
  {
    '82i39xhd': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'x4zkf56d': {
      'en': 'Ok, I Undrestand!',
      'ar': 'حسنًا، أنا أفهم!',
      'es': '¡Vale, lo entiendo!',
      'fr': 'Ok, je comprends !',
    },
  },
  // MoneyCard
  {
    'gvgaw7l9': {
      'en': '**** **** **** ****',
      'ar': '**** **** **** ****',
      'es': '**** **** **** ****',
      'fr': '**** **** **** ****',
    },
    'hqwtcgfn': {
      'en': 'Your balance',
      'ar': 'رصيدك',
      'es': 'Tu balance',
      'fr': 'Votre solde',
    },
    '41nrmwbi': {
      'en': 'Top Up',
      'ar': 'فوق حتى',
      'es': 'Completar',
      'fr': 'Recharger',
    },
  },
  // AddressAdd
  {
    'bxpbj9fp': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'es': 'Agregar nueva dirección',
      'fr': 'Ajouter une nouvelle adresse',
    },
    'eb9q3bg6': {
      'en': 'Address Name',
      'ar': 'اسم عنوان',
      'es': 'Nombre de la dirección',
      'fr': 'Nom de l\'adresse',
    },
    'frnvw3qd': {
      'en': 'Address name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'ndpl9q5e': {
      'en': 'Address Details',
      'ar': 'تفاصيل العنوان',
      'es': 'detalles de dirección',
      'fr': 'Détails de l\'adresse',
    },
    'qb3e65w0': {
      'en': 'Select Location',
      'ar': 'اختر موقعا',
      'es': 'Seleccionar Ubicación',
      'fr': 'Sélectionnez l\'emplacement',
    },
    '2xpzfut9': {
      'en': 'Make this as the default address',
      'ar': 'اجعل هذا هو العنوان الافتراضي',
      'es': 'Establecer esta como la dirección predeterminada',
      'fr': 'Faites-en l\'adresse par défaut',
    },
    '5d9gdpwi': {
      'en': 'Add',
      'ar': 'يضيف',
      'es': 'Agregar',
      'fr': 'Ajouter',
    },
  },
  // PromoAdd
  {
    'vzaa7mk1': {
      'en': 'Select your promo',
      'ar': 'حدد العرض الترويجي الخاص بك',
      'es': 'Selecciona tu promoción',
      'fr': 'Sélectionnez votre promotion',
    },
    '1phps44x': {
      'en': 'Available',
      'ar': 'متاح',
      'es': 'Disponible',
      'fr': 'Disponible',
    },
  },
  // Miscellaneous
  {
    '3xcyhsnv': {
      'en': 'Next',
      'ar': 'تغيير الرمز السري',
      'es': 'Cambiar código PIN',
      'fr': 'Changer le code PIN',
    },
    'wdaunoqs': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '2dwdc8yl': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    '9cp9tnq9': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'r0k6dvu6': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    '3ndtzya4': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
    },
    'swm6319t': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'gpzu150f': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'ip2a2o8v': {
      'en': 'All',
      'ar': 'مزامنة جهات الاتصال الخاصة بك',
      'es': 'Sincroniza tus contactos',
      'fr': 'Synchronisez vos contacts',
    },
    '95svkunb': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
    },
    'p3v8uoen': {
      'en': 'Popular',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
    },
    '1iw4e130': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Más reciente',
      'fr': 'Le plus récent',
    },
    'dk7ex8cx': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
    },
    'a5iqoo0f': {
      'en': 'Smoe text like: Very good product & fast delivery!',
      'ar': 'نص Smoe مثل: منتج جيد جدًا وتسليم سريع!',
      'es': 'Smoe texto como: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte smoe comme : Très bon produit et livraison rapide !',
    },
    'lkrp1j91': {
      'en': '\$10',
      'ar': '10 دولارات',
      'es': '\$10',
      'fr': '10 \$',
    },
    '6mrgpbz0': {
      'en': 'Invite',
      'ar': 'يدعو',
      'es': 'Invitar',
      'fr': 'Inviter',
    },
    'kvc2fy4j': {
      'en': 'Invited',
      'ar': 'مدعو',
      'es': 'Invitado',
      'fr': 'Invité',
    },
    'zwg93n13': {
      'en': '2899 Summer Drive Taylor, PC 48180',
      'ar': '2899 سمر درايف تايلور، الكمبيوتر 48180',
      'es': '2899 Verano Drive Taylor, PC 48180',
      'fr': '2899, promenade Summer Taylor, PC 48180',
    },
    'b3knti0s': {
      'en': 'All',
      'ar': '5',
      'es': '5',
      'fr': '5',
    },
    'xvif1n69': {
      'en': 'Cloths',
      'ar': '10',
      'es': '10',
      'fr': 'dix',
    },
    '251gk4uv': {
      'en': 'Shoes',
      'ar': '20',
      'es': '20',
      'fr': '20',
    },
    'rh97ml0k': {
      'en': 'House',
      'ar': '50',
      'es': '50',
      'fr': '50',
    },
    'rtt0s3ia': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'v3sxop9c': {
      'en': '111111',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qx03qhyp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'yern1xc3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qpnabqqh': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'p22sdi5k': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zjkwl8p2': {
      'en': 'This app requires contacts access to function properly.',
      'ar': 'يتطلب هذا التطبيق الوصول إلى جهات الاتصال ليعمل بشكل صحيح.',
      'es':
          'Esta aplicación requiere acceso a los contactos para funcionar correctamente.',
      'fr':
          'Cette application nécessite un accès aux contacts pour fonctionner correctement.',
    },
    'd87k0ap6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5uwt6n9y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'l46gqdxp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hxhmmu6e': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ag0mlb7c': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'fcu9zsgb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mi1gwhj1': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'vhpv466y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '0tfvavw5': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mqo0fjf7': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'pbruw4is': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '2ds938sx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'f8wsmlub': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'aa27z1n2': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rz28dduj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'cq43nzjx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'bpv17yg3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xw4eb2cb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'h9ohlmo6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'expiyj8r': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mbakdgif': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3ystj7r4': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'y65cdfga': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
