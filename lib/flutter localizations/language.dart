class Language{
  final id;
  final name;
  final flag;
  final languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);

  static List<Language> languageList(){
    return <Language>[
      Language(1, '🇺🇸', "English", 'en'),
      Language(2, '🇸🇦', "العربية", 'ar'),
    ];
  }
}