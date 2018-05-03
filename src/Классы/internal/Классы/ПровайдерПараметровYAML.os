#Использовать logos
#Использовать yaml

Перем Лог;

#Область ПрограммныйИнтерфейс

// Возвращает приоритет провайдера
//
//  Возвращаемое значение:
//   Число - текущий приоритет провайдера
//
Функция Приоритет() Экспорт
	Возврат 1;
КонецФункции

// Возвращает идентификатор провайдера
//
//  Возвращаемое значение:
//   Строка - текущий идентификатор провайдера
//
Функция Идентификатор() Экспорт
	Возврат "yaml";
КонецФункции

// Возвращает тип провайдера
//
//  Возвращаемое значение:
//   Строка - текущий тип провайдера
//
Функция ТипПровайдера() Экспорт
	Возврат "file";
КонецФункции

// Возвращает расширения файлов по умолчанию
//
//  Возвращаемое значение:
//   Строка - расширения файлов по умолчанию (yaml yml)
//
Функция РасширенияФайлов() Экспорт
	Возврат "yaml yml";
КонецФункции

// Выполняет чтение параметров для провайдера
//
// Параметры:
//   НастройкиПровайдера - Структура - структура настроек провайдера
//
//  Возвращаемое значение:
//   Соответствие - результат чтения провайдера
//
Функция ПрочитатьПараметры(Знач НастройкиПровайдера) Экспорт

	ПрочитанныеПараметры = Новый Соответствие;

	ФайлПараметров = Новый Файл(НастройкиПровайдера.ФайлПараметров);

	ПутьКФайлуПараметров = ФайлПараметров.ПолноеИмя;

	Если Не ФайлПараметров.Существует() Тогда
		Лог.Отладка("Не найден файл параметров <%1>", ПутьКФайлуПараметров);
		Возврат ПрочитанныеПараметры;
	КонецЕсли;
	
	Лог.Отладка("Чтение параметров из файлов <yaml> не реализовано");

	Попытка

		Лог.Отладка("ПутьКФайлуПараметров <%1>", ПутьКФайлуПараметров);

		ПрочитанныеПараметры = ПрочитатьНастройкиИзПараметраФайл(ПутьКФайлуПараметров);
		
		Лог.Отладка("Итоговые параметры:");
		ПоказатьПараметрыВРежимеОтладки(ПрочитанныеПараметры);

	Исключение
	
		Лог.Ошибка("Ошибка чтения настроек
		|%1", ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
	
		ВызватьИсключение;
	
	КонецПопытки;

	Возврат ПрочитанныеПараметры;

КонецФункции

#КонецОбласти

#Область Вспомогательные_процедуры_и_функции

Функция ПрочитатьНастройкиИзПараметраФайл(ПутьКФайлуНастройки)

	ФайлНастроек = Новый Файл(ПутьКФайлуНастройки);

	НастройкиИзФайла = ПрочитатьФайлYAML(ФайлНастроек.ПолноеИмя);

	Возврат НастройкиИзФайла;

КонецФункции // ПрочитатьНастройкиИзПараметраФайл()

Функция ПрочитатьФайлYAML(Знач ИмяФайла)
	Перем Параметры;

	Лог.Отладка("Путь файла настроек <%1>", ИмяФайла);

	СообщениеОшибки = СтрШаблон("Файл настроек не существует. Путь <%1>", ИмяФайла);
	YamlСтрока  = ПрочитатьФайл(ИмяФайла, СообщениеОшибки);

	Лог.Отладка("Текст файла настроек:
	|%1", YamlСтрока);
	
	ПроцессорЧтения = Новый ПарсерYaml;
	Параметры = ПроцессорЧтения.ПрочитатьYaml(YamlСтрока);
	
	Возврат Параметры;
КонецФункции

Функция ПрочитатьФайл(Знач ИмяФайла, Знач СообщениеОшибки)
	ФайлСуществующий = Новый Файл(ИмяФайла);
	Если Не ФайлСуществующий.Существует() Тогда
		ВызватьИсключение СообщениеОшибки;
	КонецЕсли;

	Чтение = Новый ЧтениеТекста(ИмяФайла, КодировкаТекста.UTF8);
	Рез  = Чтение.Прочитать();
	Чтение.Закрыть();
	Возврат Рез;
КонецФункции // ПрочитатьФайл()

Процедура ПоказатьПараметрыВРежимеОтладки(ЗначенияПараметров, Знач Родитель = "")
	
	Если Родитель = "" Тогда
		Лог.Отладка("	Тип параметров %1", ТипЗнч(ЗначенияПараметров));
	КонецЕсли;
	
	Если ЗначенияПараметров.Количество() = 0 Тогда
		Лог.Отладка("	Коллекция параметров пуста!");
	КонецЕсли;

	Для каждого Элемент Из ЗначенияПараметров Цикл
		
		ПредставлениеКлюча = Элемент.Ключ;
		
		Если Не ПустаяСтрока(Родитель) Тогда
			ПредставлениеКлюча  = СтрШаблон("%1.%2", Родитель, ПредставлениеКлюча);
		КонецЕсли;
		
		Лог.Отладка("	Получен параметр <%1> = <%2>", ПредставлениеКлюча, Элемент.Значение);
		
		Если ТипЗнч(Элемент.Значение) = Тип("Соответствие") Тогда
			ПоказатьПараметрыВРежимеОтладки(Элемент.Значение, ПредставлениеКлюча);
		КонецЕсли;
		
	КонецЦикла;

КонецПроцедуры

#КонецОбласти

Лог = Логирование.ПолучитьЛог("oscript.lib.configor.yaml");