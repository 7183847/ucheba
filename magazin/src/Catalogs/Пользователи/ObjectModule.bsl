Процедура ЗаполнитьТаблицуРолей() Экспорт
	Пользователь = ПользователиИнформационнойБазы.НайтиПоИмени(Наименование);
	
	СписокПрав.Очистить();
	
	НаборПрав = Метаданные.Роли;
	
	Для Каждого Роль ИЗ НаборПрав Цикл
		СтрокаРоли = СписокПрав.Добавить();
		СтрокаРоли.ИмяРоли = Роль.Имя;
		СтрокаРоли.ПредставлениеРоли = Роль.Синоним;
		СтрокаРоли.Включено = Пользователь.Роли.Содержит(Роль);	
	КонецЦикла;
	
КонецПроцедуры

Процедура ПередЗаписью(Отказ)
	
	Пользователь = ПользователиИнформационнойБазы.НайтиПоИмени(Наименование);
	
	Если Пользователь = Неопределено Тогда
		Пользователь = ПользователиИнформационнойБазы.СоздатьПользователя();
		Пользователь.Имя = Наименование;
		Пользователь.ПолноеИмя = ПолноеИмя;	
	КонецЕсли;
	
	Пользователь.Роли.Очистить();
	
	СписокРолей = СписокПрав.НайтиСтроки(Новый Структура("Включено", Истина));
	
	Для Каждого Роль Из СписокРолей Цикл
		Пользователь.Роли.Добавить(Метаданные.Роли.Найти(Роль.ИмяРоли));	
	КонецЦикла;
	
	Пользователь.Записать();
КонецПроцедуры
