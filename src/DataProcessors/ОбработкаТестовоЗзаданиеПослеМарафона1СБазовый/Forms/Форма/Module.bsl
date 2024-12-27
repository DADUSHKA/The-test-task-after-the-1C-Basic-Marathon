&НаКлиенте 
Перем Счетчик;
//Счетчик = 0;

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
		
#Область ДобавлениеРеквизитовФормы

		ДобавляемыеРеквизиты = Новый Массив;
		
		#Область ДобавлениеРеквизитовСтраницыКонтрагенты
		
			ДобавляемыеРеквизиты.Добавить(
				Новый РеквизитФормы("Договор",
				Новый ОписаниеТипов("СправочникСсылка.Договоры"),
				"Контрагенты", "Договор")
			);
			ДобавляемыеРеквизиты.Добавить(
				Новый РеквизитФормы("ОрганизацияКонтрагент", 
				Новый ОписаниеТипов("СправочникСсылка.Организации, СправочникСсылка.Контрагенты"))
			);
			ДобавляемыеРеквизиты.Добавить(
				Новый РеквизитФормы("ПометкаУдаления", 
				Новый ОписаниеТипов("Булево"))
			);
			
		#КонецОбласти
		
		#Область ДобавлениеРеквизитовСтраницыНоменклатура
		
		ДобавляемыеРеквизиты.Добавить(
			Новый РеквизитФормы("Число1",
			Новый ОписаниеТипов("Число",Новый КвалификаторыЧисла(10,0)))
		);
		ДобавляемыеРеквизиты.Добавить(
			Новый РеквизитФормы("Число2",
			Новый ОписаниеТипов("Число", Новый КвалификаторыЧисла(10,0)))
		);
		ДобавляемыеРеквизиты.Добавить(
			Новый РеквизитФормы("Итог",
			Новый ОписаниеТипов("Число", Новый КвалификаторыЧисла(10,0)))
		);  
		ДобавляемыеРеквизиты.Добавить( 
			Новый РеквизитФормы("Дата",
			Новый ОписаниеТипов("Дата",,, Новый КвалификаторыДаты(ЧастиДаты.Дата)))
		);	
		ДобавляемыеРеквизиты.Добавить(
			Новый РеквизитФормы("Товар",
			Новый ОписаниеТипов("ТаблицаЗначений"))
		);
		ДобавляемыеРеквизиты.Добавить(
			Новый РеквизитФормы("Номенклатура",
			Новый ОписаниеТипов("СправочникСсылка.Номенклатура"), "Товар", "Номенклатура")
		);
		ДобавляемыеРеквизиты.Добавить(
			Новый РеквизитФормы("Код", 
			Новый ОписаниеТипов("Строка", , Новый КвалификаторыСтроки(40)), "Товар", "Код")
		);
		ДобавляемыеРеквизиты.Добавить(
			Новый РеквизитФормы("Остаток", 
			Новый ОписаниеТипов("Число", Новый КвалификаторыЧисла(10,0)), "Товар", "Остаток")
		);

		#КонецОбласти
		
		#Область ДобавлениеРеквизитовСтраницыПрочее
		
			ДобавляемыеРеквизиты.Добавить(
				Новый РеквизитФормы("СписокКартинок", 
				Новый ОписаниеТипов("СписокЗначений"))
			);
			ДобавляемыеРеквизиты.Добавить(
				Новый РеквизитФормы("НастройкаКартинки", 
				Новый ОписаниеТипов("Строка"))
			); 
			ДобавляемыеРеквизиты.Добавить(
				Новый РеквизитФормы("Картинка", 
				Новый ОписаниеТипов("Строка"))
		  );		
			
		#КонецОбласти
		
		ЭтотОбъект.ИзменитьРеквизиты(ДобавляемыеРеквизиты);
		
#КонецОбласти 
	
#Область ДобавлениеКоманд 
	
	НоваяКоманда1             = Команды.Добавить("Заполнить");
	НоваяКоманда1.Действие    = "Заполнить"; 
	НоваяКоманда1.Отображение = ОтображениеКнопки.КартинкаИТекст;
	НоваяКоманда1.Заголовок   = "Заполнить"; 
	
	НоваяКоманда2           = Команды.Добавить("ВыполнитьСложение");
	НоваяКоманда2.Действие  = "ВыполнитьСложение"; 
	НоваяКоманда2.Заголовок = "+";
	
	НоваяКоманда3           = Команды.Добавить("ВыполнитьВычитание");
	НоваяКоманда3.Действие  = "ВыполнитьВычитание"; 
	НоваяКоманда3.Заголовок = "-";
	
	НоваяКоманда4           = Команды.Добавить("ВыполнитьУмножение");
	НоваяКоманда4.Действие  = "ВыполнитьУмножение"; 
	НоваяКоманда4.Заголовок = "*";

	НоваяКоманда5           = Команды.Добавить("ВыполнитьДеление");
	НоваяКоманда5.Действие  = "ВыполнитьДеление"; 
	НоваяКоманда5.Заголовок = "/"; 
	
	НоваяКоманда6             = Команды.Добавить("ФизЛицо");
	НоваяКоманда6.Действие    = "ФизЛицо";
	НоваяКоманда6.Заголовок   = "ФизЛицо";
	НоваяКоманда6.Отображение = ОтображениеКнопки.КартинкаИТекст;
	
	НоваяКоманда7             = Команды.Добавить("БизнесПроцесс");
	НоваяКоманда7.Действие    = "БизнесПроцесс";
	НоваяКоманда7.Заголовок   = "БизнесПроцесс";
	НоваяКоманда7.Отображение = ОтображениеКнопки.КартинкаИТекст;
	
	НоваяКоманда8             = Команды.Добавить("ДебитКредит");
	НоваяКоманда8.Действие    = "ДебитКредит";
	НоваяКоманда8.Заголовок   = "ДебитКредит";
	НоваяКоманда8.Отображение = ОтображениеКнопки.КартинкаИТекст;
	
	НоваяКоманда9             = Команды.Добавить("Создать1500Строк");
	НоваяКоманда9.Действие    = "Создать1500Строк";
	НоваяКоманда9.Заголовок   = "Создать 1500 строк";
	НоваяКоманда9.Отображение = ОтображениеКнопки.КартинкаИТекст;
	
#КонецОбласти
		
	#Область ДобавлениеСтраницФормы 
	// Создания группы страниц
	ГруппаСтраниц                    = Элементы.Добавить("ГруппаСтраницы", Тип("ГруппаФормы"),ЭтаФорма);
	ГруппаСтраниц.Вид                = ВидГруппыФормы.Страницы;
	ГруппаСтраниц.ОтображениеСтраниц = ОтображениеСтраницФормы.ЗакладкиСверху;
	
	// Создания страниц
	СтраницаКонтрагенты           = Элементы.Добавить("СтраницаКонтрагенты", Тип("ГруппаФормы"),ГруппаСтраниц);
	СтраницаКонтрагенты.Вид       = ВидГруппыФормы.Страница;
	СтраницаКонтрагенты.Заголовок = "Контрагенты";
	
	СтраницаНоменклатура             = Элементы.Добавить("СтраницаНоменклатура", Тип("ГруппаФормы"),ГруппаСтраниц);
	СтраницаНоменклатура.Вид         = ВидГруппыФормы.Страница;
	СтраницаНоменклатура.Заголовок   = "Номенклатура";
	СтраницаНоменклатура.Группировка = ГруппировкаПодчиненныхЭлементовФормы.Вертикальная;

	СтраницаПрочее           = Элементы.Добавить("СтраницаПрочее", Тип("ГруппаФормы"),ГруппаСтраниц);
	СтраницаПрочее.Вид       = ВидГруппыФормы.Страница;
	СтраницаПрочее.Заголовок = "Прочее";

	#КонецОбласти 
			
#Область ДобавлениеЭлементовФормы  

	ЭтаФорма.УстановитьДействие("ПриОткрытии", "ПриОткрытии");
	
		#Область ДобавлениеЭлементовСтраницыКонтрагенты 
			
			ЭлементПолеВвода                = Элементы.Добавить("ОрганизацияКонтрагент", Тип("ПолеФормы"), СтраницаКонтрагенты);
			ЭлементПолеВвода.ПутьКДанным    = "ОрганизацияКонтрагент";
			ЭлементПолеВвода.Вид            = ВидПоляФормы.ПолеВвода;
			ЭлементПолеВвода.Заголовок      = "Организация/контрагент";
	
			ЭлементБулево             = Элементы.Добавить("ПометкаУдаления", Тип("ПолеФормы"), СтраницаКонтрагенты);
			ЭлементБулево.Вид         = ВидПоляФормы.ПолеФлажка;
			ЭлементБулево.ВидФлажка   = ВидФлажка.Выключатель;
			ЭлементБулево.Заголовок   = "Не помеченые на удаление";
			ЭлементБулево.ПутьКДанным = "ПометкаУдаления";
			
			ЭлементФормыТаблица = ЭтотОбъект.Элементы.Контрагенты;        
			ЭтаФорма.Элементы.Переместить(ЭлементФормыТаблица, СтраницаКонтрагенты);
		
			ЭлементКолонка             = Элементы.Вставить("Договор", Тип("ПолеФормы"), ЭлементФормыТаблица, ЭлементФормыТаблица.ПодчиненныеЭлементы.КонтрагентыКонтрагент);  
			ЭлементКолонка.ПутьКДанным = "Контрагенты.Договор";
			ЭлементКолонка.Вид         = ВидПоляФормы.ПолеВвода;
		
			Картинка             = БиблиотекаКартинок.Обновить;	
			Заполнить            = Элементы.Добавить("Заполнить", Тип("КнопкаФормы"), ЭлементФормыТаблица.КоманднаяПанель); 
			Заполнить.Картинка   = Картинка;
			Заполнить.ИмяКоманды = "Заполнить";
						
		#КонецОбласти
	
	#Область ДобавлениеЭлементовСтраницыНоменклатура
		
		ДействияСоЗначениями                     = Элементы.Добавить("ДействияСоЗначениями", Тип("ГруппаФормы"), СтраницаНоменклатура);
		ДействияСоЗначениями.Вид                 = ВидГруппыФормы.ОбычнаяГруппа;
		ДействияСоЗначениями.Отображение         = ОтображениеОбычнойГруппы.Нет;
		ДействияСоЗначениями.Группировка         = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
		ДействияСоЗначениями.ОтображатьЗаголовок = Ложь;
		
		ГруппаВыборДаты                     = Элементы.Добавить("ГруппаВыборДаты", Тип("ГруппаФормы"), СтраницаНоменклатура);
		ГруппаВыборДаты.Вид                 = ВидГруппыФормы.ОбычнаяГруппа;	
		ГруппаВыборДаты.Отображение         = ОтображениеОбычнойГруппы.Нет;
		ГруппаВыборДаты.Заголовок           = "▼ Остатки на " + Формат(ТекущаяДата(), "ДЛФ=Д");
		ГруппаВыборДаты.Поведение           = ПоведениеОбычнойГруппы.Всплывающая;
		ГруппаВыборДаты.Группировка         = ГруппировкаПодчиненныхЭлементовФормы.Вертикальная;
		ГруппаВыборДаты.ШрифтЗаголовка      = Новый Шрифт(, 14);
		ГруппаВыборДаты.ЦветТекстаЗаголовка = WebЦвета.Зеленый;
	
		ПолеЧисло1                    = Элементы.Добавить("ПолеЧисло1", Тип("ПолеФормы"), ДействияСоЗначениями);
		ПолеЧисло1.Вид                = ВидПоляФормы.ПолеВвода;
		ПолеЧисло1.ПутьКДанным        = "Число1";
		ПолеЧисло1.ПоложениеЗаголовка = ПоложениеЗаголовкаЭлементаФормы.Нет;
		ЭтотОбъект.Число1 = 2;
		
		Действия           = Элементы.Добавить("Действия", Тип("ДекорацияФормы"), ДействияСоЗначениями);
		Действия.Вид       = ВидДекорацииФормы.Надпись;
		Действия.Заголовок = "+ - * /";
			
		ПолеЧисло2                    = Элементы.Добавить("ПолеЧисло2", Тип("ПолеФормы"), ДействияСоЗначениями);
		ПолеЧисло2.Вид                = ВидПоляФормы.ПолеВвода;
		ПолеЧисло2.ПутьКДанным        = "Число2";
		ПолеЧисло2.ПоложениеЗаголовка = ПоложениеЗаголовкаЭлементаФормы.Нет;
		ЭтотОбъект.Число2 = 3;
		
		Присваивание           = Элементы.Добавить("Присваивание", Тип("ДекорацияФормы"), ДействияСоЗначениями);
		Присваивание.Вид       = ВидДекорацииФормы.Надпись;
		Присваивание.Заголовок = "=";
		
		ПолеИтог                    = Элементы.Добавить("ПолеИтог", Тип("ПолеФормы"), ДействияСоЗначениями);
		ПолеИтог.Вид                = ВидПоляФормы.ПолеВвода;
		ПолеИтог.ПутьКДанным        = "Итог";
		ПолеИтог.ПоложениеЗаголовка = ПоложениеЗаголовкаЭлементаФормы.Нет;
		ЭтотОбъект.Итог = 5;
		
		ПолеДата                          = Элементы.Добавить("ПолеДата", Тип("ПолеФормы"), ГруппаВыборДаты);
		ПолеДата.Вид                      = ВидПоляФормы.ПолеКалендаря;
		ПолеДата.РастягиватьПоВертикали   = Ложь;
		ПолеДата.РастягиватьПоГоризонтали = Ложь;
		ПолеДата.ПутьКДанным              = "Дата";
		ПолеДата.Заголовок                = "Дата остатков";
		ПолеДата.УстановитьДействие("ПриАктивизацииДаты", "ДатаПриАктивизацииДаты");
    ЭтотОбъект.Дата = ТекущаяДата();
		
		ТаблицаФормыТовары             = Элементы.Добавить("ТаблицаТовары", Тип("ТаблицаФормы"), СтраницаНоменклатура);
		ТаблицаФормыТовары.ПутьКДанным = "Товар";
		ТаблицаФормыТовары.УстановитьДействие("ПриИзменении", "ТаблицаТоварыПриИзменении");
		
		ГруппаКолонокТаблицы                     = Элементы.Добавить("ГруппаКолонокТаблицы", Тип("ГруппаФормы"), ТаблицаФормыТовары);
		ГруппаКолонокТаблицы.Вид                 = ВидГруппыФормы.ГруппаКолонок;
		ГруппаКолонокТаблицы.ОтображатьЗаголовок = ЛОЖЬ; 
		ГруппаКолонокТаблицы.Группировка         = ГруппировкаКолонок.Вертикальная;
			
		ГруппаПодменюТаблицы           = Элементы.Добавить("ГруппаПодменюТаблицы", Тип("ГруппаФормы"), ТаблицаФормыТовары.КоманднаяПанель);
		ГруппаПодменюТаблицы.Заголовок = "Подменю";
		ГруппаПодменюТаблицы.Вид       = ВидГруппыФормы.Подменю;
		
		ГруппаКнопокТаблицы             = Элементы.Добавить("ГруппаКнопокТаблицы", Тип("ГруппаФормы"), ТаблицаФормыТовары.КоманднаяПанель);
		ГруппаКнопокТаблицы.Вид         = ВидГруппыФормы.ГруппаКнопок;
		ГруппаКнопокТаблицы.Отображение = ОтображениеГруппыКнопок.Компактное;
		
		// Команды подменю
		Сложение            = Элементы.Добавить("ВыполнитьСложение", Тип("КнопкаФормы"), ГруппаПодменюТаблицы); 
		Сложение.ИмяКоманды = "ВыполнитьСложение";
		
		Вычитание            = Элементы.Добавить("ВыполнитьВычитание",Тип("КнопкаФормы"),ГруппаПодменюТаблицы); 
		Вычитание.ИмяКоманды = "ВыполнитьВычитание";
		
		Умножение            = Элементы.Добавить("ВыполнитьУмножение", Тип("КнопкаФормы"),ГруппаПодменюТаблицы); 
		Умножение.ИмяКоманды = "ВыполнитьУмножение";
		
		Деление            = Элементы.Добавить("ВыполнитьДеление",Тип("КнопкаФормы"),ГруппаПодменюТаблицы); 
		Деление.ИмяКоманды = "ВыполнитьДеление";
		
		ГруппаКнопокПодменю     = Элементы.Добавить("ГруппаКнопокПодменю", Тип("ГруппаФормы"), ГруппаПодменюТаблицы);
		ГруппаКнопокПодменю.Вид = ВидГруппыФормы.ГруппаКнопок;
		
		ФизЛицо            = Элементы.Добавить("ФизЛицо",Тип("КнопкаФормы"), ГруппаКнопокПодменю); 
		ФизЛицо.ИмяКоманды = "ФизЛицо";
		ФизЛицо.Заголовок  = "Физ. лицо";
		
		Картинка                  = БиблиотекаКартинок.БизнесПроцесс;	
		БизнесПроцесс             = Элементы.Добавить("БизнесПроцесс",Тип("КнопкаФормы"), ГруппаКнопокТаблицы); 
		БизнесПроцесс.Картинка    = Картинка;
		БизнесПроцесс.ИмяКоманды  = "БизнесПроцесс";
		БизнесПроцесс.Отображение = ОтображениеКнопки.Картинка;
		
		Картинка               = БиблиотекаКартинок.ДебетКредит;	
		ДебетКредит            = Элементы.Добавить("ДебитКредит",Тип("КнопкаФормы"), ГруппаКнопокТаблицы); 
		ДебетКредит.Картинка   = Картинка;
		ДебетКредит.ИмяКоманды = "ДебитКредит";
		ДебетКредит.Заголовок  = "Кнопка 5";
		
		Картинка                     = БиблиотекаКартинок.СоздатьЭлементСписка;	
		Создать1500Строк             = Элементы.Добавить("Создать1500Строк",Тип("КнопкаФормы"), ТаблицаФормыТовары.КоманднаяПанель); 
		Создать1500Строк.Картинка    = Картинка;
		Создать1500Строк.ИмяКоманды  = "Создать1500Строк";
		Создать1500Строк.Заголовок  = "Создать 1500 строк";

		// Колонки ТаблицаФормыТовары
		ТоварНоменклатура             = Элементы.Добавить("Номенклатура", Тип("ПолеФормы"), ГруппаКолонокТаблицы);
		ТоварНоменклатура.Вид         = ВидПоляФормы.ПолеВвода;      
		ТоварНоменклатура.ПутьКДанным = "Товар.Номенклатура";
		
		ТоварКод             = Элементы.Добавить("Код", Тип("ПолеФормы"), ГруппаКолонокТаблицы);
		ТоварКод.Вид         = ВидПоляФормы.ПолеВвода;      
		ТоварКод.ПутьКДанным = "Товар.Код";
		
		ТоварОстатки             = Элементы.Добавить("Остаток", Тип("ПолеФормы"), ТаблицаФормыТовары);
		ТоварОстатки.Вид         = ВидПоляФормы.ПолеВвода;      
		ТоварОстатки.ПутьКДанным = "Товар.Остаток";
						
	#КонецОбласти
		
	#Область ДобавлениеЭлементовСтраницыПрочее 
	
		ВнешняяСсылка             = Элементы.Добавить("ВнешняяСсылка", Тип("ДекорацияФормы"), СтраницаПрочее);
		ВнешняяСсылка.Вид         = ВидДекорацииФормы.Надпись;
		ВнешняяСсылка.Заголовок   = "https://itseducation.ru/";
		ВнешняяСсылка.Гиперссылка = Истина;
		ВнешняяСсылка.УстановитьДействие("Нажатие", "ВнешняяСсылкаНажатие");
		
	  ГрОбработкаКартинок                     = Элементы.Добавить("ГрОбработкаКартинок", Тип("ГруппаФормы"), СтраницаПрочее);
		ГрОбработкаКартинок.Вид                 = ВидГруппыФормы.ОбычнаяГруппа;
		ГрОбработкаКартинок.Отображение         = ОтображениеОбычнойГруппы.Нет;
		ГрОбработкаКартинок.ОтображатьЗаголовок = Ложь;
		
		ГрОтображениеСпискаКартинок                          = Элементы.Добавить("ГрОтображениеСпискаКартинок", Тип("ГруппаФормы"), ГрОбработкаКартинок);
		ГрОтображениеСпискаКартинок.Вид                      = ВидГруппыФормы.ОбычнаяГруппа;
		ГрОтображениеСпискаКартинок.Отображение              = ОтображениеОбычнойГруппы.Нет;
		ГрОтображениеСпискаКартинок.Группировка              = ГруппировкаПодчиненныхЭлементовФормы.Вертикальная;
		ГрОтображениеСпискаКартинок.ОтображатьЗаголовок      = Ложь;
		ГрОтображениеСпискаКартинок.РастягиватьПоГоризонтали = Ложь;
		
		ГрДействияСКартинками                     = Элементы.Добавить("ГрДействияСКартинками", Тип("ГруппаФормы"), ГрОбработкаКартинок);
		ГрДействияСКартинками.Вид                 = ВидГруппыФормы.ОбычнаяГруппа;
		ГрДействияСКартинками.Отображение         = ОтображениеОбычнойГруппы.Нет;
		ГрДействияСКартинками.Группировка         = ГруппировкаПодчиненныхЭлементовФормы.Вертикальная;
		ГрДействияСКартинками.ОтображатьЗаголовок = Ложь;
				
		ТаблицаФормыКартинки                          = Элементы.Добавить("ТаблицаФормыКартинки", Тип("ТаблицаФормы"), ГрОтображениеСпискаКартинок);
		ТаблицаФормыКартинки.ПутьКДанным              = "СписокКартинок";
		ТаблицаФормыКартинки.ПоложениеКоманднойПанели = ПоложениеКоманднойПанелиЭлементаФормы.Нет;
		ТаблицаФормыКартинки.Шапка                    = Ложь;
		ТаблицаФормыКартинки.УстановитьДействие("ПриАктивизацииСтроки", "ТаблицаФормыКартинкиПриАктивизацииСтроки");
				
		КолонкаФормыКартинка             = Элементы.Добавить("КолонкаФормыКартинка", Тип("ПолеФормы"), ТаблицаФормыКартинки);
		КолонкаФормыКартинка.Вид         = ВидПоляФормы.ПолеВвода;      
		КолонкаФормыКартинка.ПутьКДанным = "СписокКартинок.Значение";	
		
		ПолеРазмерКартинки                         = Элементы.Добавить("ПолеРазмерКартинки", Тип("ПолеФормы"), ГрДействияСКартинками);
		ПолеРазмерКартинки.Вид                     = ВидПоляФормы.ПолеВвода;
		ПолеРазмерКартинки.ПутьКДанным             = "НастройкаКартинки";
		ПолеРазмерКартинки.ПоложениеЗаголовка      = ПоложениеЗаголовкаЭлементаФормы.Нет;
		ПолеРазмерКартинки.КнопкаВыпадающегоСписка = Истина;
		ПолеРазмерКартинки.УстановитьДействие("ОбработкаВыбора", "ПолеРазмерКартинкиОбработкаВыбора");
		
		ПолеКартинка                    = Элементы.Добавить("ПолеКартинка", Тип("ПолеФормы"), ГрДействияСКартинками);
		ПолеКартинка.Вид                = ВидПоляФормы.ПолеКартинки;
		ПолеКартинка.ПутьКДанным        = "Картинка";
		ПолеКартинка.ПоложениеЗаголовка = ПоложениеЗаголовкаЭлементаФормы.Нет;
		
	#КонецОбласти
	
#КонецОбласти 

	ЗаполнитьСписокКартинками();

КонецПроцедуры 

#Область ОбработчикиСобытий

&НаКлиенте
Процедура ТаблицаТоварыПриИзменении(Элемент)
	
	УстановленнаяДата = ЭтотОбъект.Дата;
	
	ДанныеЗапроса  = ПолучитьКодИОстатокНаСервереБезКонтекста(УстановленнаяДата);
	//ДанныеЗапроса  = ПолучитьКодИОстатокНаСервере(УстановленнаяДата);
	
	Для каждого Строка Из ЭтотОбъект.Товар Цикл
		
		Если ЗначениеЗаполнено(Строка.Номенклатура) И НЕ ЗначениеЗаполнено(Строка.Код) Тогда  
			
			Для каждого Структура Из ДанныеЗапроса Цикл
				
				Если Структура.Номенклатура =  Строка.Номенклатура  Тогда
					
					Строка.Код     = Структура.Код;
					Строка.Остаток = Структура.Остаток;
					
					Прервать;
				КонецЕсли;
				
			КонецЦикла;
			
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ) 
	
	НастройкаКартинки =  Элементы.ПолеРазмерКартинки.СписокВыбора[0].Значение;
	ПометкаУдаления   = Истина;
	Счетчик           = 0;
	
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаФормыКартинкиПриАктивизацииСтроки(Элемент)
	
	Если ЭтотОбъект.СписокКартинок.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	ЗначениеРазмера = Элемент.ТекущиеДанные.Значение;	
	Картинка        = ПоместитьВоВременноеХранилище(БиблиотекаКартинок[ЗначениеРазмера]);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолеРазмерКартинкиОбработкаВыбора(Элемент, ВыбранноеЗначение, ДополнительныеДанные, СтандартнаяОбработка) 
		
	Элементы.ПолеКартинка.РазмерКартинки = ВыбранноеЗначение;
	НастройкаКартинки                    = ВыбранноеЗначение; 
	
КонецПроцедуры

&НаКлиенте
Процедура ДатаПриАктивизацииДаты(Элемент)
	
	Дата = Элементы.ПолеДата.ВыделенныеДаты[0];
		
	Элементы.ГруппаВыборДаты.Заголовок = "▼ Остатки на " + Формат(Дата, "ДЛФ=Д");
	
	ПоказатьОстатокПоНоменклатуре();

КонецПроцедуры

&НаКлиенте
Процедура ВнешняяСсылкаНажатие(Элемент)
	ЗапуститьПриложениеАсинх(Элементы.ВнешняяСсылка.Заголовок);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКоманд 

&НаКлиенте
Процедура Создать1500Строк(Команда) 	
	ЗаполнитьТаблицуТовар();	
КонецПроцедуры

&НаКлиенте
Процедура БизнесПроцесс(Команда)
	
	Счетчик = Счетчик + 1;
	
	Если Счетчик % 2 = 0 Тогда 		
		Элементы.СтраницаНоменклатура.ЦветФона = WebЦвета.Белый; 	
	Иначе  	
		Элементы.СтраницаНоменклатура.ЦветФона = WebЦвета.Желтый; 	
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ДебитКредит(Команда)
	
	Счетчик = Счетчик + 1;
	
	ЧетоСделать(Счетчик);  
	
КонецПроцедуры

&НаКлиенте
Процедура ФизЛицо(Команда)
	ОткрытьФорму("Справочник.ФизическиеЛица.ФормаВыбора") ; 
КонецПроцедуры

&НаКлиенте
Процедура Заполнить(Команда) 
	ЗаполнитьНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьНаСервере()	
	
	Если ТипЗнч(ЭтотОбъект.ОрганизацияКонтрагент) = Тип("СправочникСсылка.Контрагенты") Тогда 
		
		РезультатЗапроса = ПолучитьПоКонтрагенту(ЭтотОбъект.ОрганизацияКонтрагент, ЭтотОбъект.ПометкаУдаления);

	Иначе	
		
		РезультатЗапроса = ПолучитьПоОрганизации(ЭтотОбъект.ОрганизацияКонтрагент, ЭтотОбъект.ПометкаУдаления);
		
	КонецЕсли;
	
	Контрагенты.Загрузить(РезультатЗапроса);
	
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьСложение(Команда) 
	ЭтотОбъект.Итог = ЭтотОбъект.Число2 + ЭтотОбъект.Число1;
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьВычитание(Команда)
	 ЭтотОбъект.Итог = ЭтотОбъект.Число1 - ЭтотОбъект.Число2;
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьУмножение(Команда)
	 ЭтотОбъект.Итог = ЭтотОбъект.Число1 * ЭтотОбъект.Число2;
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьДеление(Команда)
	Если ЭтотОбъект.Число2 <> 0 Тогда	
		 ЭтотОбъект.Итог = ЭтотОбъект.Число1 / ЭтотОбъект.Число2;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти 

#Область ВспомогательныеПроцедурыФункции
	
&НаСервере
Процедура ЗаполнитьТаблицуТовар()
	
 	РезультатЗапроса = ПолучитьНоменклатуру();
	
	Пока РезультатЗапроса.Количество() < 1499 Цикл
		
		Для каждого Выборка Из РезультатЗапроса Цикл
			
			Строка              = РезультатЗапроса.Добавить();
			Строка.Номенклатура = Выборка.Номенклатура; 
			
			Если РезультатЗапроса.Количество() = 1500 Тогда
				Прервать;
			КонецЕсли;
			
		КонецЦикла
		
	КонецЦикла;
	
	ЭтотОбъект.Товар.Загрузить(РезультатЗапроса);
	
КонецПроцедуры 

&НаСервере
Процедура ЗаполнитьСписокКартинками()
	
	ЭтотОбъект.СписокКартинок = ПолучитьСписокКартинок();	
	
	Для каждого Значение Из РазмерКартинки Цикл
		
		Элементы.ПолеРазмерКартинки.СписокВыбора.Добавить(Значение) 
		
	КонецЦикла;
	
КонецПроцедуры 

&НаСервере
Процедура ПоказатьОстатокПоНоменклатуре()
	
	Для каждого Строка Из ЭтотОбъект.Товар Цикл				
		Строка.Остаток = РегистрыНакопления.Остатки.ПоказатьОстаток(Строка.Номенклатура, ЭтотОбъект.Дата);		
	КонецЦикла;	
	
КонецПроцедуры 

&НаСервереБезКонтекста
Функция ПолучитьНоменклатуру() 
	
  Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Товар.Ссылка КАК Номенклатура
		|ИЗ
		|	Справочник.Номенклатура КАК Товар";
	
	РезультатЗапроса = Запрос.Выполнить().Выгрузить();
	
  Возврат  РезультатЗапроса;
	
КонецФункции 

&НаСервереБезКонтекста
Функция ПолучитьСписокКартинок()
	
    СписокКартинок = Новый СписокЗначений;
    
    ИменаКартинок = Новый Массив;
		
		#Область ИменаКартинок
		ИменаКартинок.Добавить("Константа");				
		ИменаКартинок.Добавить("Справочник");
		ИменаКартинок.Добавить("Документ");
		ИменаКартинок.Добавить("Отчет");
		ИменаКартинок.Добавить("Обработка");	
		ИменаКартинок.Добавить("РегистрБухгалтерии");
		ИменаКартинок.Добавить("РегистрНакопления");
		ИменаКартинок.Добавить("РегистрРасчета");
		ИменаКартинок.Добавить("РегистрСведений");
		ИменаКартинок.Добавить("Перечисление");
		ИменаКартинок.Добавить("Дебет");
		ИменаКартинок.Добавить("ДебетКредит");
		#КонецОбласти
    
		Для каждого ИмяКартинки Из ИменаКартинок Цикл
		    СписокКартинок.Добавить(ИмяКартинки, , , БиблиотекаКартинок[ИмяКартинки]);
		КонецЦикла;
    
    Возврат СписокКартинок;
		
КонецФункции 
	
&НаСервереБезКонтекста
Функция ПолучитьПоОрганизации(Ссылка, ПометкаУдаления) 
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Договоры.Ссылка КАК Договор,
		|	Контрагенты.Ссылка КАК Контрагент,
		|	Контрагенты.Код КАК Код
		|ИЗ
		|	Справочник.Организации КАК Организации
		|		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.Контрагенты КАК Контрагенты
		|			ЛЕВОЕ СОЕДИНЕНИЕ Справочник.Договоры КАК Договоры
		|			ПО Контрагенты.Ссылка = Договоры.Владелец.Ссылка
		|		ПО Организации.Ссылка = Контрагенты.Организация.Ссылка
		|ГДЕ
		|	Организации.Ссылка = &Ссылка
		|	И Контрагенты.ПометкаУдаления <> &ПометкаУдаления
		|
		|СГРУППИРОВАТЬ ПО
		|	Договоры.Ссылка,
		|	Контрагенты.Ссылка,
		|	Контрагенты.Код
		|
		|ИМЕЮЩИЕ
		|	КОЛИЧЕСТВО(Договоры.Ссылка) > 0";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	Запрос.УстановитьПараметр("ПометкаУдаления", ПометкаУдаления);


	РезультатЗапроса = Запрос.Выполнить().Выгрузить();
	
  Возврат  РезультатЗапроса;

КонецФункции 

&НаСервереБезКонтекста
Функция ПолучитьПоКонтрагенту(Ссылка, ПометкаУдаления)
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Договоры.Ссылка КАК Договор,
		|	Контрагенты.Ссылка КАК Контрагент,
		|	Контрагенты.Код КАК Код
		|ИЗ
		|	Справочник.Контрагенты КАК Контрагенты
		|		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.Договоры КАК Договоры
		|		ПО Контрагенты.Ссылка = Договоры.Владелец.Ссылка
		|ГДЕ
		|	Контрагенты.Ссылка = &Ссылка
		|	И Договоры.ПометкаУдаления <> &ПометкаУдаления
		|
		|СГРУППИРОВАТЬ ПО
		|	Договоры.Ссылка,
		|	Контрагенты.Ссылка,
		|	Контрагенты.Код
		|
		|ИМЕЮЩИЕ
		|	КОЛИЧЕСТВО(Договоры.Ссылка) > 0"; 
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка); 
	Запрос.УстановитьПараметр("ПометкаУдаления", ПометкаУдаления);

	РезультатЗапроса = Запрос.Выполнить().Выгрузить();
	
 	Возврат  РезультатЗапроса;
	 
 КонецФункции 
 
&НаСервереБезКонтекста
Функция ПолучитьКодИОстатокНаСервереБезКонтекста(Дата) 
	
	ГраницаОтбора = Новый Граница(Дата, ВидГраницы.Включая);
	
  Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	СправочникНоменклатура.Код КАК Код,
		|	ВложенныйЗапрос.Остаток КАК Остаток,
		|	СправочникНоменклатура.Ссылка КАК Номенклатура
		|ИЗ
		|	Справочник.Номенклатура КАК СправочникНоменклатура
		|		ВНУТРЕННЕЕ СОЕДИНЕНИЕ (ВЫБРАТЬ
		|			ОстаткиОстатки.Номенклатура КАК Номенклатура,
		|			ОстаткиОстатки.КоличествоОстаток КАК Остаток
		|		ИЗ
		|			РегистрНакопления.Остатки.Остатки(&ДатаОтбора, ) КАК ОстаткиОстатки) КАК ВложенныйЗапрос
		|		ПО СправочникНоменклатура.Ссылка = ВложенныйЗапрос.Номенклатура.Ссылка";
	
	Запрос.УстановитьПараметр("ДатаОтбора", ГраницаОтбора);
		
	ТабЗнач = Запрос.Выполнить().Выгрузить();	
	
	МассивСтруктур = Новый Массив;
	Для Каждого СтрокаТЗ Из ТабЗнач Цикл
		
		СтруктураДанныхЗапроса = Новый Структура;
		Для Каждого ИмяКолонки Из ТабЗнач.Колонки Цикл
			СтруктураДанныхЗапроса.Вставить(ИмяКолонки.Имя, СтрокаТЗ[ИмяКолонки.Имя]);
		КонецЦикла;
		
		МассивСтруктур.Добавить(СтруктураДанныхЗапроса);
		
	КонецЦикла;
	
	Возврат МассивСтруктур;
	
КонецФункции

&НаСервере
Функция ПолучитьКодИОстатокНаСервере(Дата)
	
	ГраницаОтбора = Новый Граница(Дата, ВидГраницы.Включая);
	
  Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	СправочникНоменклатура.Код КАК Код,
		|	ВложенныйЗапрос.Остаток КАК Остаток,
		|	СправочникНоменклатура.Наименование КАК Наименование
		|ИЗ
		|	Справочник.Номенклатура КАК СправочникНоменклатура
		|		ВНУТРЕННЕЕ СОЕДИНЕНИЕ (ВЫБРАТЬ
		|			ОстаткиОстатки.Номенклатура КАК Номенклатура,
		|			ОстаткиОстатки.КоличествоОстаток КАК Остаток
		|		ИЗ
		|			РегистрНакопления.Остатки.Остатки(&ДатаОтбора) КАК ОстаткиОстатки) КАК ВложенныйЗапрос
		|		ПО СправочникНоменклатура.Ссылка = ВложенныйЗапрос.Номенклатура.Ссылка";
	
	Запрос.УстановитьПараметр("ДатаОтбора", ГраницаОтбора);

	ТабЗнач = Запрос.Выполнить().Выгрузить();	
	
	МассивСтруктур = Новый Массив;
	Для Каждого СтрокаТЗ Из ТабЗнач Цикл
		
		СтруктураДанныхЗапроса = Новый Структура;
		Для Каждого ИмяКолонки Из ТабЗнач.Колонки Цикл
			СтруктураДанныхЗапроса.Вставить(ИмяКолонки.Имя, СтрокаТЗ[ИмяКолонки.Имя]);
		КонецЦикла;
		
		МассивСтруктур.Добавить(СтруктураДанныхЗапроса);
		
	КонецЦикла;
	
	Возврат МассивСтруктур;
	
КонецФункции 
 
&НаСервере
Процедура ЧетоСделать(Счетчик)
	
	Таблица      = Элементы.Найти("ТаблицаТовары");
	ГруппаФормы  = Элементы.Найти("ГруппаКолонокТаблицы");
	Номенклатура = Элементы.Найти("Номенклатура");
	Код          = Элементы.Найти("Код");
	Остатки      = Элементы.Найти("Остаток");
		
	Если Счетчик % 2 = 0 Тогда 
		
		Элементы.Переместить(Номенклатура, ГруппаФормы);
		Элементы.Переместить(Код, ГруппаФормы); 
		
	Иначе  
		
		Элементы.Переместить(Номенклатура, Таблица, Остатки);	
		Элементы.Переместить(Код, Таблица, Остатки); 
		
	КонецЕсли;
	
КонецПроцедуры 

#КонецОбласти

 