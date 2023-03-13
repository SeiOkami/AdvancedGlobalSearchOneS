// @strict-types

#Область СлужебныйПрограммныйИнтерфейс

// Глобальный поиск метаданные.
// 
// Параметры:
//  ИзначальнаяСтрокаПоиска - Строка - Строка, по которой выполняется поиск.
//  РезультатыПоиска - РезультатГлобальногоПоиска - Выходной параметр. Содержит результаты поиска.
//  ПараметрыКоманды - см. РГП_ГлобальныйПоискКлиентСервер.ПараметрыВыполненияКомандыРасширенногоГлобальногоПоиска
Процедура ГлобальныйПоискМетаданные(ИзначальнаяСтрокаПоиска, РезультатыПоиска, ПараметрыКоманды) Экспорт
	
	ПараметрыВыполнения = ПараметрыВыполненияГлобальногоПоискаМетаданных(ИзначальнаяСтрокаПоиска, ПараметрыКоманды);
	
	РГП_ГлобальныйПоискСерверПереопределяемый.Модуль().ПередВыполнениемГлобальногоПоискаМетаданных(
		ПараметрыВыполнения, ИзначальнаяСтрокаПоиска);
	
	РГП_ГлобальныйПоискКлиентСервер.ДобавитьЭлементРезультатаКомандаВводаСтрокиНаОсновеДанныхПоиска(
			РезультатыПоиска, ПараметрыВыполнения.ДанныеПоиска);
	
	ГлобальныйПоискМетаданные_НайтиПодходящиеМетаданные(ПараметрыВыполнения);
	
	ГлобальныйПоискМетаданные_ЗаполнитьРезультатыПоиска(ПараметрыВыполнения, РезультатыПоиска);

КонецПроцедуры

// Параметры выполнения глобального поиска метаданных.
// 
// Параметры:
//  ИзначальнаяСтрокаПоиска - Строка - Изначальная строка поиска
//  ПараметрыКоманды - см. РГП_ГлобальныйПоискКлиентСервер.ПараметрыВыполненияКомандыРасширенногоГлобальногоПоиска
// 
// Возвращаемое значение:
//  Структура - Параметры выполнения глобального поиска метаданных:
// * ДанныеПоиска - см. РГП_ГлобальныйПоискКлиентСервер.ДанныеПоискаКомандыГлобальногоПоиска
// * СловарьПоиска - см. ШаблонСловаряГлобальногоПоискаМетаданных
// * ПодходящиеМетаданные - ТаблицаЗначений - коллекция подходящих под строку поиска метаданных:
// ** СтрокаСловаря - СтрокаТаблицыЗначений: см. КоллекцияМетаданныхСловаряГлобальногоПоиска
// ** Приоритет - Число - Приоритет вывода. Пользователь первыми будет видеть строки с максимальным значением
Функция ПараметрыВыполненияГлобальногоПоискаМетаданных(ИзначальнаяСтрокаПоиска, ПараметрыКоманды) Экспорт
	
	ПараметрыВыполнения = Новый Структура();
	ПараметрыВыполнения.Вставить("ДанныеПоиска", 
		РГП_ГлобальныйПоискКлиентСервер.ДанныеПоискаКомандыГлобальногоПоиска(ПараметрыКоманды, ИзначальнаяСтрокаПоиска));
	
	ПараметрыВыполнения.Вставить("СловарьПоиска"   , СловарьГлобальногоПоискаМетаданных());
	
	ПодходящиеМетаданные = Новый ТаблицаЗначений;
	ПодходящиеМетаданные.Колонки.Добавить("СтрокаСловаря", Новый ОписаниеТипов("СтрокаТаблицыЗначений"));
	ПодходящиеМетаданные.Колонки.Добавить("Приоритет", Новый ОписаниеТипов("Число"));
	
	ПараметрыВыполнения.Вставить("ПодходящиеМетаданные", ПодходящиеМетаданные);
	
	Возврат ПараметрыВыполнения;
	
КонецФункции

// Словарь глобального поиска метаданных.
// 
// Параметры:
//  ИзКэша - Булево - Выбирать ли закэшированную структуру
//  	Не рекомендуется Передавать значение Ложь, так как все внутренние механизмы используют закэшированное значение
// 
// Возвращаемое значение:
//  см. ШаблонСловаряГлобальногоПоискаМетаданных
Функция СловарьГлобальногоПоискаМетаданных(ИзКэша = Истина) Экспорт
	
	Если ИзКэша Тогда
		Возврат РГП_ГлобальныйПоискСерверПовтИсп.СловарьГлобальногоПоискаМетаданных();
	КонецЕсли;
	
	Словарь = ШаблонСловаряГлобальногоПоискаМетаданных();
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.БизнесПроцессы, "БизнесПроцессы", "БизнесПроцесс", "БП");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.Документы, "Документы", "Документ", "Док");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.ЖурналыДокументов, "ЖурналыДокументов", "ЖурналДокументов", "Журнал,ЖД,Документ");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.Задачи, "Задачи", "Задача");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.Обработки, "Обработки", "Обработка", "Обр");
		
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.Отчеты, "Отчеты", "Отчет", "Отч");
		
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.ПланыВидовРасчета, "ПланыВидовРасчета", "ПланВидовРасчета", "ПВР,ПланВидаРасчета,ПланРасчета");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.ПланыВидовХарактеристик, 
		"ПланыВидовХарактеристик", "ПланВидовХарактеристик", "ПВХ,ПланВидаХарактеристик");
		
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.ПланыОбмена, "ПланыОбмена", "ПланОбмена", "ПО,Обмен");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.ПланыСчетов, "ПланыСчетов", "ПланСчетов", "ПС,Счет,Счета");
		
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.РегистрыБухгалтерии, "РегистрыБухгалтерии", "РегистрБухгалтерии", "РБ,Бухгалтерия,БУ");
	
    ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.РегистрыНакопления, "РегистрыНакопления", "РегистрНакопления", "РН");
	
    ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.РегистрыРасчета, "РегистрыРасчета", "РегистрРасчета", "РР");
		
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.РегистрыСведений, "РегистрыСведений", "РегистрСведений", "РС");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.Справочники, "Справочники", "Справочник", "Спр");
	
	Словарь.Метаданные.Сортировать("Имя");
	
	Возврат Словарь;
		
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Глобальный поиск метаданные найти подходящие метаданные.
// 
// Параметры:
//  ПараметрыВыполнения - см. ПараметрыВыполненияГлобальногоПоискаМетаданных
Процедура ГлобальныйПоискМетаданные_НайтиПодходящиеМетаданные(ПараметрыВыполнения)
	
	КлючТипа = ПараметрыВыполнения.СловарьПоиска.КлючиТипов.Получить(
		ВРег(ПараметрыВыполнения.ДанныеПоиска.ПараметрыВыполнения.Ключ));
	ПустаяСтрокаПоиска = ПустаяСтрока(ПараметрыВыполнения.ДанныеПоиска.СтрокаПоиска);
	
	Если КлючТипа = Неопределено Тогда
		Если ПустаяСтрокаПоиска Тогда
			Возврат;
		КонецЕсли;
		ДанныеСловаря = ПараметрыВыполнения.СловарьПоиска.Метаданные;
	Иначе
		//@skip-check statement-type-change
		ДанныеСловаря = ПараметрыВыполнения.СловарьПоиска.Метаданные.НайтиСтроки(Новый Структура("ИмяТипа", КлючТипа));
	КонецЕсли;
	
	ПодходящиеМетаданные = ПараметрыВыполнения.ПодходящиеМетаданные;
	
	Для Каждого СтрокаСловаря Из ДанныеСловаря Цикл //СтрокаТаблицыЗначений: см. КоллекцияМетаданныхСловаряГлобальногоПоиска
		
		Если ПустаяСтрокаПоиска Тогда
			Если ПодходящиеМетаданные.Количество() >= ПараметрыВыполнения.ДанныеПоиска.ЛимитСтрокРезультата Тогда
				Возврат;
			Иначе
				ПодходящиеМетаданные.Добавить().СтрокаСловаря = СтрокаСловаря;
			КонецЕсли;
		Иначе
			ГлобальныйПоискМетаданные_ОбработатьСтрокуСловаря(ПараметрыВыполнения, СтрокаСловаря);
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

// Глобальный поиск метаданные обработать строку словаря.
// 
// Параметры:
//  ПараметрыВыполнения - см. ПараметрыВыполненияГлобальногоПоискаМетаданных
//  СтрокаСловаря - СтрокаТаблицыЗначений: см. КоллекцияМетаданныхСловаряГлобальногоПоиска
Процедура ГлобальныйПоискМетаданные_ОбработатьСтрокуСловаря(ПараметрыВыполнения, СтрокаСловаря)
	
	МаксимальныйПриоритет = ПараметрыВыполнения.ДанныеПоиска.МаксимальныйПриоритет;
	
	Приоритет = 0;

	ПроверяемыеСвойстваМетаданных    = Новый Массив(3); //Массив из Строка
	ПроверяемыеСвойстваМетаданных[0] = ВРег(СтрокаСловаря.Имя);
	ПроверяемыеСвойстваМетаданных[1] = ВРег(СтрокаСловаря.Представление);
	ПроверяемыеСвойстваМетаданных[2] = ВРег(СтрокаСловаря.ПолноеИмя);

	Для ИндексСвойства = 0 По ПроверяемыеСвойстваМетаданных.Количество() - 1 Цикл

		ЗначениеСвойства = ПроверяемыеСвойстваМетаданных[ИндексСвойства];
		Если ЗначениеСвойства = ПараметрыВыполнения.ДанныеПоиска.СтрокаПоискаВрег Тогда
			Приоритет = МаксимальныйПриоритет;
		Иначе
			НайденнаяКоордината = СтрНайти(ЗначениеСвойства, ПараметрыВыполнения.ДанныеПоиска.СтрокаПоискаВрег);
			Если НайденнаяКоордината = 0 Тогда
				Продолжить;
			ИначеЕсли НайденнаяКоордината = 1 Тогда
				Приоритет = МаксимальныйПриоритет - 1;
			Иначе
				Приоритет = МаксимальныйПриоритет - 2;
			КонецЕсли;
		КонецЕсли;

		Прервать;

	КонецЦикла;

	Если Приоритет = 0 Тогда
		Для Каждого СловоПоиска Из ПараметрыВыполнения.ДанныеПоиска.СловаПоиска Цикл
			Если СтрНайти(СтрокаСловаря.КлючевыеСлова, СловоПоиска) > 0 Тогда
				Приоритет = Приоритет + 1;
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;

	Если Приоритет > 0 Тогда
		СтрокаМетаданных = ПараметрыВыполнения.ПодходящиеМетаданные.Добавить();
		СтрокаМетаданных.СтрокаСловаря = СтрокаСловаря;
		СтрокаМетаданных.Приоритет = Приоритет;
	КонецЕсли;	
	
КонецПроцедуры

// Глобальный поиск метаданные найти подходящие метаданные.
// 
// Параметры:
//  ПараметрыВыполнения - см. ПараметрыВыполненияГлобальногоПоискаМетаданных
//  РезультатыПоиска - см. ГлобальныйПоискМетаданные.РезультатыПоиска
Процедура ГлобальныйПоискМетаданные_ЗаполнитьРезультатыПоиска(ПараметрыВыполнения, РезультатыПоиска)
	
	ДоступноРезультатов  = ПараметрыВыполнения.ДанныеПоиска.ЛимитСтрокРезультата;
	ПодходящиеМетаданные = ПараметрыВыполнения.ПодходящиеМетаданные;
	ПодходящиеМетаданные.Сортировать("Приоритет УБЫВ");
	
	Для Каждого СтрокаМетаданных Из ПодходящиеМетаданные Цикл
		
		СтрокаСловаря = СтрокаМетаданных.СтрокаСловаря; //СтрокаТаблицыЗначений: см. КоллекцияМетаданныхСловаряГлобальногоПоиска
		
		РезультатыПоиска.Добавить(
			СтрокаСловаря.НавигационнаяСсылка, 
			СтрокаСловаря.ПолноеИмя, 
			СтрокаСловаря.Картинка);
		
		ДоступноРезультатов = ДоступноРезультатов - 1;
		Если ДоступноРезультатов = 0 Тогда
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

// Шаблон словаря поиска метаданных.
// 
// Возвращаемое значение:
//  Структура - Шаблон словаря поиска метаданных:
// * КлючиТипов - Соответствие из КлючИЗначение:
// ** Ключ - Строка
// ** Значение - Строка
// * Метаданные - см. КоллекцияМетаданныхСловаряГлобальногоПоиска
Функция ШаблонСловаряГлобальногоПоискаМетаданных()
	
	Словарь = Новый Структура;
	Словарь.Вставить("КлючиТипов", Новый Соответствие);
	Словарь.Вставить("Метаданные", КоллекцияМетаданныхСловаряГлобальногоПоиска());
	
	Возврат Словарь;
		
КонецФункции

// Коллекция метаданных словаря глобального поиска.
// 
// Возвращаемое значение:
//  ТаблицаЗначений - Коллекция метаданных словаря глобального поиска:
// * Имя - Строка
// * Представление - Строка
// * ПолноеИмя - Строка
// * ИмяТипа - Строка
// * ИмяТипаЕд - Строка
// * КлючевыеСлова - Строка
// * Картинка - Картинка
// * НавигационнаяСсылка - Строка
Функция КоллекцияМетаданныхСловаряГлобальногоПоиска()
	
	Результат = Новый ТаблицаЗначений;
	
	Результат.Колонки.Добавить("Имя"          , Новый ОписаниеТипов("Строка"));
	Результат.Колонки.Добавить("Представление", Новый ОписаниеТипов("Строка"));
	Результат.Колонки.Добавить("ПолноеИмя"    , Новый ОписаниеТипов("Строка"));
	Результат.Колонки.Добавить("ИмяТипа"      , Новый ОписаниеТипов("Строка"));
	Результат.Колонки.Добавить("ИмяТипаЕд"    , Новый ОписаниеТипов("Строка"));
	Результат.Колонки.Добавить("КлючевыеСлова", Новый ОписаниеТипов("Строка"));
	Результат.Колонки.Добавить("Картинка"     , Новый ОписаниеТипов("Картинка"));
	Результат.Колонки.Добавить("НавигационнаяСсылка", Новый ОписаниеТипов("Строка"));
	
	Результат.Индексы.Добавить("ИмяТипа");
	
	Возврат Результат;
	
КонецФункции

// Добавить метаданные в словарь.
// 
// Параметры:
//  Словарь - см. СловарьГлобальногоПоискаМетаданных
//  КоллекцияМетаданных - КоллекцияОбъектовМетаданных
//  ИмяКоллекции - Строка
//  ИмяКоллекцииЕд - Строка
//  СокращенияТипа - Строка
Процедура ДобавитьМетаданныеВСловарь(Знач Словарь, Знач КоллекцияМетаданных, Знач ИмяКоллекции, Знач ИмяКоллекцииЕд, Знач СокращенияТипа = "")
	
	ИмяКоллекции   = ВРег(ИмяКоллекции);
	ИмяКоллекцииЕд = ВРег(ИмяКоллекцииЕд);
	СокращенияТипа = ВРег(СокращенияТипа);
	КартинкаТипа   = БиблиотекаКартинок[ИмяКоллекцииЕд]; //Картинка
		
	Для Каждого ОбъектМетаданных Из КоллекцияМетаданных Цикл
		
		Если НЕ ПравоДоступа("Просмотр", ОбъектМетаданных) Тогда
			Продолжить;
		КонецЕсли;
		
		НоваяСтрока = Словарь.Метаданные.Добавить();
		НоваяСтрока.ПолноеИмя = ОбъектМетаданных.ПолноеИмя();
		НоваяСтрока.Имя = ОбъектМетаданных.Имя;
		НоваяСтрока.Представление = ОбъектМетаданных.Представление();
		НоваяСтрока.ИмяТипа = ИмяКоллекции;
		НоваяСтрока.ИмяТипаЕд = ИмяКоллекцииЕд;
		НоваяСтрока.Картинка  = КартинкаТипа;
		НоваяСтрока.НавигационнаяСсылка = ПолучитьНавигационнуюСсылку(ОбъектМетаданных);
		
		КлючевыеСлова = Новый Массив;
		КлючевыеСлова.Добавить(ВРег(ОбъектМетаданных.Имя));
		КлючевыеСлова.Добавить(ВРег(ОбъектМетаданных.Представление()));
		
		НоваяСтрока.КлючевыеСлова = ВРег(СтрСоединить(КлючевыеСлова, " "));
		
	КонецЦикла;
	
	Словарь.КлючиТипов.Вставить(ИмяКоллекции, ИмяКоллекции);
	Словарь.КлючиТипов.Вставить(ИмяКоллекцииЕд, ИмяКоллекции);
	Для Каждого Сокращение Из СтрРазделить(СокращенияТипа, ",", Ложь) Цикл
		Словарь.КлючиТипов.Вставить(Сокращение, ИмяКоллекции);			
	КонецЦикла;
		
КонецПроцедуры

#КонецОбласти
