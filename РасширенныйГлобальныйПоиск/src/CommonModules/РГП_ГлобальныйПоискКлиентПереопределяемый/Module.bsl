// @strict-types

#Область СлужебныйПрограммныйИнтерфейс

// Переопределяемый модуль. 
// Метод позволяет подменить переопределяемый модуль, чтобы вести доработки в отдельном расширении
// 
// Возвращаемое значение:РГП_ГлобальныйПоискКлиент
//  ОбщийМодуль
Функция Модуль() Экспорт
	
	Возврат РГП_ГлобальныйПоискКлиентПереопределяемый;
	
КонецФункции

// см. РГП_ГлобальныйПоискКлиент.ПриНачалеРаботыСистемы
Процедура ПослеСобытияПриНачалеРаботыСистемы() Экспорт
	
	//Можно доработать
	
КонецПроцедуры

// см. РГП_ГлобальныйПоискКлиент.ПриГлобальномПоиске
Процедура ПослеСобытияПриГлобальномПоиске(ИзначальнаяСтрокаПоиска, ПланПоиска) Экспорт
	
	//Можно доработать
	
КонецПроцедуры

// После заполнения параметров расширенного глобального поиска.
// 
// Параметры:
//  ПараметрыПоиска - см. РГП_ГлобальныйПоискКлиент.ПараметрыРасширенногоГлобальногоПоиска
Процедура ПослеЗаполненияПараметровРасширенногоГлобальногоПоиска(ПараметрыПоиска) Экспорт
	
	//Можно доработать параметры поиска и добавить свои комады
	
КонецПроцедуры

// см. РГП_ГлобальныйПоискКлиент.ГлобальныйПоискВывестиПодчиненныеКоманды
Процедура ПослеВыводаПодчиненныхКомандГлобальногоПоиска(СтрокаПоиска, РезультатыПоиска, ОписаниеКоманды) Экспорт
	
	//
	
КонецПроцедуры

#КонецОбласти