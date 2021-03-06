
Описание публичного интерфейса библиотеки
==============================
<!-- TOC insertAnchor:true -->

- [Класс МенеджерПараметров:](#класс-менеджерпараметров)
    - [Параметр](#параметр)
    - [ЧтениеВыполнено](#чтениевыполнено)
    - [Прочитать](#прочитать)
    - [УстановитьФайлПараметров](#установитьфайлпараметров)
    - [ДобавитьПровайдерПараметров](#добавитьпровайдерпараметров)
    - [ОтключитьПровайдер](#отключитьпровайдер)
    - [НастройкаПоискаФайла](#настройкапоискафайла)
    - [ИспользоватьПровайдерJSON](#использоватьпровайдерjson)
    - [ИспользоватьПровайдерYAML](#использоватьпровайдерyaml)
    - [АвтоНастройка](#автонастройка)
    - [УстановитьКлассПараметров](#установитькласспараметров)
    - [КонструкторПараметров](#конструкторпараметров)
    - [НовыйКонструкторПараметров](#новыйконструкторпараметров)
- [Класс КонструкторПараметров](#класс-конструкторпараметров)
    - [НовыеПараметры](#новыепараметры)
    - [ПолучитьНаименованиеПараметров](#получитьнаименованиепараметров)
    - [НаименованиеУзла](#наименованиеузла)
    - [Наименование](#наименование)
    - [ИзКласса](#изкласса)
    - [Скопировать](#скопировать)
    - [Работа с полями параметров](#работа-с-полями-параметров)
        - [ПолеМассив](#полемассив)
        - [ПолеСтрока](#полестрока)
        - [ПолеЧисло](#полечисло)
        - [ПолеДата](#поледата)
        - [ПолеБулево](#полебулево)
        - [ПолеОбъект](#полеобъект)
        - [Поле](#поле)
    - [ВСтруктуру](#вструктуру)
    - [ВСоответствие](#всоответствие)
    - [ИзСтруктуры](#изструктуры)
    - [ИзСоответствия](#изсоответствия)
    - [ДобавитьСинонимыПоляВИндекс](#добавитьсинонимыполявиндекс)
    - [Использован](#использован)
- [Класс Настройка файлового провайдера:](#класс-настройка-файлового-провайдера)
    - [УстановитьФайлПараметров](#установитьфайлпараметров-1)
    - [УстановитьВложенныйКаталогПоиска](#установитьвложенныйкаталогпоиска)
    - [ПолучитьНастройки](#получитьнастройки)
    - [ДобавитьКаталогПоиска](#добавитькаталогпоиска)
    - [ОчиститьПутиПоиска](#очиститьпутипоиска)
    - [УстановитьИмяФайла](#установитьимяфайла)
    - [УстановитьРасширениеФайла](#установитьрасширениефайла)
    - [УстановитьСтандартныеКаталогиПоиска](#установитьстандартныекаталогипоиска)

<!-- /TOC -->

<a id="markdown-класс-менеджерпараметров" name="класс-менеджерпараметров"></a>
### Класс МенеджерПараметров:
> Класс обеспечивающий чтение и запись (в разработке) параметров из провайдеров параметров

<a id="markdown-параметр" name="параметр"></a>
#### Параметр
```bsl
// Получает и возвращает значение из индекса параметров
//
// Параметры:
//   ИмяПараметра        - Строка - имя параметра
//                                  допустимо указание пути к параметру через точку (например, "config.server.protocol")
//   ЗначениеПоУмолчанию - Произвольный - возвращаемое значение в случае отсутствия параметра после чтения
//
// Возвращаемое значение:
//   Строка, Число, Булево, Массив, Соответствие, Неопределено - значение параметра
//
```

<a id="markdown-чтениевыполнено" name="чтениевыполнено"></a>
#### ЧтениеВыполнено
```bsl
// Возвращает признак выполнения чтения параметров
//
// Возвращаемое значение:
//   Булево - признак выполнения чтения параметров
//
```

<a id="markdown-прочитать" name="прочитать"></a>
#### Прочитать
```bsl
// Выполняет чтения параметров из доступных провайдеров
//
```

<a id="markdown-установитьфайлпараметров" name="установитьфайлпараметров"></a>
#### УстановитьФайлПараметров
```bsl
// Устанавливает путь к файлу параметров
//
// Параметры:
//   ПутьКФайлу - Строка - полный путь к файлу параметров
//
```

<a id="markdown-добавитьпровайдерпараметров" name="добавитьпровайдерпараметров"></a>
#### ДобавитьПровайдерПараметров
```bsl
// Добавляет в таблицу провайдеров произвольный класс-провайдер
//
// Параметры:
//   КлассОбъект             - Объект - класс провайдера или имя класса
//   Приоритет               - Число        - Числовой приоритет выполнения провайдеры (по умолчанию 99)
//
```

<a id="markdown-отключитьпровайдер" name="отключитьпровайдер"></a>
#### ОтключитьПровайдер
```bsl
// Отключает провайдера из таблицы провайдеров
//
// Параметры:
//   ИдентификаторПровайдера - Строка - короткий идентификатор провайдера (например, json)
//
```

<a id="markdown-настройкапоискафайла" name="настройкапоискафайла"></a>
#### НастройкаПоискаФайла
```bsl
// Возвращает объект настройки поиска файлов
//
//  Возвращаемое значение:
//   Объект.НастройкаФайловогоПровайдера - внутренний класс по настройке файловых провайдеров
//
```
см. описание класса `НастройкаФайловогоПровайдера`

<a id="markdown-использоватьпровайдерjson" name="использоватьпровайдерjson"></a>
#### ИспользоватьПровайдерJSON
```bsl
// Добавляет и включает встроенный провайдер JSON
//
// Параметры:
//   Приоритет - Число - Числовой приоритет выполнения провайдеры (по умолчанию 0)
//
```

<a id="markdown-использоватьпровайдерyaml" name="использоватьпровайдерyaml"></a>
#### ИспользоватьПровайдерYAML
```bsl
// Добавляет и включает встроенный провайдер YAML
//
// Параметры:
//   Приоритет - Число - Числовой приоритет выполнения провайдеры (по умолчанию 0)
//
```

<a id="markdown-автонастройка" name="автонастройка"></a>
#### АвтоНастройка
```bsl
// Производит автоматическую настройку провайдеров
//
// Параметры:
//   НаименованиеФайла - Строка - Наименование файла параметров
//   ВложенныйПодкаталог - Строка - Дополнительный каталог, для стандартных путей
//   ИдентификаторыПровайдеров - Строка - Идентификаторы встроенных параметров, по умолчанию <yaml json>
//
```

<a id="markdown-установитькласспараметров" name="установитькласспараметров"></a>
#### УстановитьКлассПараметров
```bsl
// Устанавливает класс параметров для описания конструктора параметров и установки результатов чтения
//
// Параметры:
//   КлассОбъект - Объект - произвольный класс, реализующий ряд экспортных процедур
//
```

<a id="markdown-конструкторпараметров" name="конструкторпараметров"></a>
#### КонструкторПараметров
```bsl
// Создает, определяет и возвращает новый внутренний конструктор параметров
//
// Параметры:
//   КлассОбъект - Объект - Класс объект реализующий интерфейс конструктора параметров
//
// Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на новый элемент класса <КонструкторПараметров>
//
```

<a id="markdown-новыйконструкторпараметров" name="новыйконструкторпараметров"></a>
#### НовыйКонструкторПараметров
```bsl
// Создает и возвращает новый конструктор параметров
//
// Параметры:
//   ИмяКонструктора - Строка - наименование конструктора параметров
//   КлассОбъект - Объект - Класс объект реализующий интерфейс конструктора параметров
//
// Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на новый элемент класса <КонструкторПараметров>
//
```

<a id="markdown-класс-конструкторпараметров" name="класс-конструкторпараметров"></a>
### Класс КонструкторПараметров

<a id="markdown-новыепараметры" name="новыепараметры"></a>
#### НовыеПараметры
```bsl
// Создает и возвращает новый экземпляр конструктора параметров
//
// Параметры:
//   НовоеНаименованиеПараметров - Строка - наименование конструктора параметров
//
//  Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на новый элемент класса <КонструкторПараметров>
//
```

<a id="markdown-получитьнаименованиепараметров" name="получитьнаименованиепараметров"></a>
#### ПолучитьНаименованиеПараметров
```bsl
// Возвращает текущее наименование параметров
//
//  Возвращаемое значение:
//   Строка - текущее наименование параметров
//
```

<a id="markdown-наименованиеузла" name="наименованиеузла"></a>
#### НаименованиеУзла
```bsl
// (Заготовка) Устанавливает дополнительное наименование узла параметров 
//
// Параметры:
//   НовоеСинонимыПараметров - Строка - дополнительное наименование параметров в файле
//
//  Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на текущий элемент класса <КонструкторПараметров>
//
```

<a id="markdown-наименование" name="наименование"></a>
#### Наименование
```bsl
// Устанавливает новое наименование параметров
//
// Параметры:
//   НовоеНаименованиеПараметров - Строка - новое наименование текущего класса параметров
//
//  Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на текущий элемент класса <КонструкторПараметров>
//
```

<a id="markdown-изкласса" name="изкласса"></a>
#### ИзКласса
```bsl
// Выполняет заполнение описания параметров из произвольного объекта
//
// Параметры:
//   КлассОбъект - Объект - произвольный класс, реализуемый интерфейс Конструктора
//
//  Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на текущий элемент класса <КонструкторПараметров>
//
```

<a id="markdown-скопировать" name="скопировать"></a>
#### Скопировать
```bsl
// Копирует текущий конструктор параметров
//
// Параметры:
//   НовоеНаименованиеПараметров - Строка - наименование конструктора в индексе параметров
//
//  Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на текущий элемент класса <КонструкторПараметров>
//
```

<a id="markdown-работа-с-полями-параметров" name="работа-с-полями-параметров"></a>
#### Работа с полями параметров
> Поддерживает `текучий` режим
<a id="markdown-полемассив" name="полемассив"></a>
##### ПолеМассив
```bsl
// Создает и возвращает новое поле-строка конструктора параметров
//
// Параметры:
//   ИмяПоля     - Строка - имя поля, возможно передача нескольких через пробел.
//   ТипЭлемента - строка - значение поля по умолчанию
//
//  Возвращаемое значение:
//   Объект.ПолеКонструктораПараметров - ссылка на текущий элемент класса <ПолеКонструктораПараметров>
//
```

<a id="markdown-полестрока" name="полестрока"></a>
##### ПолеСтрока
```bsl
// Создает и возвращает новое поле-строка конструктора параметров
//
// Параметры:
//   ИмяПоля             - Строка - имя поля, возможно передача нескольких через пробел.
//   ЗначениеПоУмолчанию - строка - значение поля по умолчанию
//
//  Возвращаемое значение:
//   Объект.ПолеКонструктораПараметров - ссылка на текущий элемент класса <ПолеКонструктораПараметров>
//
```

<a id="markdown-полечисло" name="полечисло"></a>
##### ПолеЧисло

```bsl
// Создает и возвращает новое поле-число конструктора параметров
//
// Параметры:
//   ИмяПоля             - Строка - имя поля, возможно передача нескольких через пробел.
//   ЗначениеПоУмолчанию - Число - значение поля по умолчанию
//
//  Возвращаемое значение:
//   Объект.ПолеКонструктораПараметров - ссылка на текущий элемент класса <ПолеКонструктораПараметров>
//
```

<a id="markdown-поледата" name="поледата"></a>
##### ПолеДата

```bsl
// Создает и возвращает новое поле-дата конструктора параметров
//
// Параметры:
//   ИмяПоля             - Строка - имя поля, возможно передача нескольких через пробел.
//   ЗначениеПоУмолчанию - Дата - значение поля по умолчанию
//
//  Возвращаемое значение:
//   Объект.ПолеКонструктораПараметров - ссылка на текущий элемент класса <ПолеКонструктораПараметров>
//
```

<a id="markdown-полебулево" name="полебулево"></a>
##### ПолеБулево

```bsl
// Создает и возвращает новое поле-булево конструктора параметров
//
// Параметры:
//   ИмяПоля             - Строка - имя поля, возможно передача нескольких через пробел.
//   ЗначениеПоУмолчанию - Булево - значение поля по умолчанию
//
//  Возвращаемое значение:
//   Объект.ПолеКонструктораПараметров - ссылка на текущий элемент класса <ПолеКонструктораПараметров>
//
```

<a id="markdown-полеобъект" name="полеобъект"></a>
##### ПолеОбъект

```bsl
// Создает и возвращает новое поле-объект конструктора параметров
//
// Параметры:
//   ИмяПоля             - Строка - имя поля, возможно передача нескольких через пробел.
//   ОбъектПоля          - Объект.КонструкторПараметров - ссылка на объект поле
//
//  Возвращаемое значение:
//   Объект.ПолеКонструктораПараметров - ссылка на текущий элемент класса <ПолеКонструктораПараметров>
//
```

<a id="markdown-поле" name="поле"></a>
##### Поле

```bsl
// Создает и возвращает новое поле конструктора параметров
//
// Параметры:
//   ИмяПоля             - Строка - имя поля, возможно передача нескольких через пробел.
//   ТипПоля             - ОписаниеТипов - тип создаваемого поля
//   ЗначениеПоУмолчанию - Строка, Число, Дата, Неопределено - значение по умолчанию для поля
//   ТипЭлемента         - ОписаниеТипов - тип для элементов поля массив
//   ОбъектПоля          - Объект.КонструкторПараметров - ссылка на объект поле
//
//  Возвращаемое значение:
//   Объект.ПолеКонструктораПараметров - ссылка на текущий элемент класса <ПолеКонструктораПараметров>
//
```

<a id="markdown-вструктуру" name="вструктуру"></a>
#### ВСтруктуру
```bsl
// Преобразовывает структуру параметров в структуру
//
//  Возвращаемое значение:
//   Структура - значение параметров в структуре
//
```

<a id="markdown-всоответствие" name="всоответствие"></a>
#### ВСоответствие
```bsl
// Преобразовывает структуру параметров в соответствие
//
//  Возвращаемое значение:
//   Соответствие - значение параметров в соответствии
//
```

<a id="markdown-изструктуры" name="изструктуры"></a>
#### ИзСтруктуры
```bsl
// (Заготовка) Выполняет чтение значений параметров из структуры
//
// Параметры:
//   ВходящаяСтруктура - Структура - структура со значениями параметров
//
//  Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на текущий объект <КонструкторПараметров>
//
```

<a id="markdown-изсоответствия" name="изсоответствия"></a>
#### ИзСоответствия
```bsl
// Выполняет чтение значений параметров из соответствия
//
// Параметры:
//   ВходящиеСоответствие - Соответствия - соответствие со значениями параметров
//
//  Возвращаемое значение:
//   Объект.КонструкторПараметров - ссылка на текущий объект <КонструкторПараметров>
//
```

<a id="markdown-добавитьсинонимыполявиндекс" name="добавитьсинонимыполявиндекс"></a>
#### ДобавитьСинонимыПоляВИндекс
```bsl
// Добавляет синонимы поля в индекс полей
//
// Параметры:
//   ПолеПараметров - Объект.ПолеКонструктораПараметров - класс <ПолеКонструктораПараметров> для чтения синонимов
//
```

<a id="markdown-использован" name="использован"></a>
#### Использован
```bsl
// Возвращает признак использования объекта при конвертации из соответствия
//
// Возвращаемое значение:
//   Булево - признак использования объекта при конвертации из соответствия
//
```

<a id="markdown-класс-настройка-файлового-провайдера" name="класс-настройка-файлового-провайдера"></a>
### Класс Настройка файлового провайдера:
> Класс обеспечивающий настройку для провайдеров с типом `file`


<a id="markdown-установитьфайлпараметров-1" name="установитьфайлпараметров-1"></a>
#### УстановитьФайлПараметров
```bsl
// Устанавливает путь к файлу параметров
//
// Параметры:
//   ПутьКФайлу - Строка - полный путь к файлу параметров
//
//  Возвращаемое значение:
//   Объект.НастройкиФайловогоПровайдера - ссылка на текущий элемент класса <НастройкиФайловогоПровайдера>
//
```

<a id="markdown-установитьвложенныйкаталогпоиска" name="установитьвложенныйкаталогпоиска"></a>
#### УстановитьВложенныйКаталогПоиска
```bsl
// Устанавливает дополнительную строку добавляемую к каталогам поиска
//
// Параметры:
//   ИмяВложенногоКаталогаПоиска - Строка - дополнительная строка, добавляемая к каталогам поиска
//
//  Возвращаемое значение:
//   Объект.НастройкиФайловогоПровайдера - ссылка на текущий элемент класса <НастройкиФайловогоПровайдера>
//
```

<a id="markdown-получитьнастройки" name="получитьнастройки"></a>
#### ПолучитьНастройки
```bsl
// Возвращает структуру настроек провайдера
//
//  Возвращаемое значение:
//   Структура - подготовленная структура настроек для файловых провайдеров
//    * ПутьКФайлуПараметров - Строка - путь к установленному файлу параметров
//    * КаталогиПоиска - Массив - массив строк, путей для поиска файла
//    * ВложенныйКаталог - Строка - дополнительный каталог в каталогах поиска
//    * НаименованияФайлаПараметров - Массив - массив строк, массив имен файлов параметров
//    * РасширенияФайлаПараметров - Массив - массив строк, массив расширений файлов параметров
//    * НаправлениеСортировки - Строка - направления обхода каталогов поиска (ВОЗР или УБЫВ)
//    * ЧитатьТолькоОдинФайл - Булево - признак чтения до первого найденного файла
//
```

<a id="markdown-добавитькаталогпоиска" name="добавитькаталогпоиска"></a>
#### ДобавитьКаталогПоиска
```bsl
// Добавляет дополнительный путь к каталогу поиска файла параметров
//
// Параметры:
//   ПутьПоискаФайлов - Строка - полный путь к дополнительному каталогу для поиска файла параметров
//
//  Возвращаемое значение:
//   Объект.НастройкиФайловогоПровайдера - ссылка на текущий элемент класса <НастройкиФайловогоПровайдера>
//
```

<a id="markdown-очиститьпутипоиска" name="очиститьпутипоиска"></a>
#### ОчиститьПутиПоиска
```bsl
// Выполняет очистку путей поиска
//
//  Возвращаемое значение:
//   Объект.НастройкиФайловогоПровайдера - ссылка на текущий элемент класса <НастройкиФайловогоПровайдера>
//
```

<a id="markdown-установитьимяфайла" name="установитьимяфайла"></a>
#### УстановитьИмяФайла
```bsl
// Устанавливает имя файла параметров
//
// Параметры:
//   ИмяФайла - Строка - имя файла параметров
//
//  Возвращаемое значение:
//   Объект.НастройкиФайловогоПровайдера - ссылка на текущий элемент класса <НастройкиФайловогоПровайдера>
//
```

<a id="markdown-установитьрасширениефайла" name="установитьрасширениефайла"></a>
#### УстановитьРасширениеФайла
```bsl
// Устанавливает расширение файла параметров
//
// Параметры:
//   РасширениеФайла - Строка - расширение файла параметров (например, .json или json)
//
//  Возвращаемое значение:
//   Объект.НастройкиФайловогоПровайдера - ссылка на текущий элемент класса <НастройкиФайловогоПровайдера>
//
```

<a id="markdown-установитьстандартныекаталогипоиска" name="установитьстандартныекаталогипоиска"></a>
#### УстановитьСтандартныеКаталогиПоиска
```bsl
// Устанавливает стандартные каталоги поиска
//
// Параметры:
//   ВложенныйПодкаталог - Строка - дополнительная строка, добавляемая к каталогам поиска
//
//  Возвращаемое значение:
//   Объект.НастройкиФайловогоПровайдера - ссылка на текущий элемент класса <НастройкиФайловогоПровайдера>
//
```
