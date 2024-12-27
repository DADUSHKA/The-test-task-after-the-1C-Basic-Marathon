
Процедура ОбработкаПроведения(Отказ, Режим)
	
	// регистр Остатки Расход
	Движения.Остатки.Записывать = Истина;
	Для Каждого ТекСтрокаСостав Из Состав Цикл
		Движение = Движения.Остатки.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаСостав.Номенклатура;
		Движение.Количество = ТекСтрокаСостав.Количество;
	КонецЦикла;
	
	Движения.Записать();
	
	Если Режим = РежимПроведенияДокумента.Оперативный Тогда 
		
		Отказ = РегистрыНакопления.Остатки.ЕстьОтрицательныеОстатки(ЭтотОбъект.Ссылка, ЭтотОбъект.Дата);
		
	КонецЕсли;
	
КонецПроцедуры
