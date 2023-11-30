// @strict-types

#Область СлужебныйПрограммныйИнтерфейс

// Значение соответствует шаблону.
// 
// Параметры:
//  Значение - Произвольный
//           - Структура из КлючИЗначение:
//           * Ключ - Строка
//  Шаблон - Структура - Шаблон структуры, наличия свойств которых нужно проверить в значении
// 
// Возвращаемое значение:
//  Булево
Функция ЗначениеСоответствуетШаблону(Значение, Шаблон) Экспорт
	
	Соответствует = Истина;
	
	Если ТипЗнч(Значение) = Тип("Структура") Тогда
		
		Если Шаблон.Количество() <> Значение.Количество() Тогда
			Соответствует = Ложь;
		Иначе
			Для Каждого КлючИЗначение Из Шаблон Цикл
				Если НЕ Значение.Свойство(КлючИЗначение.Ключ) Тогда
					Соответствует = Ложь;
					Прервать;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
		
	КонецЕсли;
	
	Возврат Соответствует;
	
КонецФункции

// Пустое описание оповещения.
// 
// Возвращаемое значение:
//  см. ОписаниеОповещения
Функция ПустоеОписаниеОповещения() Экспорт
	
	Возврат ОписаниеОповещения("", "");
	
КонецФункции

// Описание оповещения
//  
// Параметры: 
//  ИмяПроцедуры - Строка, Неопределено - Имя экспортируемой процедуры модуля, которая будет вызвана.
//  Модуль - ОбщийМодуль, Строка - Программный модуль, процедура которого будет вызвана
//  ДополнительныеПараметры - Неопределено, Произвольный - Значение любого типа, 
//		которое при вызове будет передано в указанную процедуру последним параметром.
//  ИмяПроцедурыОбработкиОшибки - Строка - Имя экспортируемой процедуры модуля, 
//		которая будет вызвана в случае возникновения ошибки.
//  МодульОбработкиОшибки - ОбщийМодуль, Строка, Неопределено - Программный модуль, 
//		процедура которого будет вызвана в случае возникновения ошибки
//		При использовании типа ФормаКлиентскогоПриложения 
//		будет вызван метод модуля указанной формы клиентского приложения. 
//		При использовании типа КомандаКомандногоИнтерфейса 
//		будет вызван метод модуля команды командного интерфейса. 
//		При использовании типа ОбщийМодуль будет вызван метод общего неглобального модуля.
// 
// Возвращаемое значение:
//  Структура - Описание оповещения:
// * ИмяПроцедуры - см. ОписаниеОповещения.ИмяПроцедуры
// * Модуль - см. ОписаниеОповещения.Модуль
// * ДополнительныеПараметры - см. ОписаниеОповещения.ДополнительныеПараметры
// * ИмяПроцедурыОбработкиОшибки - см. ОписаниеОповещения.ИмяПроцедурыОбработкиОшибки
// * МодульОбработкиОшибки - ОбщийМодуль, Строка, Неопределено -
//
// Отключаемые проверки:
//	BSLLS:MissingReturnedValueDescription-off - баг BSL LS
//	BSLLS:MissingParameterDescription-off - баг BSL LS
Функция ОписаниеОповещения(ИмяПроцедуры, Модуль, ДополнительныеПараметры = Неопределено, 
	ИмяПроцедурыОбработкиОшибки = "", МодульОбработкиОшибки = "") Экспорт
	
	ОписаниеОповещения = Новый Структура;
	ОписаниеОповещения.Вставить("ИмяПроцедуры", ИмяПроцедуры);
	ОписаниеОповещения.Вставить("Модуль", Модуль);
	ОписаниеОповещения.Вставить("ДополнительныеПараметры", ДополнительныеПараметры);
	ОписаниеОповещения.Вставить("ИмяПроцедурыОбработкиОшибки", ИмяПроцедурыОбработкиОшибки);
	ОписаниеОповещения.Вставить("МодульОбработкиОшибки", МодульОбработкиОшибки);
	
	// @skip-check constructor-function-return-section - баг ЕДТ
	Возврат ОписаниеОповещения;
	
КонецФункции

// Выполняемое действие. Может использоваться в команде и в результате поиска
// 
// Возвращаемое значение:
//  Структура:
// * ОткрываемоеЗначение - Неопределено, Произвольный - Значение, которое необходимо открыть
// * ПутьПерехода - Строка - Полный путь перехода по глобальному поиску
// * ОткрываемаяФорма - см. ОписаниеОткрываемойФормы
// * ОписаниеОповещения - см. ОписаниеОповещения
// * ДополнительныеПараметры - Структура из КлючИЗначение - :
// ** Ключ - Строка
// ** Значение - Произвольный
Функция ВыполняемоеДействие() Экспорт

	Результат = Новый Структура;
	Результат.Вставить("ОткрываемоеЗначение", Неопределено);	
	Результат.Вставить("ПутьПерехода", "");
	Результат.Вставить("ОписаниеОповещения", Неопределено);
	Результат.Вставить("ОткрываемаяФорма", Неопределено);
	Результат.Вставить("ДополнительныеПараметры", Новый Структура);
	
	//@skip-check constructor-function-return-section - #EDT786
	Возврат Результат;
	
КонецФункции

// Описание открываемой формы.
// 
// Параметры:
//  ИмяФормы - Строка - Имя открываемой формы
//  Параметры - Структура, Неопределено - Параметры формы
// 
// Возвращаемое значение:
//  Структура - Описание открываемой формы:
// * ИмяФормы - см. ОписаниеОткрываемойФормы.ИмяФормы
// * Параметры - см. ОписаниеОткрываемойФормы.Параметры
// * Владелец - Неопределено, Произвольный - см. метод платформы ОткрытьФорму.Владелец
// * Уникальность - Неопределено, Произвольный - см. метод платформы ОткрытьФорму.Уникальность
// * Окно - Неопределено, Произвольный - см. метод платформы ОткрытьФорму.Окно
// * НавигационнаяСсылка - Неопределено, Произвольный - см. метод платформы ОткрытьФорму.НавигационнаяСсылка
// * ОписаниеОповещенияОЗакрытии - Неопределено, Произвольный - см. метод платформы ОткрытьФорму.ОписаниеОповещенияОЗакрытии
// * РежимОткрытияОкна - Неопределено, Произвольный - см. метод платформы ОткрытьФорму.РежимОткрытияОкна
Функция ОписаниеОткрываемойФормы(ИмяФормы, Параметры = Неопределено) Экспорт
	
	Результат = Новый Структура;
	Результат.Вставить("ИмяФормы", ИмяФормы);
	Результат.Вставить("Параметры", Параметры);
	Результат.Вставить("Владелец", Неопределено);
	Результат.Вставить("Уникальность", Неопределено);
	Результат.Вставить("Окно", Неопределено);
	Результат.Вставить("НавигационнаяСсылка", Неопределено);
	Результат.Вставить("ОписаниеОповещенияОЗакрытии", Неопределено);
	Результат.Вставить("РежимОткрытияОкна", Неопределено);

	Возврат Результат;
	
КонецФункции

// Выполняемое действие открытия формы.
// 
// Параметры:
//  ИмяФормы - Строка - Имя открываемой формы
//  ПараметрыФормы - Структура, Неопределено - Параметры формы
// 
// Возвращаемое значение:
//  см. ВыполняемоеДействие
Функция ВыполняемоеДействиеОткрытияФормы(ИмяФормы, ПараметрыФормы = Неопределено) Экспорт
	
	Результат = ВыполняемоеДействие();
	Результат.ОткрываемаяФорма = ОписаниеОткрываемойФормы(ИмяФормы, ПараметрыФормы);
	Возврат Результат;
	
КонецФункции

// Выполняемое действие открытия значения.
// 
// Параметры:
//  ОткрываемоеЗначение - Произвольный
// 
// Возвращаемое значение:
//  см. ВыполняемоеДействие
Функция ВыполняемоеДействиеОткрытияЗначения(ОткрываемоеЗначение) Экспорт
	
	Результат = ВыполняемоеДействие();
	Результат.ОткрываемоеЗначение = ОткрываемоеЗначение;
	
	Возврат Результат;
	
КонецФункции

// Выполняемое действие выполнения описания оповещения
// 
// Параметры:
//  ОписаниеОповещения - см. ОписаниеОповещения
// 
// Возвращаемое значение:
//  см. ВыполняемоеДействие
Функция ВыполняемоеДействиеОписанияОповещения(ОписаниеОповещения) Экспорт
	
	Результат = ВыполняемоеДействие();
	Результат.ОписаниеОповещения = ОписаниеОповещения;
	
	Возврат Результат;
	
КонецФункции

// Выполняемое действие выполнения описания оповещения
// 
// Параметры:
//  ПараметрыВыполнения - см. УстановитьПутьПерехода.ПараметрыВыполнения
//  КлючКоманды - см. УстановитьПутьПерехода.КлючКоманды
//  ПередаваемыеПараметры - см. УстановитьПутьПерехода.ПередаваемыеПараметры
// 
// Возвращаемое значение:
//  см. ВыполняемоеДействие
Функция ВыполняемоеДействиеПереходаНаКоманду(ПараметрыВыполнения, 
	КлючКоманды = "", ПередаваемыеПараметры = Неопределено) Экспорт
	
	Результат = ВыполняемоеДействие();
	УстановитьПутьПерехода(Результат, ПараметрыВыполнения, КлючКоманды, ПередаваемыеПараметры);
	
	Возврат Результат;
	
КонецФункции

// Заполнить путь перехода в данных результата.
// 
// Параметры:
//  ВыполняемоеДействие - см. ВыполняемоеДействие
//  ПараметрыВыполнения - Неопределено - Параметры выполнения команды, на которую нужно перейти
//  					- см. ШаблонПараметровВыполненияКомандыПоиска
//  КлючКоманды - Строка - Ключ подчиненной команды
//  ПередаваемыеПараметры - Массив из Произвольный
//  				 - Произвольный
//  				 - Неопределено
// 
Процедура УстановитьПутьПерехода(ВыполняемоеДействие, ПараметрыВыполнения, 
	КлючКоманды = "", ПередаваемыеПараметры = Неопределено) Экспорт
		
	ЧастиСтроки = Новый Массив; // Массив из Строка
	
	Если ЗначениеЗаполнено(КлючКоманды) Тогда
		ЧастиСтроки.Добавить(КлючКоманды);
	КонецЕсли;
	
	Для Каждого ПараметрКоманды Из ПараметрыВыполнения.ПараметрыКоманды Цикл
		ЧастиСтроки.Добавить(ПараметрКоманды);
	КонецЦикла;
	
	Если ТипЗнч(ПередаваемыеПараметры) = Тип("Массив") Тогда
		Для Каждого ПараметрКоманды Из ПередаваемыеПараметры Цикл
			ЧастиСтроки.Добавить(Строка(ПараметрКоманды));
		КонецЦикла;
	ИначеЕсли ПередаваемыеПараметры <> Неопределено Тогда
		ЧастиСтроки.Добавить(Строка(ПередаваемыеПараметры));
	КонецЕсли;
	
	ЧастиСтроки.Добавить(ПараметрыВыполнения.СтрокаПоиска);
	
	ВыполняемоеДействие.ПутьПерехода = ПараметрыВыполнения.ПолныйКлюч 
		+ СтрСоединить(ЧастиСтроки, ПараметрыВыполнения.Разделитель);
	
КонецПроцедуры

// Пустые параметры выполнения команды. 
// Заполняется в клиенстком модуле и передается в план поиска
// 
// Возвращаемое значение:
//  Структура - :
// * Ключ - Строка - Ключ команды
// * ПолныйКлюч - Строка - Полный ключ команды
// * Разделитель - Строка - Разделитель команд
// * ВозможныПараметры - Булево - 
// * ПараметрыКоманды - Массив из Строка - Параметры, переданные после имени команды с использованием разделителя
// * ПолныйКлючСКомандами - Строка - Полный ключ команды, включая параметры
// * СтрокаПоиска - Строка - Строка поиска с вырезанным ключем команды
// * СтрокаПоискаВрег - Строка - СтрокаПоиска в верхнем регистре
// * СловаПоиска - Массив из Строка - СтрокаПоискаВрег разбитая на слова
// * МаксимальныйПриоритет - Число - Максимальный приоритет, устанавливаемый для идеального совпадения по строке поиска
// * ЛимитСтрокРезультата - Число - Максимальное число выводимых строк результата
// * ДополнительныеПараметры - Структура из КлючИЗначение:
// ** Ключ - Строка
// ** Значение - Произвольный
Функция ШаблонПараметровВыполненияКомандыПоиска() Экспорт
	
	Результат = Новый Структура;
	Результат.Вставить("Ключ", "");
	Результат.Вставить("ПолныйКлюч", "");
	Результат.Вставить("Разделитель", "");
	Результат.Вставить("ВозможныПараметры", Ложь);
	Результат.Вставить("ПараметрыКоманды", Новый Массив);
	Результат.Вставить("ПолныйКлючСКомандами", "");
	Результат.Вставить("СтрокаПоиска", "");
	Результат.Вставить("СтрокаПоискаВрег", "");
	Результат.Вставить("СловаПоиска", Новый Массив);
	Результат.Вставить("МаксимальныйПриоритет", 999);
	Результат.Вставить("ЛимитСтрокРезультата", 0);
	Результат.Вставить("ДополнительныеПараметры", Новый Структура);
	
	Возврат Результат;
	
КонецФункции

// Ключ вида расширенного глобального поиска. 
// По нему определяем, что при нажатии нужно выполнять свою логику
// 
// Возвращаемое значение:
//  Строка
Функция КлючВидаРасширенногоГлобальногоПоиска() Экспорт
	
	Возврат "РГП_РасширенныйГлобальныйПоиск";
	
КонецФункции

// Необходимо ли переданный ЭлементРезультата обрабатывать методами расширения
// 
// Параметры:
//  ЭлементРезультата - ЭлементРезультатаГлобальногоПоиска
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоЭлементРезультатаРасширенногоГлобальногоПоиска(ЭлементРезультата) Экспорт
	
	Возврат ЭлементРезультата.ВидПоиска = КлючВидаРасширенногоГлобальногоПоиска();
	
КонецФункции

// Добавляет элемент результата глобального поиска.
// 
// Параметры:
//  РезультатыПоиска - РезультатГлобальногоПоиска
//  ВыполняемоеДействие - Произвольный
//                      - см. ВыполняемоеДействие
//  Представление - Строка - Представление
//  Картинка - Неопределено, Картинка - Картинка
//  Описание - Строка - Описание
Процедура ДобавитьЭлементРезультатаГлобальногоПоиска(РезультатыПоиска, 
	ВыполняемоеДействие, Представление = "", 
	Картинка = Неопределено, Описание = "") Экспорт
	
	ЭлементРезультата = ЭлементРезультатаГлобальногоПоиска(
		ВыполняемоеДействие, Представление, Картинка, Описание);
	
	РезультатыПоиска.Добавить(ЭлементРезультата);
	
КонецПроцедуры

// Новый элемент результата глобального поиска.
// 
// Параметры:
//  ВыполняемоеДействие - Произвольный
//                      - см. ВыполняемоеДействие
//  Представление - Строка - Представление
//  Картинка - Неопределено, Картинка - Картинка
//  Описание - Строка - Описание
// 
// Возвращаемое значение:
//  ЭлементРезультатаГлобальногоПоиска
Функция ЭлементРезультатаГлобальногоПоиска(ВыполняемоеДействие, 
	Представление = "", Картинка = Неопределено, Описание = "") Экспорт
	
	Возврат Новый ЭлементРезультатаГлобальногоПоиска(ВыполняемоеДействие, 
		Представление, Картинка, КлючВидаРасширенногоГлобальногоПоиска(), Описание);
	
КонецФункции

// Добавить элемент результата стандартной команды ввода строки
// 
// Параметры:
//  РезультатыПоиска - РезультатГлобальногоПоиска
//  ПараметрыВыполнения - см. ШаблонПараметровВыполненияКомандыПоиска
Процедура ДобавитьЭлементРезультатаСтандартнойКоманды_ВводСтроки(РезультатыПоиска, ПараметрыВыполнения) Экспорт
	
	Элемент = ЭлементРезультатаКомандаВводаСтроки(
		ПараметрыВыполнения.ПолныйКлючСКомандами, ПараметрыВыполнения.СтрокаПоиска);
		
	РезультатыПоиска.Добавить(Элемент);
	
КонецПроцедуры

// Добавить элемент результата стандартной команды обновления результатов поиска
// 
// Параметры:
//  РезультатыПоиска - РезультатГлобальногоПоиска
//  ПараметрыВыполнения - см. ШаблонПараметровВыполненияКомандыПоиска
Процедура ДобавитьЭлементРезультатаСтандартнойКоманды_Обновить(РезультатыПоиска, ПараметрыВыполнения) Экспорт
	
	ВыполняемоеДействие = ВыполняемоеДействие();
	
	УстановитьПутьПерехода(ВыполняемоеДействие, ПараметрыВыполнения);
	ЭлементРезультата = ЭлементРезультатаГлобальногоПоиска(
		ВыполняемоеДействие, "Обновить", БиблиотекаКартинок.Обновить);
	
	РезультатыПоиска.Добавить(ЭлементРезультата);
	
КонецПроцедуры

// Элемент результата команда ввода строки в конце поля поиска.
// 
// Параметры:
//  СтрокаПоиска - Строка - Строка поиска, в конце которой будет подставлена введенная строка
//  НачальнаяСтрока - Строка - Начальное значение строки, которое будет использовано в качестве начального значения в окне ввода.
//  Представление - Строка - Представление в заголовке поля ввода
// 
// Возвращаемое значение:
//  ЭлементРезультатаГлобальногоПоиска
Функция ЭлементРезультатаКомандаВводаСтроки(СтрокаПоиска, НачальнаяСтрока = "", Знач Представление = "") Экспорт
	
	Если ПустаяСтрока(Представление) Тогда
		Если ПустаяСтрока(НачальнаяСтрока) Тогда
			Представление = "Введите строку для поиска";
		Иначе
			Представление = СтрШаблон("Строка поиска: %1", НачальнаяСтрока);
		КонецЕсли;
	КонецЕсли;
	
	ПараметрыМетода = ПараметрыДействияВводаСтроки(СтрокаПоиска, НачальнаяСтрока, Представление);
	
	ВыполняемоеДействие = ВыполняемоеДействие();
	ВыполняемоеДействие.ОписаниеОповещения = ОписаниеОповещения(
		"ОтобразитьВводСтроки", "РГП_ГлобальныйПоискКлиент", ПараметрыМетода);
	
	Возврат ЭлементРезультатаГлобальногоПоиска(ВыполняемоеДействие, Представление, БиблиотекаКартинок.ПоискДанных);
	
КонецФункции

// Параметры действия ввода строки.
// 
// Параметры:
//  СтрокаПоиска - см. ЭлементРезультатаКомандаВводаСтроки.СтрокаПоиска
//  НачальнаяСтрока - см. ЭлементРезультатаКомандаВводаСтроки.НачальнаяСтрока
//  Представление - см. ЭлементРезультатаКомандаВводаСтроки.Представление
// 
// Возвращаемое значение:
//  Структура - Параметры действия ввода строки:
//  * СтрокаПоиска - см. ЭлементРезультатаКомандаВводаСтроки.СтрокаПоиска
//  * НачальнаяСтрока - см. ЭлементРезультатаКомандаВводаСтроки.НачальнаяСтрока
//  * Представление - см. ЭлементРезультатаКомандаВводаСтроки.Представление
Функция ПараметрыДействияВводаСтроки(СтрокаПоиска, НачальнаяСтрока, Представление) Экспорт
	
	Параметры = Новый Структура;
	Параметры.Вставить("СтрокаПоиска", СтрокаПоиска);
	Параметры.Вставить("Представление", Представление);
	Параметры.Вставить("НачальнаяСтрока", НачальнаяСтрока);
	
	Возврат Параметры;
	
КонецФункции

// Стандартные команды
// 
// Возвращаемое значение:
//  Структура - Стандартные команды:
// * Назад - Строка - Команда "Назад" для возвращения к предыдущей команде
// * ВводСтроки - Строка - Команда "Ввод строки" для изменения строки поиска
// * Обновить - Строка - Команда "Обновить" для обновления результатов поиска
// * ВывестиКоманды - Строка - Команда "ВывестиКоманды" для вывода подчиненных команд
Функция СтандартныеКоманды() Экспорт

	Команды = Новый Структура;
	Команды.Вставить("Назад", "Назад");
	Команды.Вставить("ВводСтроки", "ВводСтроки");
	Команды.Вставить("Обновить", "Обновить");
	Команды.Вставить("ВывестиКоманды", "ВывестиКоманды");
	
	Возврат Команды;
	
КонецФункции

// Выполняемое действие вычисления выражения.
// 
// Параметры:
//  ПолныйКлючКоманды - Строка
//  НаСервере - Булево
//  НачальноеВыражение - Строка
// 
// Возвращаемое значение:
//  см. ВыполняемоеДействиеОписанияОповещения
Функция ВыполняемоеДействиеВычисленияВыражения(ПолныйКлючКоманды, НаСервере, НачальноеВыражение = "") Экспорт
	
	ИмяМодуля = "РГП_ГлобальныйПоискКлиент";
	ИмяМетода = "ГлобальныйПоискВычислитьВыражение";
	
	ПараметрыОповещения = ДополнительныеПараметрыВыполненияКомандыВычисленияВыражения(
		НаСервере, НачальноеВыражение, ПолныйКлючКоманды);
		
	ОписаниеОповещения  = ОписаниеОповещения(ИмяМетода, ИмяМодуля, ПараметрыОповещения);
	
	Возврат ВыполняемоеДействиеОписанияОповещения(ОписаниеОповещения);
	
КонецФункции

// Дополнительные параметры выполнения команды вычисления выражения.
// 
// Параметры:
//  НаСервере - Булево
//  НачальноеВыражение - Строка
//  ПолныйКлючКоманды - Строка
// 
// Возвращаемое значение:
//  Структура:
// * НаСервере - Булево
// * НачальноеВыражение - Строка
// * ПолныйКлючКоманды - Строка
Функция ДополнительныеПараметрыВыполненияКомандыВычисленияВыражения(
	НаСервере, НачальноеВыражение, ПолныйКлючКоманды) Экспорт
	
	Результат = Новый Структура;
	Результат.Вставить("НаСервере", НаСервере);
	Результат.Вставить("НачальноеВыражение", НачальноеВыражение);
	Результат.Вставить("ПолныйКлючКоманды" , ПолныйКлючКоманды);
	
	Возврат Результат;
	
КонецФункции

// Элемент истории вычисления выражения.
// 
// Возвращаемое значение:
//  Структура -  Элемент истории вычисления выражения:
// * НаСервере - Булево - Признак вычисления на сервере
// * Выражение - Строка - Текст выражения
// * ОписаниеОшибки - Строка
// * Успешно - Булево - Успешно ли выполнилось выражение или упало в ошибку
// * ПредставлениеТипа - Строка - Тип результата строкой
// * Результат - Неопределено, Произвольный - Результат выражения
// * Представление - Строка
// * Дата - Дата - Дата последнего использования
Функция ЭлементИсторииВычисленияВыражения() Экспорт
	
	Результат = Новый Структура;
	Результат.Вставить("НаСервере", Ложь);
	Результат.Вставить("Выражение", "");
	Результат.Вставить("Успешно", Ложь);
	Результат.Вставить("ОписаниеОшибки", "");
	Результат.Вставить("ПредставлениеТипа", "");
	Результат.Вставить("Результат", Неопределено);
	Результат.Вставить("Представление", "");
	Результат.Вставить("Дата", '0001 01 01');
	
	Возврат Результат;
	
КонецФункции

#Область Вспомогательные

// Проверяет доступность хотя бы одной роли с учетом данных в кэше
// Сначала проверяем все роли из кэша. Если ролей нет в кэше, то запрашиваем их, помещаем в кэш и проверяем снова
// 
// Параметры:
//  Параметры - см. РГП_ГлобальныйПоискКлиент.ПараметрыРасширенногоГлобальногоПоиска
//  ИменаРолей - см. МассивИменРолейИзПараметра.ИменаРолей
// 
// Возвращаемое значение:
//  Булево
Функция РолиДоступны(Параметры, ИменаРолей) Экспорт
	
	Если ЭтоПолноправныйПользователь(Параметры) Тогда
		Возврат Истина;
	КонецЕсли;
	
	РолиПользователя = Параметры.КэшированныеДанные.РолиПользователя;
	ПолучаемыеРоли = Новый Массив; // Массив из Строка
	
	КоллекцииРолей = Новый Массив; // Массив из Массив
	КоллекцииРолей.Добавить(МассивИменРолейИзПараметра(ИменаРолей));
	КоллекцииРолей.Добавить(ПолучаемыеРоли);
	
	Для НомерКоллекции = 1 По КоллекцииРолей.Количество() Цикл
		
		ЭтоПерваяКоллекция = (НомерКоллекции = 1);
		КоллекцияРолей     = КоллекцииРолей.Получить(НомерКоллекции - 1);
		
		Для Каждого ИмяРоли Из КоллекцияРолей Цикл // Строка
			
			РольДоступна = РолиПользователя.Получить(ИмяРоли);
			Если РольДоступна = Истина Тогда
				Возврат Истина;
			ИначеЕсли РольДоступна = Неопределено И ЭтоПерваяКоллекция Тогда
				ПолучаемыеРоли.Добавить(ИмяРоли);
			КонецЕсли;
			
		КонецЦикла;
		
		Если ЭтоПерваяКоллекция Тогда
			ДополнитьКэшРолейПользователей(Параметры, ПолучаемыеРоли);
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Ложь;
	
КонецФункции

// Проверяет доступность права пользователя
// Сначала проверяем все роли из кэша. Если ролей нет в кэше, то запрашиваем их, помещаем в кэш и проверяем снова
// 
// Параметры:
//  Параметры - см. РГП_ГлобальныйПоискКлиент.ПараметрыРасширенногоГлобальногоПоиска
//  ИмяПрава - Строка
//  ИмяМетаданного - Строка
// 
// Возвращаемое значение:
//  Булево
Функция ЕстьПравоДоступа(Параметры, ИмяПрава, ИмяМетаданного = "") Экспорт
	
	Если ЭтоПолноправныйПользователь(Параметры) Тогда
		Возврат Истина;
	КонецЕсли;
	
	ПраваПользователя = Параметры.КэшированныеДанные.ПраваПользователя;
	КлючПоискаПрава   = КлючКэшаПоискаПоПравамПользователей(ИмяПрава, ИмяМетаданного);
	ЕстьПравоДоступа  = ПраваПользователя.Получить(КлючПоискаПрава);
	Если ЕстьПравоДоступа = Неопределено Тогда
		ДополнитьКэшПравПользователей(Параметры, ИмяПрава, ИмяМетаданного);
		ЕстьПравоДоступа = ПраваПользователя.Получить(КлючПоискаПрава);
	КонецЕсли;
	
	Возврат ЕстьПравоДоступа;
	
КонецФункции

// Дополняет кэш доступности ролей пользователей
// 
// Параметры:
//  Параметры - см. РГП_ГлобальныйПоискКлиент.ПараметрыРасширенногоГлобальногоПоиска
//  ИменаРолей - см. МассивИменРолейИзПараметра.ИменаРолей
// 
Процедура ДополнитьКэшРолейПользователей(Параметры, ИменаРолей) Экспорт
	
	МассивРолей = МассивИменРолейИзПараметра(ИменаРолей);
	// @skip-check unknown-method-property - Баг ЕДТ
	ДополнениеКэша = РГП_ГлобальныйПоискВызовСервера.ДоступностьРолейПользователя(МассивРолей);
	Для Каждого КлючИЗначение Из ДополнениеКэша Цикл
		Параметры.КэшированныеДанные.РолиПользователя.Вставить(ВРег(КлючИЗначение.Ключ), КлючИЗначение.Значение);
	КонецЦикла;
	
КонецПроцедуры

// Дополняет кэш доступности прав пользователей
// 
// Параметры:
//  Параметры - см. РГП_ГлобальныйПоискКлиент.ПараметрыРасширенногоГлобальногоПоиска
//  ИмяПрава - Строка
//  ИмяМетаданного - Строка
// 
Процедура ДополнитьКэшПравПользователей(Параметры, ИмяПрава, ИмяМетаданного = "") Экспорт
	
	// @skip-check unknown-method-property - Баг ЕДТ
	ЕстьПравоДоступа  = РГП_ГлобальныйПоискВызовСервера.ЕстьПравоДоступа(ИмяПрава, ИмяМетаданного);
	КлючПоискаПрава   = КлючКэшаПоискаПоПравамПользователей(ИмяПрава, ИмяМетаданного);
	Параметры.КэшированныеДанные.ПраваПользователя.Вставить(КлючПоискаПрава, ЕстьПравоДоступа);
	
КонецПроцедуры

// Массив имен ролей из параметра.
// 
// Параметры:
//  ИменаРолей - Строка, Массив из Строка - Массив имен или строка, разделенная запятыми или переносами строк
// 
// Возвращаемое значение:
//  Массив из Строка
Функция МассивИменРолейИзПараметра(ИменаРолей) Экспорт
	
	Если ТипЗнч(ИменаРолей) = Тип("Строка") Тогда
		Результат = СтрРазделить(ИменаРолей, "," + Символы.ПС, Ложь);
	ИначеЕсли ТипЗнч(ИменаРолей) = Тип("Массив") Тогда
		Результат = ИменаРолей;
	Иначе
		ВызватьИсключение СтрШаблон("Передан параметр некорректного типа %1", ТипЗнч(ИменаРолей));
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

// Это полноправный пользователь.
// 
// Параметры:
//  Параметры - см. РГП_ГлобальныйПоискКлиент.ПараметрыРасширенногоГлобальногоПоиска
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоПолноправныйПользователь(Параметры) Экспорт
	
	Возврат Параметры.КэшированныеДанные.ЭтоПолноправныйПользователь;
	
КонецФункции

// Вычислить выражение.
// 
// Параметры:
//  ТекстВыражения - Строка
//  НаСервере - Булево
// 
// Возвращаемое значение:
//  см. РГП_ГлобальныйПоискКлиентСервер.ЭлементИсторииВычисленияВыражения
Функция ВычислитьВыражение(ТекстВыражения, НаСервере = Ложь) Экспорт
	
	Результат = ЭлементИсторииВычисленияВыражения();
	
	Если НаСервере Тогда
		
		// @skip-check unknown-method-property - Баг ЕДТ
		РезультатСервер = РГП_ГлобальныйПоискВызовСервера.ВычислитьВыражение(ТекстВыражения);
		ЗаполнитьЗначенияСвойств(Результат, РезультатСервер);
		Результат.НаСервере = Истина;
		
	Иначе
		
		Результат.Выражение = ТекстВыражения;
		Результат.Дата = РГП_ГлобальныйПоискВызовСервера.ТекущаяДатаСервера();
	
		// @skip-check server-execution-safe-mode - в данном случае весь смысл выполнить выражение без ограничений
		Попытка
			Значение = Вычислить(ТекстВыражения);
			Результат.Представление = Строка(Значение);
			Результат.ПредставлениеТипа = Строка(ТипЗнч(Значение));
			#Если Сервер ИЛИ ТолстыйКлиентУправляемоеПриложение Тогда
				Попытка
					Результат.Результат = ПоместитьВоВременноеХранилище(Значение);
				Исключение
					Результат.Результат = Результат.Представление;
				КонецПопытки;
			#Иначе
				Результат.Результат = Значение;
			#КонецЕсли
			Результат.Успешно = Истина;
		Исключение
			
			ИнформацияОбОшибке = ИнформацияОбОшибке();
			Если ТипЗнч(ИнформацияОбОшибке.Причина) = Тип("ИнформацияОбОшибке") Тогда
				ИнформацияОбОшибке = ИнформацияОбОшибке.Причина;
			КонецЕсли;
			Результат.ОписаниеОшибки = ИнформацияОбОшибке.Описание;
			ЛишнееНачало = "{<Неизвестный модуль>(1,1)}: ";
			Если СтрНачинаетсяС(Результат.ОписаниеОшибки, ЛишнееНачало) Тогда
				Результат.ОписаниеОшибки = Сред(Результат.ОписаниеОшибки, СтрДлина(ЛишнееНачало) + 1);
			КонецЕсли;
			
		КонецПопытки;
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

// Обрезать строку.
// 
// Параметры:
//  Строка - Строка - Строка, которую нужно обрезать, если ее длина превышает допустимую
//  МаксимальнаяДлина - Число - Максимально допустимая длина строки
Процедура ОбрезатьСтроку(Строка, Знач МаксимальнаяДлина) Экспорт
	
	Если СтрДлина(Строка) > МаксимальнаяДлина Тогда
		ОкончаниеСтроки = "...";
		Строка = Лев(Строка, МаксимальнаяДлина - СтрДлина(ОкончаниеСтроки)) + ОкончаниеСтроки;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Формирует ключ кэша поиска по правам пользователей.
// 
// Параметры:
//  ИмяПрава - Строка
//  ИмяМетаданного - Строка
// 
// Возвращаемое значение:
//  Строка
Функция КлючКэшаПоискаПоПравамПользователей(Знач ИмяПрава, ИмяМетаданного)
	
	ИмяПрава = ВРег(ИмяПрава);
	Если ПустаяСтрока(ИмяМетаданного) Тогда
		Возврат ИмяПрава;
	Иначе
		Возврат СтрШаблон("%1 | %2", ВРег(ИмяПрава), ВРег(ИмяМетаданного));
	КонецЕсли;
	
КонецФункции

#КонецОбласти
