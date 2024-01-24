// BSLLS:CommonModuleInvalidType-off - баг BSL LS

#Область СлужебныйПрограммныйИнтерфейс

// Словарь интерфейса.
// 
// Возвращаемое значение:
//  Соответствие из КлючИЗначение:
//  * Ключ - Строка
//  * Значение - Строка
Функция СловарьИнтерфейса() Экспорт
	
	КодТекущегоЯзыка = КодТекущегоЯзыка();
	СловариЯзыков = СловариЯзыков();
	
	Если СловариЯзыков.Свойство(КодТекущегоЯзыка) Тогда
		Возврат СловариЯзыков[КодТекущегоЯзыка];
	Иначе
		ВызватьИсключение "Language not found " + КодТекущегоЯзыка;
	КонецЕсли;
	
КонецФункции

// Параметры:
//  Фраза - Строка - Фраза на языке разработки
// 
// Возвращаемое значение:
//  Строка - Фраза на целевом языке интерфейса
Функция ФразаИнтерфейса(Фраза) Экспорт
	
	Словарь = РГП_ГлобальныйПоискКлиентСерверПовтИсп.СловарьИнтерфейса();
	
	Если Словарь.ЭтоЯзыкРазработки Тогда
		Возврат Фраза;
	КонецЕсли;
	
	ПолныйПеревод = Словарь.Перевод.Получить(Фраза);
	Если ПолныйПеревод = Неопределено Тогда
		Возврат Фраза;
	Иначе
		Возврат Строка(ПолныйПеревод);
	КонецЕсли;
	
КонецФункции

// см. РГП_ГлобальныйПоискСервер.ПереопределяемыеОбщиеМодули
Функция ПереопределяемыеОбщиеМодули(Клиент, Сервер) Экспорт
	
	Возврат РГП_ГлобальныйПоискВызовСервера.ПереопределяемыеОбщиеМодули(Клиент, Сервер);
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СловарьИнтерфейса_Русский()
	
	Результат = НовыйСловарьИнтерфейса();
	Результат.ЭтоЯзыкРазработки = Истина;
	
	Возврат Результат;
	
КонецФункции

Функция СловарьИнтерфейса_Английский()
	
	Результат = НовыйСловарьИнтерфейса();
	Результат.Перевод = ПереводСловаряИнтерфейса_Английский();
	
	Возврат Результат;
	
КонецФункции

Функция ПереводСловаряИнтерфейса_Английский()
	
	Результат = НовыйПереводСловаряИнтерфейса();
	
	Результат.Вставить("из", "out of");
	Результат.Вставить("Все", "All");
	Результат.Вставить("Код", "Code");
	Результат.Вставить("Тип", "Type");
	Результат.Вставить("Авто", "Auto");
	Результат.Вставить("Номер", "Number");
	Результат.Вставить("Поиск", "Search");
	Результат.Вставить("Найти", "Find");
	Результат.Вставить("Назад", "Back");
	Результат.Вставить("Форма", "Form");
	Результат.Вставить("Формы", "Forms");
	Результат.Вставить("Задачи", "Tasks");
	Результат.Вставить("Версия", "Version");
	Результат.Вставить("Отчеты", "Reports");
	Результат.Вставить("Команда", "Command");
	Результат.Вставить("Открыть", "Open");
	Результат.Вставить("Закрыть", "Close");
	Результат.Вставить("Создать", "Create");
	Результат.Вставить("Элемент", "Element");
	Результат.Вставить("Элементы", "Elements");
	Результат.Вставить("Изменить", "Edit");
	Результат.Вставить("Выводить", "Withdraw");
	Результат.Вставить("Выделить", "Highlight");
	Результат.Вставить("Обновить", "Update");
	Результат.Вставить("Страница", "Page");
	Результат.Вставить("Выведено", "Withdrawn");
	Результат.Вставить("НаКлиенте", "AtClient");
	Результат.Вставить("НаСервере", "AtServer");
	Результат.Вставить("Обработки", "Data processors");
	Результат.Вставить("Параметры", "Parametrs");
	Результат.Вставить("Настройки", "Settings");
	Результат.Вставить("Настройка", "Setting");
	Результат.Вставить("Документы", "Documents");
	Результат.Вставить("Избранное", "Favorites");
	Результат.Вставить("Выражение", "Expression");
	Результат.Вставить("Метаданные", "Metadata");
	Результат.Вставить("Информация", "Information");
	Результат.Вставить("ПланыОбмена", "ExchangePlans");
	Результат.Вставить("Справочники", "Catalogs");
	Результат.Вставить("Не выводить", "Don't withdraw");
	Результат.Вставить("ЦветВажного", "ImportantColor");
	Результат.Вставить("Ссылка СУБД", "Reference DBMS");
	Результат.Вставить("ПланыСчетов", "ChartsOfAccounts");
	Результат.Вставить("Планы обмена", "Exchange plans");
	Результат.Вставить("Планы счетов", "Charts of accounts");
	Результат.Вставить("Группировать", "Group");
	Результат.Вставить("Активировать", "Activate");
	Результат.Вставить("Наименование", "Description");
	Результат.Вставить("Битая ссылка", "Broken link");
	Результат.Вставить("Анализ данных", "Data analysis");
	Результат.Вставить("Строка поиска", "Search bar");
	Результат.Вставить("Текущая версия", "Current version");
	Результат.Вставить("БизнесПроцессы", "BusinessProcesses");
	Результат.Вставить("ГлобальныйПоиск", "GlobalSearch");
	Результат.Вставить("Не группировать", "Do not group");
	Результат.Вставить("Поиск по формам", "Search by form");
	Результат.Вставить("Бизнес процессы", "Business processes");
	Результат.Вставить("РегистрыРасчета", "CalculationRegisters");
	Результат.Вставить("Регистры расчета", "Calculation registers");
	Результат.Вставить("Введите страницу", "Enter page");
	Результат.Вставить("Текущее значение", "Current value");
	Результат.Вставить("РегистрыСведений", "InformationRegisters");
	Результат.Вставить("МелкийШрифтТекста", "SmallTextFont");
	Результат.Вставить("Введите выражение", "Enter the expression");
	Результат.Вставить("Регистры сведений", "Information registers");
	Результат.Вставить("ЖурналыДокументов", "DocumentJournals");
	Результат.Вставить("ПланыВидовРасчета", "ChartsOfCalculationTypes");
	Результат.Вставить("Недостаточно прав!", "Not right enough!");
	Результат.Вставить("Журналы документов", "Document journals");
	Результат.Вставить("КрупныйШрифтТекста", "LargeTextFont");
	Результат.Вставить("Сбросить настройки", "Reset settings");
	Результат.Вставить("Неизвестный модуль", "Unknown module");
	Результат.Вставить("РегистрыНакопления", "AccumulationRegisters");
	Результат.Вставить("Планы видов расчета", "Charts of calculation types");
	Результат.Вставить("Регистры накопления", "Accumulation registers");
	Результат.Вставить("Поиск по метаданным", "Metadata search");
	Результат.Вставить("Открыть репозиторий", "Open repository");
	Результат.Вставить("Вычислить выражение", "Execute expression");
	Результат.Вставить("РегистрыБухгалтерии", "AccountingRegisters");
	Результат.Вставить("Регистры бухгалтерии", "Accounting registers");
	Результат.Вставить("Навигационная ссылка", "Navigation link");
	Результат.Вставить("ЦветФонаВыделенияПоля", "FieldSelectionBackColor");
	Результат.Вставить("ЦветТекстаШапкиТаблицы", "TableHeaderTextColor");
	Результат.Вставить("ПланыВидовХарактеристик", "ChartsOfCharacteristicTypes");
	Результат.Вставить("Избранные команды поиска", "Favorite search commands");
	Результат.Вставить("Уникальный идентификатор", "Unique identifier");
	Результат.Вставить("Выводить варианты отчетов", "Display report options");
	Результат.Вставить("Максимум строк результата", "Maximum result lines");
	Результат.Вставить("Не найдена команда поиска", "Search command not found");
	Результат.Вставить("Планы видов характеристик", "Charts of characteristic types");
	Результат.Вставить("РасширенныйГлобальныйПоиск", "AdvancedGlobalSearch");
	Результат.Вставить("Не найден объект метаданных", "Metadata object not found");
	Результат.Вставить("Некорректное значение параметра", "Incorrect parameter value");
	Результат.Вставить("О расширении глобального поиска", "About the extension of global search");
	Результат.Вставить("Группировать стандартные команды", "Group standard commands");
	Результат.Вставить("Общее/ИзбранноеРаботыПользователя", "Common/UserWorkFavorites");
	Результат.Вставить("Передан параметр некорректного типа", "Parameter of incorrect type passed");
	Результат.Вставить("Значение не соответствует имени метода", "The value does not match the method name");
	Результат.Вставить("Передано некорректное имя общего модуля", "Incorrect common module name was passed");
	Результат.Вставить("Не найден обработчик стандартной команды", "Standard command handler not found");
	Результат.Вставить("Не найдено описание пользовательской настройки", "Customization description not found");
	
	Результат.Вставить(
		"Какое максимальное число строк результата выводить", 
		"What is the maximum number of result lines to output");
	
	Результат.Вставить(
		"Поиск по именам, синонимам, представлениям и подсказкам", 
		"Search by name, synonyms, views and hints");
	
	Результат.Вставить(
		"Стоит ли группировать стандартные команды в одном элементе", 
		"Whether it is worth grouping standard commands in one element");
	
	Результат.Вставить(
		"Стоит ли выводить варианты отчетов и искать по ним?
		|	(может замедлять поиск)",
		"Should I display and search for report variants?
		|	(may slow down the search)");
		
	Возврат Результат;
	
КонецФункции

// Возвращаемое значение:
//  Структура:
// * ЭтоЯзыкРазработки - Булево - Словарь для языка разработки (фразы не требуют перевода)
// * Перевод - см. НовыйПереводСловаряИнтерфейса
Функция НовыйСловарьИнтерфейса()
	
	Результат = Новый Структура;
	Результат.Вставить("ЭтоЯзыкРазработки", Ложь);
	Результат.Вставить("Перевод", НовыйПереводСловаряИнтерфейса());
	
	Возврат Результат;
	
КонецФункции

// Возвращаемое значение:
//  Соответствие из КлючИЗначение:
//  * Ключ - Строка - Фраза на языке разработки
//  * Значение - Строка - Фраза на целевом языке интерфейса
Функция НовыйПереводСловаряИнтерфейса()
	
	Возврат Новый Соответствие;
	
КонецФункции

Функция КодТекущегоЯзыка()
	
	КодЯзыка = НСтр("ru='ru';en='en'");
	Если ПустаяСтрока(КодЯзыка) Тогда
		Возврат "en";
	Иначе
		Возврат КодЯзыка;
	КонецЕсли;
	
КонецФункции

Функция СловариЯзыков()
	
	Результат = Новый Структура;
	Результат.Вставить("ru", СловарьИнтерфейса_Русский());
	Результат.Вставить("en", СловарьИнтерфейса_Английский());
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти