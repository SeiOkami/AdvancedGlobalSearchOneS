
#Область СлужебныйПрограммныйИнтерфейс

Процедура ГлобальныйПоискМетаданные(ИзначальнаяСтрокаПоиска, РезультатПоиска, ДополнительныеПараметры) Экспорт
	
	ПараметрыВыполнения = ПараметрыВыполненияГлобальногоПоискаМетаданных(ИзначальнаяСтрокаПоиска);
	Если ПараметрыВыполнения.ЕстьОшибки Тогда
		Возврат;
	КонецЕсли;
	
	Если ЗначениеЗаполнено(ПараметрыВыполнения.КлючПоиска) Тогда
		КлючТипа = ПараметрыВыполнения.СловарьПоиска.КлючиТипов.Получить(ПараметрыВыполнения.КлючПоиска);
	Иначе
		КлючТипа = Неопределено;
	КонецЕсли;
	
	Если КлючТипа = Неопределено Тогда
		ДанныеСловаря = ПараметрыВыполнения.СловарьПоиска.Метаданные;
	Иначе
		ДанныеСловаря = ПараметрыВыполнения.СловарьПоиска.Метаданные.НайтиСтроки(Новый Структура("ИмяТипа", КлючТипа));
	КонецЕсли;
	
	ПодходящиеМетаданные = Новый ТаблицаЗначений;
	ПодходящиеМетаданные.Колонки.Добавить("СтрокаСловаря");
	ПодходящиеМетаданные.Колонки.Добавить("Приоритет", Новый ОписаниеТипов("Число"));
	
	МаксимальныйПриоритет = 999;
	ПроверяемыеСвойстваМетаданных = Новый Массив(3);
	
	Для Каждого СтрокаСловаря Из ДанныеСловаря Цикл
		
		Приоритет = 0;
		
		ПроверяемыеСвойстваМетаданных[0] = ВРег(СтрокаСловаря.Имя);
		ПроверяемыеСвойстваМетаданных[1] = ВРег(СтрокаСловаря.Представление);
		ПроверяемыеСвойстваМетаданных[2] = ВРег(СтрокаСловаря.ПолноеИмя);
		
		Для ИндексСвойства = 0 По ПроверяемыеСвойстваМетаданных.Количество() - 1 Цикл
			
			ЗначениеСвойства = ПроверяемыеСвойстваМетаданных[ИндексСвойства];
			Если ЗначениеСвойства = ПараметрыВыполнения.СтрокаПоискаВрег Тогда
				Приоритет = МаксимальныйПриоритет;
			Иначе
				НайденнаяКоордината = СтрНайти(ЗначениеСвойства, ПараметрыВыполнения.СтрокаПоискаВрег);
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
			Для Каждого СловоПоиска Из ПараметрыВыполнения.СловаПоиска Цикл
				Если СтрНайти(СтрокаСловаря.КлючевыеСлова, СловоПоиска) > 0 Тогда
					Приоритет = Приоритет + 1;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
		
		Если Приоритет > 0 Тогда
			СтрокаМетаданных = ПодходящиеМетаданные.Добавить();
			СтрокаМетаданных.СтрокаСловаря = СтрокаСловаря;
			СтрокаМетаданных.Приоритет = Приоритет;
		КонецЕсли;
		
	КонецЦикла;
	
	ПодходящиеМетаданные.Сортировать("Приоритет УБЫВ");
	
	ДоступноРезультатов = ПараметрыВыполнения.ЛимитСтрокРезультата;
	Для Каждого СтрокаМетаданных Из ПодходящиеМетаданные Цикл
		
		СтрокаСловаря = СтрокаМетаданных.СтрокаСловаря;
		
		РезультатПоиска.Добавить(
			СтрокаСловаря.НавигационнаяСсылка, 
			СтрокаСловаря.ПолноеИмя, 
			БиблиотекаКартинок[СтрокаСловаря.ИмяТипаЕд]);
		
		ДоступноРезультатов = ДоступноРезультатов - 1;
		Если ДоступноРезультатов = 0 Тогда
			Прервать;
		КонецЕсли;
		
	КонецЦикла;

КонецПроцедуры

Функция СловарьПоискаМетаданных() Экспорт
	
	Словарь = ШаблонСловаряПоискаМетаданных();
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.БизнесПроцессы, "БизнесПроцессы", "БизнесПроцесс", "БП");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.Документы, "Документы", "Документ", "Док");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.ЖурналыДокументов, "ЖурналыДокументов", "ЖурналДокумента", "Журнал,ЖД");
	
	ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.Задачи, "Задачи", "Задача");
	
	//ДобавитьМетаданныеВСловарь(Словарь, 
	//	Метаданные.Константы, "Константы", "Константа", "Конст");
	
    ДобавитьМетаданныеВСловарь(Словарь, 
		Метаданные.Обработки, "Обработки", "Обработка", "Обр");
		
	//ДобавитьМетаданныеВСловарь(Словарь, 
	//	Метаданные.ОбщиеФормы, "ОбщиеФормы", "Форма", "ОбщаяФорма");
		
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
		
	Возврат Словарь;
		
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПараметрыВыполненияГлобальногоПоискаМетаданных(ИзначальнаяСтрокаПоиска)
	
	ПараметрыВыполнения = Новый Структура;
	
	ПараметрыВыполнения.Вставить("СтрокаПоиска" , СокрЛП(ИзначальнаяСтрокаПоиска));
	ПараметрыВыполнения.Вставить("КлючПоиска"   , "");
	ЗаполнитьПараметрыВыполненияГлобальногоПоискаМетаданных_РазделитьКлючИСтрокуПоиска(ПараметрыВыполнения);
	
	ПараметрыВыполнения.Вставить("СтрокаПоискаВрег"  , ВРег(ПараметрыВыполнения.СтрокаПоиска));
	ПараметрыВыполнения.Вставить("СловаПоиска"       , СтрРазделить(ПараметрыВыполнения.СтрокаПоискаВрег, " .\/", Ложь));
	
	ПараметрыВыполнения.Вставить("СловарьПоиска", РГП_ГлобальныйПоискПовтИсп.СловарьПоискаМетаданных());
	
	ПараметрыВыполнения.Вставить("ЕстьОшибки", Ложь);
	Если ПустаяСтрока(ПараметрыВыполнения.СтрокаПоиска) Тогда
		ПараметрыВыполнения.ЕстьОшибки = Истина;
	КонецЕсли;
	
	ПараметрыВыполнения.Вставить("МаксимальныйПриоритет", 999);
	ПараметрыВыполнения.Вставить("ЛимитСтрокРезультата" , 100);
	
	Возврат ПараметрыВыполнения;
	
КонецФункции

Процедура ЗаполнитьПараметрыВыполненияГлобальногоПоискаМетаданных_РазделитьКлючИСтрокуПоиска(ПараметрыВыполнения)
	
	РазделителиКлюча = Новый Массив(2);
	РазделителиКлюча[0] = " ";
	РазделителиКлюча[1] = ".";
	
	ДлинаСтроки  = СтрДлина(ПараметрыВыполнения.СтрокаПоиска);
	КлючПоиска   = Новый Массив;
	
	Для НомерСимвола = 2 По ДлинаСтроки Цикл
		
		ТекущийСимвол = Сред(ПараметрыВыполнения.СтрокаПоиска, НомерСимвола, 1);
		Если РазделителиКлюча.Найти(ТекущийСимвол) = Неопределено Тогда
			КлючПоиска.Добавить(ТекущийСимвол);
		Иначе
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	ПараметрыВыполнения.КлючПоиска = ВРег(СтрСоединить(КлючПоиска, ""));
	ПараметрыВыполнения.СтрокаПоиска = Сред(ПараметрыВыполнения.СтрокаПоиска, НомерСимвола + 1);
	
КонецПроцедуры

Функция ШаблонСловаряПоискаМетаданных()
	
	Словарь = Новый Структура;
	Словарь.Вставить("КлючиТипов", Новый Соответствие);
	Словарь.Вставить("Метаданные", Новый ТаблицаЗначений);
	
	Словарь.Метаданные.Колонки.Добавить("Имя"          , Новый ОписаниеТипов("Строка"));
	Словарь.Метаданные.Колонки.Добавить("Представление", Новый ОписаниеТипов("Строка"));
	Словарь.Метаданные.Колонки.Добавить("ПолноеИмя"    , Новый ОписаниеТипов("Строка"));
	Словарь.Метаданные.Колонки.Добавить("ИмяТипа"      , Новый ОписаниеТипов("Строка"));
	Словарь.Метаданные.Колонки.Добавить("ИмяТипаЕд"    , Новый ОписаниеТипов("Строка"));
	Словарь.Метаданные.Колонки.Добавить("КлючевыеСлова", Новый ОписаниеТипов("Строка"));
	Словарь.Метаданные.Колонки.Добавить("НавигационнаяСсылка", Новый ОписаниеТипов("Строка"));

	Словарь.Метаданные.Индексы.Добавить("ИмяТипа");
	
	Возврат Словарь;
		
КонецФункции

Процедура ДобавитьМетаданныеВСловарь(Словарь, КоллекцияМетаданных, Знач ИмяКоллекции, Знач ИмяКоллекцииЕд, Знач СокращенияТипа = "")
	
	ИмяКоллекции = ВРег(ИмяКоллекции);
	ИмяКоллекцииЕд = ВРег(ИмяКоллекцииЕд);
		
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
		НоваяСтрока.НавигационнаяСсылка = ПолучитьНавигационнуюСсылку(ОбъектМетаданных);
		
		КлючевыеСлова = Новый Массив;
		КлючевыеСлова.Добавить(ВРег(ОбъектМетаданных.Имя));
		КлючевыеСлова.Добавить(ВРег(ОбъектМетаданных.Представление()));
		
		НоваяСтрока.КлючевыеСлова = ВРег(СтрСоединить(КлючевыеСлова, " "));
		
	КонецЦикла;
	
	Словарь.КлючиТипов.Вставить(ИмяКоллекции, ИмяКоллекции);
	Словарь.КлючиТипов.Вставить(ИмяКоллекцииЕд, ИмяКоллекции);
	СокращенияТипа = СтрРазделить(ВРег(СокращенияТипа), ",", Ложь);
	Для Каждого Сокращение Из СокращенияТипа Цикл
		Словарь.КлючиТипов.Вставить(Сокращение, ИмяКоллекции);			
	КонецЦикла;
		
КонецПроцедуры

#КонецОбласти

