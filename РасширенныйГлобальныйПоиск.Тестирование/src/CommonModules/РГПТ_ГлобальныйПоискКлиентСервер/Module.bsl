
#Область СлужебныйПрограммныйИнтерфейс

// Регистрация тестов
Процедура ИсполняемыеСценарии() Экспорт

	Перем ЮТТесты;
	ЮТТесты = РГПТ_Движок.ЮТТесты();
	
	ЮТТесты
	
		//ПользовательскиеНастройки
		.ДобавитьТестовыйНабор("ПредставлениеЗначенияПользовательскойНастройки")
			.ДобавитьТест("Тест_ПредставлениеЗначенияПользовательскойНастройки_Авто", "Значение Авто")
			.ДобавитьТест("Тест_ПредставлениеЗначенияПользовательскойНастройки_Формат", "Форматная строка")
			.ДобавитьТест("Тест_ПредставлениеЗначенияПользовательскойНастройки_ДоступноеЗначение", "Доступное значение")
			
		.ДобавитьТестовыйНабор("ЗначениеПользовательскойНастройкиЕстьВДоступных")
			.ДобавитьТест("Тест_ЗначениеПользовательскойНастройкиЕстьВДоступных_Авто", "Значение Авто")
			.ДобавитьТест("Тест_ЗначениеПользовательскойНастройкиЕстьВДоступных_ДоступноеЗначение", "Доступное значение")
			.ДобавитьТест("Тест_ЗначениеПользовательскойНастройкиЕстьВДоступных_БезОграничений", "Без ограничений")
			
		.ДобавитьТестовыйНабор("ПривестиЗначениеКПользовательскойНастройке")
			.ДобавитьТест("Тест_ПривестиЗначениеКПользовательскойНастройке_Авто", "Значение Авто")
			.ДобавитьТест("Тест_ПривестиЗначениеКПользовательскойНастройке_ДоступноеЗначение", "Когда есть или нет в доступных")
			.ДобавитьТест("Тест_ПривестиЗначениеКПользовательскойНастройке_ПроверкаТипа", "Проверка типа значения")
			
		//ПараметрыСтраницРезультатаКоманды
		.ДобавитьТестовыйНабор("ПараметрыСтраницРезультатаКоманды")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_НеправильныеДанные", "Некорректные данные игнорируются")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_НетДанных", "Нет данных для вывода страниц")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_НаОднуСтраницу", "Данные на одну страницу")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_НаГраницеПервойСтраницы", "Данные на границе первой страницы")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_ВтораяСтраницаИзДвух", "Вторая страница из двух")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_ТретьяСтраницаНаГранице", "Третья страница на границе")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_НечетныеЧисла", "Нечетные числа")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_НеровныйОстаток", "Неровный остаток")
			.ДобавитьТест("Тест_ПараметрыСтраницРезультатаКоманды_СтраницаЗаГраницей", "Текущая страница больше чем их всего")
		
		//Вспомогательные
		.ДобавитьТестовыйНабор("ЗначениеСоответствуетШаблону")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиНеСтруктура", "Ложь, если НЕ структура")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиЛишнееСвойство", "Ложь, если в значении лишнее свойство")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиНедостающееСвойство", "Ложь, если в значении не хватает свойства")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ИстинаЕслиПустаяСтруктура", "Истина, если пустая структура")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ИстинаЕслиСоответствует", "Истина, если значение соответствует шаблону")
		.ДобавитьТестовыйНабор("ОписаниеТипов")
			.ДобавитьТест("Тест_ОписаниеТипов_ОписаниеТипов", "Описание типов из описания типов")
			.ДобавитьТест("Тест_ОписаниеТипов_Неопределено", "Описание типов из Неопределено")
			.ДобавитьТест("Тест_ОписаниеТипов_Тип", "Описание типов из Тип")
			.ДобавитьТест("Тест_ОписаниеТипов_МассивТипов", "Описание типов из массива типов")
			.ДобавитьТест("Тест_ОписаниеТипов_Строка", "Описание типов из Строка")
		.ДобавитьТестовыйНабор("ПривестиЧисло")
			.ДобавитьТест("Тест_ПривестиЧисло", "Проверка метода ограничения числа")
				.СПараметрами(1, -1, 2, 1)
				.СПараметрами(0, 1, 2, 1)
				.СПараметрами(1, Неопределено, Неопределено, 1)
				.СПараметрами(-5, 0, Неопределено, 0)
				.СПараметрами("", 0, Неопределено, 0)
				.СПараметрами("", Неопределено, Неопределено, Неопределено)
		
	;

КонецПроцедуры

#Область Тесты

#Область ПользовательскиеНастройки

#Область ПредставлениеЗначенияПользовательскойНастройки

Процедура Тест_ПредставлениеЗначенияПользовательскойНастройки_Авто() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	ОписаниеНастройки.ДоступноАвто = Истина;
	
	Результат = ТестируемыйМодуль.ПредставлениеЗначенияПользовательскойНастройки(ОписаниеНастройки, Неопределено);
	Ожидается = ТестируемыйМодуль.ПредставлениеЗначенияАвтоПользовательскойНастройки();
	
	ЮТест.ОжидаетЧто(Результат).Равно(Ожидается);
	
КонецПроцедуры

Процедура Тест_ПредставлениеЗначенияПользовательскойНастройки_Формат() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Ожидается = "Откл";
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	ОписаниеНастройки.ФорматнаяСтрока = СтрШаблон("БЛ=%1;", Ожидается);
	
	Результат = ТестируемыйМодуль.ПредставлениеЗначенияПользовательскойНастройки(ОписаниеНастройки, Ложь);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Ожидается);
	
КонецПроцедуры

Процедура Тест_ПредставлениеЗначенияПользовательскойНастройки_ДоступноеЗначение() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	ДоступноеЗначение = ОписаниеНастройки.ДоступныеЗначения.Добавить(Ложь, "Тестовая строка");
	
	Результат = ТестируемыйМодуль.ПредставлениеЗначенияПользовательскойНастройки(
		ОписаниеНастройки, ДоступноеЗначение.Значение);
	
	ЮТест.ОжидаетЧто(Результат).Равно(ДоступноеЗначение.Представление);
	
КонецПроцедуры

#КонецОбласти

#Область ЗначениеПользовательскойНастройкиЕстьВДоступных

Процедура Тест_ЗначениеПользовательскойНастройкиЕстьВДоступных_Авто() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	
	ОписаниеНастройки.ДоступноАвто = Истина;
	Результат = ТестируемыйМодуль.ЗначениеПользовательскойНастройкиЕстьВДоступных(ОписаниеНастройки, Неопределено);
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	
	ОписаниеНастройки.ДоступноАвто = Ложь;
	Результат = ТестируемыйМодуль.ЗначениеПользовательскойНастройкиЕстьВДоступных(ОписаниеНастройки, Неопределено);
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	
КонецПроцедуры

Процедура Тест_ЗначениеПользовательскойНастройкиЕстьВДоступных_ДоступноеЗначение() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	ДоступноеЗначение = ОписаниеНастройки.ДоступныеЗначения.Добавить(Новый УникальныйИдентификатор());
	
	Результат = ТестируемыйМодуль.ЗначениеПользовательскойНастройкиЕстьВДоступных(
		ОписаниеНастройки, ДоступноеЗначение.Значение);
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	
	Результат = ТестируемыйМодуль.ЗначениеПользовательскойНастройкиЕстьВДоступных(
		ОписаниеНастройки, Новый УникальныйИдентификатор());
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	
КонецПроцедуры

Процедура Тест_ЗначениеПользовательскойНастройкиЕстьВДоступных_БезОграничений() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	Результат = ТестируемыйМодуль.ЗначениеПользовательскойНастройкиЕстьВДоступных(
		ОписаниеНастройки, Новый УникальныйИдентификатор());
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	
КонецПроцедуры

#КонецОбласти

#Область ПривестиЗначениеКПользовательскойНастройке

Процедура Тест_ПривестиЗначениеКПользовательскойНастройке_Авто() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	ОписаниеНастройки.ЗначениеПоУмолчанию = Новый УникальныйИдентификатор();
	
	ПроверяемоеЗначение = Неопределено;
	Значение = ПроверяемоеЗначение;
	Изменено = Ложь;
	
	//Передаем Неопределено и Авто доступно
	ОписаниеНастройки.ДоступноАвто = Истина;
	ТестируемыйМодуль.ПривестиЗначениеКПользовательскойНастройке(Значение, ОписаниеНастройки, Изменено);
	ЮТест.ОжидаетЧто(Изменено).ЭтоЛожь();
	ЮТест.ОжидаетЧто(Значение).Равно(ПроверяемоеЗначение);
	
	//Передаем Неопределено, но Авто НЕ доступно
	ОписаниеНастройки.ДоступноАвто = Ложь;
	ТестируемыйМодуль.ПривестиЗначениеКПользовательскойНастройке(Значение, ОписаниеНастройки, Изменено);
	ЮТест.ОжидаетЧто(Изменено).ЭтоИстина();
	ЮТест.ОжидаетЧто(Значение).Равно(ОписаниеНастройки.ЗначениеПоУмолчанию);
	
КонецПроцедуры

Процедура Тест_ПривестиЗначениеКПользовательскойНастройке_ДоступноеЗначение() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ПроверяемоеЗначение = Новый УникальныйИдентификатор();
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	ОписаниеНастройки.ЗначениеПоУмолчанию = Новый УникальныйИдентификатор();
	ДоступноеЗначение = ОписаниеНастройки.ДоступныеЗначения.Добавить(ПроверяемоеЗначение);
	
	Значение = ПроверяемоеЗначение;
	Изменено = Ложь;
	
	//Передаем значение, которое ЕСТЬ в доступных
	ТестируемыйМодуль.ПривестиЗначениеКПользовательскойНастройке(Значение, ОписаниеНастройки, Изменено);
	ЮТест.ОжидаетЧто(Изменено).ЭтоЛожь();
	ЮТест.ОжидаетЧто(Значение).Равно(ПроверяемоеЗначение);
	
	//Передаем значение, которого НЕТ в доступных
	ДоступноеЗначение.Значение = Новый УникальныйИдентификатор();
	ТестируемыйМодуль.ПривестиЗначениеКПользовательскойНастройке(Значение, ОписаниеНастройки, Изменено);
	ЮТест.ОжидаетЧто(Изменено).ЭтоИстина();
	ЮТест.ОжидаетЧто(Значение).Равно(ОписаниеНастройки.ЗначениеПоУмолчанию);
	
КонецПроцедуры

Процедура Тест_ПривестиЗначениеКПользовательскойНастройке_ПроверкаТипа() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ПроверяемоеЗначение = Новый УникальныйИдентификатор();
	
	ОписаниеНастройки = ТестируемыйМодуль.НовыйОписаниеПользовательскойНастройки();
	ОписаниеНастройки.Тип = Новый ОписаниеТипов("УникальныйИдентификатор");
	
	Значение = ПроверяемоеЗначение;
	Изменено = Ложь;
	
	//Передаем значение, которое соответствует типу
	ТестируемыйМодуль.ПривестиЗначениеКПользовательскойНастройке(Значение, ОписаниеНастройки, Изменено);
	ЮТест.ОжидаетЧто(Изменено).ЭтоЛожь();
	ЮТест.ОжидаетЧто(Значение).Равно(ПроверяемоеЗначение);
	
	//Передаем значение, которое НЕ соответствует типу (кастуется к строке)
	ОписаниеНастройки.Тип = Новый ОписаниеТипов("Строка");
	ТестируемыйМодуль.ПривестиЗначениеКПользовательскойНастройке(Значение, ОписаниеНастройки, Изменено);
	ЮТест.ОжидаетЧто(Изменено).ЭтоИстина();
	ЮТест.ОжидаетЧто(Значение).Равно(Строка(ПроверяемоеЗначение));
	
	//Передаем значение, которое НЕ соответствует типу (не может кастоваться)
	Изменено = Ложь;
	Значение = ПроверяемоеЗначение;
	ОписаниеНастройки.Тип = Новый ОписаниеТипов("Число");
	ТестируемыйМодуль.ПривестиЗначениеКПользовательскойНастройке(Значение, ОписаниеНастройки, Изменено);
	ЮТест.ОжидаетЧто(Изменено).ЭтоИстина();
	ЮТест.ОжидаетЧто(Значение).Равно(0);
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область ПараметрыКоманды

#Область ПараметрыСтраницРезультатаКоманды

Функция Тест_ПараметрыСтраницРезультатаКоманды_Результат(МаксимумНаСтранице, ВсегоСтрок, ТекущаяСтраница = 0) Экспорт
	
	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ПараметрыВыполнения = ТестируемыйМодуль.ШаблонПараметровВыполненияКомандыПоиска();
	ПараметрыВыполнения.ПараметрыКоманды.Вставить(ТестируемыйМодуль.КлючПараметраКоманды_Страница(), ТекущаяСтраница);
	ПараметрыВыполнения.ПользовательскиеНастройки.МаксимумСтрокРезультата = МаксимумНаСтранице;
	
	ПараметрыСтраниц = ТестируемыйМодуль.ПараметрыСтраницРезультатаКоманды(ПараметрыВыполнения, ВсегоСтрок);
	
	Возврат ПараметрыСтраниц;
	
КонецФункции

Процедура Тест_ПараметрыСтраницРезультатаКоманды_НеправильныеДанные() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(-1, -1);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(0)
		.Свойство("ТекущаяСтраница").Равно(1)
		.Свойство("ВсегоРезультатов").Равно(0)
		.Свойство("ВыводитьСоСтроки").Равно(0)
		.Свойство("ОсталосьВывести").Равно(0)
		;
	
КонецПроцедуры

Процедура Тест_ПараметрыСтраницРезультатаКоманды_НетДанных() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(0, 0);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(0)
		.Свойство("ТекущаяСтраница").Равно(1)
		.Свойство("ВсегоРезультатов").Равно(0)
		.Свойство("ВыводитьСоСтроки").Равно(0)
		.Свойство("ОсталосьВывести").Равно(0)
		;
	
КонецПроцедуры

Процедура Тест_ПараметрыСтраницРезультатаКоманды_НаОднуСтраницу() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	МаксимумНаСтранице = 100;
	ВсегоРезультатов = 50;
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(МаксимумНаСтранице, ВсегоРезультатов);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(1)
		.Свойство("ТекущаяСтраница").Равно(1)
		.Свойство("ВсегоРезультатов").Равно(ВсегоРезультатов)
		.Свойство("ВыводитьСоСтроки").Равно(1)
		.Свойство("ОсталосьВывести").Равно(50)
		;
	
КонецПроцедуры

Процедура Тест_ПараметрыСтраницРезультатаКоманды_НаГраницеПервойСтраницы() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	МаксимумНаСтранице = 10;
	ВсегоРезультатов = 15;
	ТекущаяСтраница = 1;
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(
		МаксимумНаСтранице, ВсегоРезультатов, ТекущаяСтраница);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(2)
		.Свойство("ТекущаяСтраница").Равно(ТекущаяСтраница)
		.Свойство("ВсегоРезультатов").Равно(ВсегоРезультатов)
		.Свойство("ВыводитьСоСтроки").Равно(1)
		.Свойство("ОсталосьВывести").Равно(10)
		;
	
КонецПроцедуры

Процедура Тест_ПараметрыСтраницРезультатаКоманды_ВтораяСтраницаИзДвух() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	МаксимумНаСтранице = 10;
	ВсегоРезультатов = 15;
	ТекущаяСтраница = 2;
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(
		МаксимумНаСтранице, ВсегоРезультатов, ТекущаяСтраница);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(2)
		.Свойство("ТекущаяСтраница").Равно(ТекущаяСтраница)
		.Свойство("ВсегоРезультатов").Равно(ВсегоРезультатов)
		.Свойство("ВыводитьСоСтроки").Равно(11)
		.Свойство("ОсталосьВывести").Равно(5)
		;
	
КонецПроцедуры

Процедура Тест_ПараметрыСтраницРезультатаКоманды_ТретьяСтраницаНаГранице() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	МаксимумНаСтранице = 10;
	ВсегоРезультатов = 29;
	ТекущаяСтраница = 3;
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(
		МаксимумНаСтранице, ВсегоРезультатов, ТекущаяСтраница);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(3)
		.Свойство("ТекущаяСтраница").Равно(ТекущаяСтраница)
		.Свойство("ВсегоРезультатов").Равно(ВсегоРезультатов)
		.Свойство("ВыводитьСоСтроки").Равно(21)
		.Свойство("ОсталосьВывести").Равно(9)
		;
	
КонецПроцедуры

Процедура Тест_ПараметрыСтраницРезультатаКоманды_НечетныеЧисла() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	МаксимумНаСтранице = 3;
	ВсегоРезультатов = 33;
	ТекущаяСтраница = 3;
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(
		МаксимумНаСтранице, ВсегоРезультатов, ТекущаяСтраница);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(11)
		.Свойство("ТекущаяСтраница").Равно(ТекущаяСтраница)
		.Свойство("ВсегоРезультатов").Равно(ВсегоРезультатов)
		.Свойство("ВыводитьСоСтроки").Равно(7)
		.Свойство("ОсталосьВывести").Равно(3)
		;
	
КонецПроцедуры

Процедура Тест_ПараметрыСтраницРезультатаКоманды_НеровныйОстаток() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	МаксимумНаСтранице = 3;
	ВсегоРезультатов = 31;
	ТекущаяСтраница = 11;
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(
		МаксимумНаСтранице, ВсегоРезультатов, ТекущаяСтраница);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(11)
		.Свойство("ТекущаяСтраница").Равно(ТекущаяСтраница)
		.Свойство("ВсегоРезультатов").Равно(ВсегоРезультатов)
		.Свойство("ВыводитьСоСтроки").Равно(31)
		.Свойство("ОсталосьВывести").Равно(1)
		;
	
КонецПроцедуры

Процедура Тест_ПараметрыСтраницРезультатаКоманды_СтраницаЗаГраницей() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	МаксимумНаСтранице = 10;
	ВсегоРезультатов = 100;
	ТекущаяСтраница = 11;
	
	Результат = Тест_ПараметрыСтраницРезультатаКоманды_Результат(
		МаксимумНаСтранице, ВсегоРезультатов, ТекущаяСтраница);
	
	ЮТест.ОжидаетЧто(Результат)
		.Свойство("ВсегоСтраниц").Равно(10)
		.Свойство("ТекущаяСтраница").Равно(10)
		.Свойство("ВсегоРезультатов").Равно(ВсегоРезультатов)
		.Свойство("ВыводитьСоСтроки").Равно(91)
		.Свойство("ОсталосьВывести").Равно(10)
		;
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область Вспомогательные

#Область ЗначениеСоответствуетШаблону

Процедура Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиНеСтруктура() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(1,1);
	
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	
КонецПроцедуры

Процедура Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиЛишнееСвойство() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(
		Новый Структура("С1,С2,С3"), Новый Структура("С1,С2"));
	
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	
КонецПроцедуры

Процедура Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиНедостающееСвойство() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(
		Новый Структура("С1,С2"), Новый Структура("С1,С2,С3"));
	
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	
КонецПроцедуры

Процедура Тест_ЗначениеСоответствуетШаблону_ИстинаЕслиПустаяСтруктура() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(
		Новый Структура, Новый Структура);
	
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	
КонецПроцедуры

Процедура Тест_ЗначениеСоответствуетШаблону_ИстинаЕслиСоответствует() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(
		Новый Структура("С1,С2,С3"), Новый Структура("С1,С2,С3"));
	
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	
КонецПроцедуры

#КонецОбласти

#Область ОписаниеТипов

Процедура Тест_ОписаниеТипов_ОписаниеТипов() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = Новый ОписаниеТипов();
	Результат = ТестируемыйМодуль.ОписаниеТипов(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Параметр);
	
КонецПроцедуры

Процедура Тест_ОписаниеТипов_Неопределено() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ОписаниеТипов(Неопределено);
	
	ЮТест.ОжидаетЧто(Результат).ИмеетТип(Тип("ОписаниеТипов"));
			
	ЮТест.ОжидаетЧто(Результат.Типы().Количество()).Равно(0);
	
КонецПроцедуры

Процедура Тест_ОписаниеТипов_Тип() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = Тип("Строка");
	Результат = ТестируемыйМодуль.ОписаниеТипов(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).ИмеетТип(Тип("ОписаниеТипов"));
	
	ТипыРезультата = Результат.Типы();
	
	ЮТест.ОжидаетЧто(ТипыРезультата.Количество()).Равно(1);
	
	ЮТест.ОжидаетЧто(ТипыРезультата[0]).Равно(Параметр);
	
КонецПроцедуры

Процедура Тест_ОписаниеТипов_МассивТипов() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = Новый Массив;
	Параметр.Добавить(Тип("Строка"));
	Результат = ТестируемыйМодуль.ОписаниеТипов(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).ИмеетТип(Тип("ОписаниеТипов"));
	
	ТипыРезультата = Результат.Типы();
	
	ЮТест.ОжидаетЧто(ТипыРезультата.Количество()).Равно(Параметр.Количество());
	
	ЮТест.ОжидаетЧто(ТипыРезультата[0]).Равно(Параметр[0]);
	
КонецПроцедуры

Процедура Тест_ОписаниеТипов_Строка() Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = "Строка,Число,Булево";
	ПроверяемыеТипы = СтрРазделить(Параметр, ",");
	Результат = ТестируемыйМодуль.ОписаниеТипов(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).ИмеетТип(Тип("ОписаниеТипов"));
	
	ТипыРезультата = Результат.Типы();
	
	ЮТест.ОжидаетЧто(ТипыРезультата.Количество()).Равно(ПроверяемыеТипы.Количество());
	
	Для Каждого Тип Из ПроверяемыеТипы Цикл
		ЮТест.ОжидаетЧто(Результат.СодержитТип(Тип(Тип))).ЭтоИстина();
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#Область ПривестиЧисло

Процедура Тест_ПривестиЧисло(Знач Число, Минимум, Максимум, Результат) Экспорт

	Перем ЮТест;
	ЮТест = РГПТ_Движок.ЮТест();

	ТестируемыйМодуль().ПривестиЧисло(Число, Минимум, Максимум);
	ЮТест.ОжидаетЧто(Число).Равно(Результат);
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Тестируемый модуль.
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ТестируемыйМодуль()
	
	Возврат РГПТ_Модули.ГлобальныйПоискКлиентСервер();
	
КонецФункции

#КонецОбласти