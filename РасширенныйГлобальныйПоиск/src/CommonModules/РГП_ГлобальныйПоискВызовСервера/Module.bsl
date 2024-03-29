// @strict-types

#Область СлужебныйПрограммныйИнтерфейс

// Вычислить выражение.
// 
// Параметры:
//  ТекстВыражения - Строка
// 
// Возвращаемое значение:
//  Произвольный
Функция ВычислитьВыражение(Знач ТекстВыражения) Экспорт
	
	Возврат РГП_ГлобальныйПоискКлиентСервер.ВычислитьВыражение(ТекстВыражения, Ложь);
	
КонецФункции

// Проверить, что это полноправный пользователь.
Процедура ПроверитьЭтоПолноправныйПользователь() Экспорт
	
	Если НЕ РГП_ГлобальныйПоискСервер.ЭтоПолноправныйПользователь() Тогда
		РГП_ГлобальныйПоискКлиентСервер.ВызватьИсключениеНедостаточноПрав();
	КонецЕсли;
	
КонецПроцедуры

// см. РГП_ГлобальныйПоискСервер.ДобавитьЗаписьИсторииВыполненияКоманды
Процедура ДобавитьЗаписьИсторииВыполненияКоманды(
		Знач ПолныйКлючКоманды, Знач КлючЗаписи, Знач ДанныеИстории, Знач ХэшироватьКлючЗаписи = Ложь) Экспорт
	
	РГП_ГлобальныйПоискСервер.ДобавитьЗаписьИсторииВыполненияКоманды(
		ПолныйКлючКоманды, КлючЗаписи, ДанныеИстории, ХэшироватьКлючЗаписи);
	
КонецПроцедуры

// см. РГП_ГлобальныйПоискСервер.ПередЗаполнениемПараметровРасширенногоГлобальногоПоиска
Процедура ПередЗаполнениемПараметровРасширенногоГлобальногоПоиска(Параметры) Экспорт
	
	РГП_ГлобальныйПоискСервер.ПередЗаполнениемПараметровРасширенногоГлобальногоПоиска(Параметры);
	
КонецПроцедуры

// Доступность ролей пользователя.
// 
// Параметры:
//  ИменаРолей - Массив из Строка
//  
// Возвращаемое значение:
//  Соответствие из КлючИЗначение -:
//  * Ключ - Строка
//  * Значение - Булево
Функция ДоступностьРолейПользователя(Знач ИменаРолей) Экспорт
	
	Результат = Новый Соответствие;
	Для Каждого ИмяРоли Из ИменаРолей Цикл
		РольДоступна = РГП_ГлобальныйПоискСервер.РолиДоступны(ИмяРоли);
		Результат.Вставить(ИмяРоли, РольДоступна);
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

// Проверяет наличие у текущего пользователя права доступа
// 
// Параметры:
//  ИмяПрава - Строка
//  ИмяМетаданного - Строка
// 
// Возвращаемое значение:
//  Булево
Функция ЕстьПравоДоступа(Знач ИмяПрава, Знач ИмяМетаданного = "") Экспорт
	
	Если ПустаяСтрока(ИмяМетаданного) Тогда
		ОбъектМетаданных = Метаданные; // ОбъектМетаданных
	Иначе
		ОбъектМетаданных = Метаданные.НайтиПоПолномуИмени(ИмяМетаданного);
	КонецЕсли;
	
	Возврат ПравоДоступа(ИмяПрава, ОбъектМетаданных);
	
КонецФункции

// Текущая дата сервера.
// 
// Возвращаемое значение:
//  Дата
Функция ТекущаяДатаСервера() Экспорт
	
	Возврат ТекущаяДатаСеанса();
	
КонецФункции

// см. РГП_ГлобальныйПоискСервер.ДобавитьЗаписьЖР
Процедура ДобавитьЗаписьЖР(Знач Текст, Знач Уровень = "Ошибка") Экспорт
	
	РГП_ГлобальныйПоискСервер.ДобавитьЗаписьЖР(Текст, Уровень);
	
КонецПроцедуры

// см. РГП_ГлобальныйПоискСервер.ЗаписатьЗначенияПользовательскихНастроек
Процедура ЗаписатьЗначенияПользовательскихНастроек(Знач ПользовательскиеНастройки) Экспорт
	
	РГП_ГлобальныйПоискСервер.ЗаписатьЗначенияПользовательскихНастроек(ПользовательскиеНастройки);
	
КонецПроцедуры

// Шрифт стиля.
// 
// Параметры:
//  ИмяШрифта - Строка
// 
// Возвращаемое значение:
//  Шрифт
Функция ШрифтСтиля(Знач ИмяШрифта) Экспорт
	
	Возврат ШрифтыСтиля[ИмяШрифта];
	
КонецФункции

// Шрифт стиля.
// 
// Параметры:
//  ИмяЦвета - Строка
// 
// Возвращаемое значение:
//  Цвет
Функция ЦветСтиля(Знач ИмяЦвета) Экспорт
	
	Возврат ЦветаСтиля[ИмяЦвета];
	
КонецФункции

// см. РГП_ГлобальныйПоискСервер.ОбработчикКомандыОчисткиНастроек
Процедура ОбработчикКомандыОчисткиНастроек(Знач ПараметрыВыполнения) Экспорт
	
	РГП_ГлобальныйПоискСервер.ОбработчикКомандыОчисткиНастроек(ПараметрыВыполнения);
	
КонецПроцедуры

// см. РГП_ГлобальныйПоискСервер.ИзменитьИзбранное
Процедура ИзменитьИзбранное(Знач НавигационнаяСсылка = "", Знач НовыеДанные = Неопределено) Экспорт
	
	РГП_ГлобальныйПоискСервер.ИзменитьИзбранное(НавигационнаяСсылка, НовыеДанные);
	
КонецПроцедуры

// см. РГП_ГлобальныйПоискСервер.ПереопределяемыеОбщиеМодули
Функция ПереопределяемыеОбщиеМодули(Знач Клиент, Знач Сервер) Экспорт
	
	Возврат РГП_ГлобальныйПоискСервер.ПереопределяемыеОбщиеМодули(Клиент, Сервер);
	
КонецФункции

#КонецОбласти
