
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	
	Владелец = ДанныеЗаполнения.Контрагент;
	Наименование = ДанныеЗаполнения.Ссылка;
	ДатаПоставки = ДанныеЗаполнения.Дата;
	Для Каждого ТекСтрокаСостав Из ДанныеЗаполнения.Состав Цикл
		НоваяСтрока = Состав.Добавить();
		НоваяСтрока.Количество = ТекСтрокаСостав.Количество;
		НоваяСтрока.Номенклатура = ТекСтрокаСостав.Номенклатура;
	КонецЦикла;

КонецПроцедуры 
