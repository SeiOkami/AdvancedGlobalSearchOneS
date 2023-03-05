// @strict-types

#Область СлужебныйПрограммныйИнтерфейс

// Переопределяемый модуль. 
// Метод позволяет подменить переопределяемый модуль, чтобы вести доработки в отдельном расширении
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция Модуль() Экспорт
	
	Возврат РГП_ГлобальныйПоискСерверПереопределяемый;
	
КонецФункции

// Перед выполнением глобального поиска метаданных.
// 
// Параметры:
//  ПараметрыВыполнения - см. РГП_ГлобальныйПоискСервер.ПараметрыВыполненияГлобальногоПоискаМетаданных
//  ИзначальнаяСтрокаПоиска - Строка - Изначальная строка поиска
Процедура ПередВыполнениемГлобальногоПоискаМетаданных(ПараметрыВыполнения, ИзначальнаяСтрокаПоиска) Экспорт
	
	//Можно доработать параметры выполнения
	
КонецПроцедуры

#КонецОбласти