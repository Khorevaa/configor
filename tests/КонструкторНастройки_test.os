#использовать "../"
#Использовать asserts
#Использовать logos
#Использовать tempfiles
#Использовать json

Перем юТест;
Перем Лог;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;

	ИменаТестов = Новый Массив;

	ИменаТестов.Добавить("ТестДолжен_ПроверитьЧтениеПараметровИзКонструктора");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьУдалениеПоляИзКонструктора");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПоискИЧтениеФайлаПараметров");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПарсингОпций");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПарсингМассивовОпций");

	Возврат ИменаТестов;

КонецФункции

Процедура ТестДолжен_ПроверитьЧтениеПараметровИзКонструктора() Экспорт
	
	МенеджерПараметров = Новый МенеджерПараметров();
	Конструктор = МенеджерПараметров.КонструкторПараметров();

	ПараметрОбъект = Конструктор.НовыеПараметры("ПростойОбъект")
				.ПолеСтрока("Поле1")
				.ПолеСтрока("Поле2")
				;

	ДатаПроверки = ТекущаяДата();
	ПараметрСтруктура = Конструктор.НовыеПараметры("ВложеннаяСтруктура")
				.ПолеСтрока("СтрокаСтруктуры")
				.ПолеДата("ДатаСтруктуры", ТекущаяДата())
				.ПолеДата("ТекущаяДата")
				.ПолеЧисло("ЧислоСтруктуры")
				.ПолеОбъект("Объект object", ПараметрОбъект)
				.ПолеМассив("МассивСтрок", Тип("Строка"))
				.ПолеМассив("МассивЧисел", Тип("Число"))
				.ПолеМассив("МассивДат", Тип("Дата"))
				.ПолеМассив("МассивОбъектов", ПараметрОбъект)
				;

	Конструктор.ПолеСтрока("Версия version")
				.ПолеСтрока("СтрокаНастройки")
				.ПолеДата("ДатаНастройки")
				.ПолеДата("ТекущаяДата", ДатаПроверки)
				.ПолеЧисло("ЧислоНастройки")
				.ПолеОбъект("ПараметрСтруктура struct", ПараметрСтруктура)
				.ПолеМассив("МассивОбъектов array-struct", ПараметрОбъект)
				.ПолеМассив("МассивСтрок", Тип("Строка"))
				.ПолеМассив("МассивЧисел", Тип("Число"))
				.ПолеМассив("МассивДат", Тип("Дата"))
				;
	
	СтруктураПараметров = Новый Структура("version, СтрокаНастройки, ДатаНастройки,
										 | ЧислоНастройки, МассивСтрок, МассивЧисел, ПараметрСтруктура, ПараметрСоответствие", 
		"1.0",
		"ПростоСтрока", 
		Дата(2017, 1, 1),
		10, 
		ПолучитьНовыйМассив("Элемент1, Элемент2, Элемент3"),
		ПолучитьНовыйМассив("1, 2, 3"),
		Новый Структура("СтрокаСтруктуры, ЧислоСтруктуры, МассивСтрок, Объект, Соответствие", 
			"ПростоСтрока", 
			10, 
			ПолучитьНовыйМассив("Элемент1, Элемент2, Элемент3"),
			Новый Структура("Поле1, Поле2", "ЗначениеСтруктуры", "ЗначениеСтруктуры2"),
			ПолучитьСоответствие("КлючВнутри1, КлючВнутри2", "Значение1, Значение2")
			), 
		ПолучитьСоответствие("Ключ1, Ключ2", "Значение1, Значение2")
	);

	ПарсерJSON = Новый ПарсерJSON;
	ТекстФайлаПроверки = ПарсерJSON.ЗаписатьJSON(СтруктураПараметров);

	ТестовыйФайл = ПодготовитьТестовыйФайл(ТекстФайлаПроверки);

	ТестовоеИмя = "config";
	ТестовоеРасширение = ".json";

	ВременныйКаталог = ВременныеФайлы.СоздатьКаталог();
	КопироватьФайл(ТестовыйФайл, ОбъединитьПути(ВременныйКаталог, ТестовоеИмя + ТестовоеРасширение));

	МенеджерПараметров.АвтоНастройка(ТестовоеИмя);
	НастройкаПоискаФайла = МенеджерПараметров.НастройкаПоискаФайла();
	НастройкаПоискаФайла.ДобавитьКаталогПоиска(ВременныйКаталог);
	МенеджерПараметров.Прочитать();

	ПроверитьРезультат(СтруктураПараметров.version, МенеджерПараметров.Параметр("Версия"));
	ПроверитьРезультат(СтруктураПараметров.СтрокаНастройки, МенеджерПараметров.Параметр("СтрокаНастройки"));
	ПроверитьРезультат(СтруктураПараметров.ДатаНастройки, МенеджерПараметров.Параметр("ДатаНастройки"));
	ПроверитьРезультат(ДатаПроверки, МенеджерПараметров.Параметр("ТекущаяДата"));
	ПроверитьРезультат(СтруктураПараметров.ЧислоНастройки, МенеджерПараметров.Параметр("ЧислоНастройки"));
	ПроверитьРезультат(СтруктураПараметров.ПараметрСтруктура.СтрокаСтруктуры, МенеджерПараметров.Параметр("ПараметрСтруктура.СтрокаСтруктуры"));
	ПроверитьРезультат(СтруктураПараметров.ПараметрСтруктура.ЧислоСтруктуры, МенеджерПараметров.Параметр("ПараметрСтруктура.ЧислоСтруктуры"));
	ПроверитьРезультат(СтруктураПараметров.ДатаНастройки, МенеджерПараметров.Параметр("ДатаНастройки"));
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьУдалениеПоляИзКонструктора() Экспорт

	КонструкторПараметров = Новый КонструкторПараметров();
	КонструкторПараметров.ПолеСтрока("Поле1 fiels-1")
				.ПолеСтрока("Поле2 fiels-2")
				;
	КонструкторПараметров.УдалитьПоле("Поле1")
				.УдалитьПоле("fiels-2")
				;

	ИндексПолей = КонструкторПараметров.ПолучитьИндексПолей();

	Ожидаем.Что(ИндексПолей.Количество(), "Индекс полей должен быть пустым").Равно(0);
	
КонецПроцедуры

Процедура ПроверитьРезультат(Значение1, Значение2)
	Утверждения.ПроверитьРавенство(Значение1, Значение2, "Результат должен совпадать с ожиданиями.");
КонецПроцедуры

Функция ПодготовитьТестовыйФайл(Знач ТестФайла)

	ТестовыйФайл = ВременныеФайлы.НовоеИмяФайла("json");
	
	ЗаписьТекста = Новый ЗаписьТекста;
	ЗаписьТекста.Открыть(ТестовыйФайл);
	ЗаписьТекста.ЗаписатьСтроку(ТестФайла);
	ЗаписьТекста.Закрыть();

	Возврат ТестовыйФайл;

КонецФункции

Функция ПолучитьНовыйМассив(ЗначенияМассив)

	Массив = Новый Массив();

	МассивЗначений = СтрРазделить(ЗначенияМассив, ", ");

	Для ИндексКлюча = 0 По МассивЗначений.ВГраница() Цикл
		
		Массив.Добавить(МассивЗначений[ИндексКлюча]);

	КонецЦикла;

	Возврат Массив;

КонецФункции

Функция ПолучитьСоответствие(Ключи, Значения)

	Соответствие = Новый Соответствие();

	МассивКлючей = СтрРазделить(Ключи, ", ");
	МассивЗначений = СтрРазделить(Значения, ", ");

	Для ИндексКлюча = 0 По МассивКлючей.ВГраница() Цикл
		
		Соответствие.Вставить(МассивКлючей[ИндексКлюча], МассивЗначений[ИндексКлюча]);

	КонецЦикла;

	Возврат Соответствие;

КонецФункции

Лог = Логирование.ПолучитьЛог("oscript.lib.configor.constructor");
// Лог.УстановитьУровень(УровниЛога.Отладка);

ЛогПровайдера = Логирование.ПолучитьЛог("oscript.lib.configor.provider-json");
// ЛогПровайдера.УстановитьУровень(УровниЛога.Отладка);