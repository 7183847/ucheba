// Получить пользователя.
// 
// Параметры:
//  Пользователь - ПользовательИнформационнойБазы
// 
// Возвращаемое значение:
//   - СправочникСсылка.Пользователи -
Функция ПолучитьПользователя(Пользователь) Экспорт
	ПользовательСсылка = НайтиПоНаименованию(Пользователь.Имя);
	
	Если ПользовательСсылка.Пустая() Тогда
		НовыйПользователь = СоздатьЭлемент();
		НовыйПользователь.Наименование = Пользователь.Имя;
		НовыйПользователь.ПолноеИмя = Пользователь.ПолноеИмя;
		НовыйПользователь.ЗаполнитьТаблицуРолей();
		
		НовыйПользователь.Записать();
		
		ПользовательСсылка = НовыйПользователь.Ссылка;
	КонецЕсли;
	
	Возврат ПользовательСсылка;
КонецФункции