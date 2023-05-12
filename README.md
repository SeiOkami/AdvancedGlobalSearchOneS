# Расширенный глобальный поиск 1С

Предназаначен для расширения функционала поля глобального поиска в 1С.

На его основе можно создавать удобное иерархическое меню, в котором расположить свои виды поиска.

Каждый элемент меню по умолчанию имеет кнопки:
- Команда "Назад" для возвращения к родительской команде
- Команда "Ввод строки" для изменения строки поиска
- Команда "Обновить" для обновления результатов поиска

Использование стандартных команд позволяет пользователям не вводить вручную имена команд с соответствием семантики.

## Встроенное меню

Расширение имеет встроенное меню для демонстрации возможностей. Активируется оно символом "\\".

![image](https://user-images.githubusercontent.com/42138875/226562486-7140f457-9141-4dd7-a0ed-8065f40b9d42.png)

<h3>Поиск по метаданным</h3>
  Позволяет искать метаданные по именам и синонимам. С фильтром по типу метаданных и без.
<details>
  <summary>Скриншоты</summary>
  <img src="https://user-images.githubusercontent.com/42138875/226563371-89a20078-391f-40f8-8616-159ba85f9cd4.png">
  <img src="https://user-images.githubusercontent.com/42138875/226563442-7a66b786-c3b5-46dc-b5a6-2aacd5e0df73.png">
  <img src="https://user-images.githubusercontent.com/42138875/226563606-872f1be6-2295-4cf0-bb39-54b30b138da3.png">
</details>

### Поиск по формам
  Позволяет искать по открытым формам. Формы можно активировать или закрывать.
  Дополнительно по форме можно искать элементы. Элемент можно активировать или дополнительно выделить заливкой. 
<details>
  <summary>Скриншоты</summary>
  <img src="https://user-images.githubusercontent.com/42138875/226564901-85e8cd31-185d-49ae-ab5c-20b2d57e2a53.png">
  <img src="https://user-images.githubusercontent.com/42138875/226565075-bccd0562-aa63-46ad-a7b9-6301489892fd.png">
</details>

## Разработка собственного меню<

Расширение имеет переопределяемые модули для возможности создания своих меню. Все возможности переопределения можно увидеть в самих модулях, но основное:

` РГП_ГлобальныйПоискКлиентПереопределяемый.ПослеЗаполненияПараметровРасширенногоГлобальногоПоиска() `

В данный метод попадает структура ПараметрыПоиска. Описание можно посмотреть в `РГП_ГлобальныйПоискКлиент.ПараметрыРасширенногоГлобальногоПоиска`

Путем добавления команд в структуру можно создавать свои пункты иерархического меню. 
Все взаимодействие с пользователем берет на себя расширение, а разработчику нужно только создать свои методы для поиска и использовать в них при построении результата методы расширения.

## Примеры своих команд

Все команды должны иметь родителя. Все кроме "корневой", которая активируется путём ввода специального символа. Этот же символ далее будет являться разделителем команд.

В расширении есть предопределенное меню с корневой командой, использующей символ. Получить основную команду можно так:

` ОбщаяКоманда = ПараметрыПоиска.Команды.Получить("\"); `

Далее можно добавлять свои команды. Простой пример:

```
НашеМеню = РГП_ГлобальныйПоискКлиент.НоваяКомандаРасширенногоПоиска(ПараметрыПоиска, "Наше", ОбщаяКоманда);
НашеМеню.Представление = "Наше меню";
```

Можно добавить свою картинку:

```
НашеМеню.Картинка = БиблиотекаКартинок.ПоискДанных;
```

И подчиненные команды:

Команда при нажатии открывает форму:
```
Команда = РГП_ГлобальныйПоискКлиент.НоваяКомандаРасширенногоПоиска(ПараметрыПоиска, "К1", НашеМеню);
Команда.Представление = "Открыть форму";
Команда.ВыполняемоеДействие = РГП_ГлобальныйПоискКлиентСервер.ВыполняемоеДействиеОткрытияФормы("ОбщаяФорма.ОбщиеНастройки");
```

Команда при нажатии открывает значение:
```
Команда = РГП_ГлобальныйПоискКлиент.НоваяКомандаРасширенногоПоиска(ПараметрыПоиска, "К2", НашеМеню);
Команда.Представление = "Открыть значение";
Команда.ВыполняемоеДействие = РГП_ГлобальныйПоискКлиентСервер.ВыполняемоеДействиеОткрытияЗначения(ТекущаяДата()); 
```

Команда при нажатии выполняет описание оповещения:
```
Команда = РГП_ГлобальныйПоискКлиент.НоваяКомандаРасширенногоПоиска(ПараметрыПоиска, "К3", НашеМеню);
Команда.Представление = "Описание оповещения";
ОписаниеОповещения = РГП_ГлобальныйПоискКлиентСервер.ОписаниеОповещения("Процедура1", "Модуль1");
Команда.ВыполняемоеДействие = РГП_ГлобальныйПоискКлиентСервер.ВыполняемоеДействиеОписанияОповещения(ОписаниеОповещения);
```

При этом сигнатура описания будет такой:
```
// Выполнить что-то
// 
// Параметры:
//  ВыполняемоеДействие - см. РГП_ГлобальныйПоискКлиентСервер.ВыполняемоеДействие
//  ДополнительныеПараметры - Произвольный
Процедура Процедура1(ВыполняемоеДействие, ДополнительныеПараметры) Экспорт
	//Что-то делаем
КонецПроцедуры
```

Команда при нажатии выполняет план поиска:
```
Команда = РГП_ГлобальныйПоискКлиент.НоваяКомандаРасширенногоПоиска(ПараметрыПоиска, "К4", НашеМеню);
Команда.Представление = "План поиска";
ЭлементПлана = РГП_ГлобальныйПоискКлиент.ЭлементПланаГлобальногоПоискаКоманды("Процедура2", "Модуль1", Ложь);
Команда.ПланПоиска.Добавить(ЭлементПлана);
```

При этом так может выглядеть процедура плана поиска:
```
// Заполняем РезультатыПоиска, которые увидит пользователь
// 
// Параметры:
//  СтрокаПоиска - Строка - Полная строка (включая команды меню).
//  РезультатыПоиска - РезультатГлобальногоПоиска - Выходной параметр. Содержит результаты поиска.
//  ПараметрыВыполнения - см. ПараметрыВыполненияКомандыПоиска
Процедура Процедура2(Знач СтрокаПоиска, РезультатыПоиска, ПараметрыВыполнения) Экспорт
	
	//Во входящей строке находится полная строка (включая команды меню)
	//Если же нам нужна именно строка без команд, то можем взять её в параметрах выполнения
	СтрокаПоиска = ПараметрыВыполнения.СтрокаПоиска;
	
	//Здесь у нас находится ключ команды
	КлючКоманды = ПараметрыВыполнения.Ключ;
	
	//Так мы можем добавить результат поиска. При этом применяются те же объекты выполняемых действий
	ВыполняемоеДействие = РГП_ГлобальныйПоискКлиентСервер.ВыполняемоеДействиеОткрытияЗначения(ТекущаяДата());
	РГП_ГлобальныйПоискКлиентСервер.ДобавитьЭлементРезультатаГлобальногоПоиска(
		РезультатыПоиска, ВыполняемоеДействие, "Текущая дата");

КонецПроцедуры
```

## Подробнее

Для понимания всех используемых возможностей можно посомтреть встроенные стандартные пункты меню в расширении. 

В [данном видео](https://youtu.be/8KJ0HJLL4hc) можено посмотреть сам принцип доработки поля глобального поиска, а так же примеры использования расширения

## Доработка расширения в ЕДТ

Если вы хотите как-то доработать данную "платформу" для расширения глобального поиска, то:

- Расширение разрабатывается на EDT (на данный момент версии 2022.1.5) с использованием строгой типизации
- Так как это расширение, то нужна основная конфигурация. Я веду разработку на своём форке БСП: https://github.com/SeiOkami/ssl_3_1_edt
- Когда у нас уже есть основной проект, то необходимо импортировать проект расширения. Можно сделать импорт напрямую из моего репозитория или же сделать свой при помощи форка моего репозитория.
- Когда определились с репозиторием, то в ЕДТ в навигаторе нажимаем Правой кнопкой мыши по пустому месту → выбираем Импорт →И далее указываем ссылку клонирования репозитория из гитхаб и проходим по всем пунктам импорта
- После успешного импорта необходимо обновить основное приложение (базу) из проекта с галочкой “Загрузить конфигурацию полностью”
- Зайти в конфигуратор базы и снять все флажки расширения кроме “Активно”

## Возможные проблемы
Начиная с версии 8.3.22 при добавлении расширения _в режиме предриятия_ может возникать ошибки по типу:

` Не найден метод "ПриГлобальномПоиске", указанный в аннотации метода "РГП_ПриГлобальномПоиске" `

Такое возникает, если в конфигурации нет стандартного метода в модуле приложения, но расширение пытается его переопределить.

Но расширение всё равно будет работать. Его нужно **добавлять в режиме конфигуратора**.


## Контакты и материалы

* [Страница проекта](https://github.com/SeiOkami/AdvancedGlobalSearchOneS)
* [Обзорная статья на Инфостарт](https://infostart.ru/public/1833872/?ref=1159)
* [Проект на FastCode](https://fastcode.im/Store/8222)
* [Видео с демонстрацией](https://youtu.be/8KJ0HJLL4hc)
* [Новости проекта](https://t.me/JuniorOneS)
* [По всем вопросам](https://t.me/SeiOkami)
