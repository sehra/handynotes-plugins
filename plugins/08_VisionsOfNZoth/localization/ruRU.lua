local ADDON_NAME, _ = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME, "ruRU", false, true)
if not L then return end

-------------------------------------------------------------------------------
----------------------------------- GENERAL -----------------------------------
-------------------------------------------------------------------------------

L["context_menu_title"] = "HandyNotes Видения Н'Зота"
L["options_title"] = "Видения Н'Зота"
L["options_icons_assaultevents"] = "Значки Событий Нападения"

-------------------------------------------------------------------------------
------------------------------------ ULDUM ------------------------------------
-------------------------------------------------------------------------------

L["uldum"] = "Ульдум"
L["uldum_intro_note"] = "Завершите начальную цепочку заданий, чтобы разблокировать редких монстров, сокровища и задания вторжений в Ульдуме."

L["aqir_flayer"] = "Разделяет появление с Акир-рабочий и Акир-жнец."
L["aqir_titanus"] = "Разделяет появление с Акир-гигант."
L["aqir_warcaster"] = "Разделяет появление с Акир - заклинатель Бездны."
L["atekhramun"] = "Давите Ядошкурых скорпиончиков, пока он не появится."
L["chamber_of_the_moon"] = "Под Залом Луны."
L["chamber_of_the_stars"] = "Под Залом Звезд."
L["chamber_of_the_sun"] = "Внутри Зала Солнца."
L["dunewalker"] = "Нажмите на Сущность Солнца на платформе выше, чтобы освободить его."
L["friendly_alpaca"] = "Скормите Альпаке побеги Герсали семь раз, чтобы получить ее как средство передвижения. Появляется в течение 10 минут в одном месте, затем долгое возрождение."
L["gaze_of_nzoth"] = "Разделяет появление с Нечистыми наблюдателями."
L["gersahl_note"] = "Кормите дружелюбную альпаку семь раз для получения средства передвижения. Не требует травничества."
L["gersahl"] = "Побеги Герсали"
L["hmiasma"] = "Накормите его, пока он не активируется."
L["kanebti"] = "Найдите Украшенную камнями фигурку скарабея, которая делит свое появление с Могильными скарабеями, для вызова редкого монстра."
L["left_eye"] = "Левая половина игрушки Всевидящие глаза."
L["neferset_rare"] = "Этот редкий монстр имеют три одинаковые точки появления в Неферсете. После завершения Ритуала Призыва появится случайный набор из трех монстров."
L["platform"] = "Появляется на вершине воздушной платформы."
L["single_chest"] = "Этот сундук появляется только в одном месте! Если его там нет, подождите немного, и он появится."
L["spirit_cave"] = "Вход в пещеру для Духа Темного Ритуалиста Закана."
L["tomb_widow"] = "Когда присутствуют белые коконы, убейте невидимых пауков, чтобы призвать."
L["uatka"] = "Вместе с двумя другими игроками, нажмите на каждое загадочное устройство. Требуется Амулет Светозарных который можно получить из Реликвий Аматета."
L["wastewander"] = "Разделяет появление с Порабощенный Скиталец Пустыни."

L["amathet_cache"] = "Тайник Аматетов"
L["black_empire_cache"] = "Тайник Темной Империи"
L["black_empire_coffer"] = "Сундук Тайной Империи"
L["infested_cache"] = "Зараженный Тайник"
L["infested_strongbox"] = "Зараженный Сундук"
L["amathet_reliquary"] = "Реликвия Аматетов"

L["cursed_relic"] = "Требуется Проклятая Реликвия"
L["tolvir_relic"] = "Требуется Реликвия Тол'виров"

L["options_icons_alpaca_uldum"] = "Курчавая Альпака"
L["options_icons_alpaca_uldum_desc"] = "Показать в локации места появления Побега герсали и Дружелюбной альпаки."
L["options_icons_assault_events"] = "События Нападения"
L["options_icons_assault_events_desc"] = "Показать места возможных событий нападения."
L["options_icons_coffers"] = "Запертые Сундуки"
L["options_icons_coffers_desc"] = "Отображение местоположения запертых сундуков (можно открыть один раз за нападение)."

L["ambush_settlers"] = "Защищайте Дервиша до окончания атак монстров."
L["burrowing_terrors"] = "Прыгай на Закапывающихся Скарабеев, чтобы раздавить их."
L["call_of_void"] = "Очистить ритуальный пилон."
L["combust_cocoon"] = "Бросайте самодельные зажигательные бомбы в коконы на потолке."
L["dormant_destroyer"] = "Нажмите на Проводники Бездны."
L["executor_nzoth"] = "Убейте Палача Н'Зота, затем уничтожьте Маяк Палача."
L["hardened_hive"] = "Возьмите Огнемет Скитальцев Пустыни и сожгите все кладки с яйцами."
L["in_flames"] = "Захватите ведра с водой и потушите огонь."
L["monstrous_summon"] = "Убейте всех Предвестников глубин, чтобы остановить призыв."
L["obsidian_extract"] = "Уничтож все Сформированные Бездной Обсидианы."
L["purging_flames"] = "Подберите тела и бросьте их в огонь."
L["pyre_amalgamated"] = "Активируйте костер, затем убейте все слияния, пока не появятся Слияние Плоти."
L["ritual_ascension"] = "Убейте всех Светозарных-ритуалистов."
L["solar_collector"] = "Включите все пять ячеек со всех сторон Солнечного Коллектора. Нажатие на кристалл силы также переключает все кристаллы, касающиеся этой ячейки.\n\nЕсли все ячейки пусты, самая короткая последовательность левая-> правая-> средняя-> левая-> правая."
L["summoning_ritual"] = "Убейте послушников и закройте портал призыва."
L["titanus_egg"] = "Уничтожьте Колоссальное яйцо, затем победите Молодого акира-колосса."
L["unearthed_keeper"] = "Уничтожить Раскопанного Хранителя."
L["virnall_front"] = "Отбивайте атаки монстров, пока не появится Менептах Вестник войны."
L["voidflame_ritual"] = "Погасить все тронутые бездной свечи."

L["beacon_of_sun_king"] = "Поверните все три статуи внутрь."
L["engine_of_ascen"] = "Перекройте статуями аматетов лучи."
L["lightblade_training"] = "Убивайте инструкторов и учеников, пока не появится Камес, Клинок Рассвета."
L["raiding_fleet"] = "Сожги все лодки, используя Бросок Факела."
L["slave_camp"] = "Откройте все близлежащие клетки."
L["unsealed_tomb"] = "Защити Геру от волн монстров."

-------------------------------------------------------------------------------
------------------------------------ VALE -------------------------------------
-------------------------------------------------------------------------------

L["vale"] = "Вечноцветущий дол"
L["vale_intro_note"] = "Завершите начальную цепочку заданий, чтобы разблокировать редких монстров, сокровища и задания вторжений в Вечноцветущем доле."

L["big_blossom_mine"] = "Внутри Рудника Пышного Цветения. Вход на северо-востоке."
L["guolai"] = "Внутри залов Го-Лай."
L["guolai_left"] = "Внутри залов Го-Лай (левый проход)."
L["guolai_center"] = "Внутри залов Го-Лай (центральный проход)."
L["guolai_right"] = "Внутри залов Го-Лай (правый проход)."
L["pools_of_power"] = "Внутри Источника Силы. Вход в Золотой пагоде."
L["right_eye"] = "Правая половина игрушки Всевидящие глаза."
L["tisiphon"] = "Нажмите на счастливую удочку Даниэлы."

L["ambered_cache"] = "Покрытый янтарем тайник"
L["ambered_coffer"] = "Покрытый янатрем сундук"
L["mantid_relic"] = "Требуется Реликвия Богомолов"
L["mogu_plunder"] = "Добыча Могу"
L["mogu_strongbox"] = "Сундук Могу"
L["mogu_relic"] = "Требуется Реликвия Могу"

L["abyssal_ritual"] = "Убейте Утонувших приверженцев и затем Чудовище из глубин."
L["bound_guardian"] = "Убейте трех Глубинных подчинителей, чтобы освободить Чистую Каплю."
L["colored_flames"] = "Отнесите разноцветные факелы в соответствующие руны."
L["construction_ritual"] = "Толкните статую тигра в луч."
L["consuming_maw"] = "Нажимайте на наросты и щупальца, пока вас не выкинет из пасти."
L["corruption_tear"] = "Возьмите Маяк Титанов и закройте Прорыв Порчи, не позволяя крутящимся глазам ударить вас."
L["electric_empower"] = "Убейте Призывателей из клана Цзань-Тень, а затем Менека Преображенного."
L["empowered_demo"] = "Закройте все Реликварий Духов."
L["empowered_wagon"] = "Подберите боеприпасы Шадо-Пан и поместите их под повозку."
L["feeding_grounds"] = "Уничтожить сосуды с янтарной смолой и камеры заключения."
L["font_corruption"] = "Вращайте статуи могу, пока оба луча не достигнут задней части, затем включите консоль."
L["goldbough_guardian"] = "Защитите Вождя Золотую Ветвь от волн монстров."
L["infested_statue"] = "Уберите все дергающиеся глаза со статуи."
L["kunchong_incubator"] = "Уничтожить все генераторы поля."
L["mantid_hatch"] = "Подберите огнемет Шадо-Пан и уничтожьте инкубаторы для личинок."
L["mending_monstro"] = "Уничтожьте все кристаллы Исцеляющего янтаря."
L["mystery_sacro"] = "Уничтожьте все Подозрительные Надгробия, затем убейте Кричащую душу."
L["noodle_cart"] = "Защити Чинь, пока он ремонтирует свою тележку."
L["protect_stout"] = "Защитите пещеру от волн монстров."
L["pulse_mound"] = "Убей окружающих монстров, затем Живой Нарост."
L["ravager_hive"] = "Уничтожьте все ульи на дереве."
L["ritual_wakening"] = "Убейте Клакси-пробудителей."
L["serpent_binding"] = "Убейте Поработителей из клана Цзань-Тень, а затем Хаофэна."
L["stormchosen_arena"] = "Уберите всех могу на арене, затем убейте генерала клана."
L["swarm_caller"] = "Уничтожить Призыватель Роя."
L["vault_of_souls"] = "Откройте хранилище и уничтожьте все статуи."
L["void_conduit"] = "Нажмите на Проводник Бездны, а затем давите Зоркое Око."
L["war_banner"] = "Сожгите боевое знамя и убивайте волны монстров, пока не появится командир."
L["weighted_artifact"] = "Возьмите Подозрительно Тяжелую Вазу и вернитесь через лабиринт к выходу. После этого нажмите на Утяжеленную реликвию Могу."

-------------------------------------------------------------------------------
----------------------------------- VISIONS -----------------------------------
-------------------------------------------------------------------------------

L["colored_potion"] = "Цветное зелье"
L["colored_potion_note"] = [[
Зелье рядом с трупом %s всегда указывает цвет зелья с отрицательным эффектом, не пейте такие зелья.

В зависимости от цвета этого флакона, можно определить, какие другие зелья будут давать +100 здравомыслия (|cFFFF0000bad|r => |cFF00FF00good|r):

Черный => Зеленый
Синий => Фиолетовый
Зеленый => Красный
Фиолетовый => Черный
Красный => Синий
]]

L["bear_spirit"] = "Дух медведя"
L["bear_spirit_note"] = "Убейте Рассерженного духа медвежьей шкуры и все волны монстров, чтобы получить бафф на 10% скорости."
L["buffs_change"] = "Доступные баффы меняются каждую неделю. Если здание закрыто или NPC/объект отсутствует, этого баффа не будет на этой неделе."
L["clear_sight"] = "Требуется Ясное зрение ранга %d."
L["craggle"] = "Положите игрушку на землю (например, игрушечную железную дорогу), чтобы отвлечь его, пока его боты продолжают путь. Как только они разойдутся достаточно далеко то убейте ботов, а затем Крэггла Головодерга."
L["empowered"] = "Усиление"
L["empowered_note"] = "Пройдите через лабиринт из мин и встаньте на Экспериментальную усиливающую мину, чтобы получить бафф на 10% урона."
L["enriched"] = "Богатство"
L["enriched_note"] = "Убейте Заброшенный банк гильдии, чтобы получить бафф на 10% критического удара."
L["ethereal_essence"] = "Эфириальная сущность"
L["ethereal_essence_note"] = "Убейте Исказителя пространства Душара для получения баффа на 10% критического удара."
L["ethereal_note"] = "Соберите оранжевые кристаллы, спрятанные в видении, и верните их этому NPC для получения дополнительных Зараженных реликвии.\n\n|cFF00FF00Не забудьте добыть сундук!|r"
L["heroes_bulwark"] = "Доспехи героя"
L["heroes_bulwark_note"] = "Убейте Гамона в таверне, чтобы получить бафф на 10% здоровья."
L["horrific_visions"] = "Жуткие Видения"
L["inside_building"] = "Внутри здания."
L["mailbox"] = "Почтовый Ящик"
L["mail_muncher"] = "При открытии Почтового Ящика может появится Письмоед."
L["morgan_pestle"] = "Морган Пест"
L["odd_crystal"] = "Odd Crystal"
L["requited_bulwark"] = "Благостный щит"
L["requited_bulwark_note"] = "Убейте Огюста Мулена чтобы получить получить бафф на 7% универсальности."
L["shave_kit"] = "Набор для бритья Кудрешлем"
L["shave_kit_note"] = "Внутри парикмахерской."
L["smiths_strength"] = "Сила кузнеца"
L["smiths_strength_note"] = "Убейте Нароса в хижине кузнеца, чтобы получить бафф на 10% урона."
L["spirit_of_wind"] = "Дух ветра"
L["spirit_of_wind_note"] = "Убейте Бвембe и получите бафф на 10% скорости и скорости передвижения."
L["void_skull"] = "Меченный Бездной череп"
L["void_skull_note"] = "Нажмите на череп на земле, чтобы получить игрушку."
L["yelmak"] = "Йелмак"

L["c_alley_corner"] = "В углу в переулке."
L["c_bar_upper"] = "В баре на втором этаже."
L["c_behind_bank_counter"] = "В банке за стойкой в подсобке."
L["c_behind_boss"] = "В здании для беженцев за спиной босса."
L["c_behind_boxes"] = "В углу за какими-то коробками."
L["c_behind_cart"] = "За разрушенной телегой."
L["c_behind_house_counter"] = "В доме за прилавком."
L["c_behind_mailbox"] = "За почтовым ящиком."
L["c_behind_pillar"] = "Скрытый за колонной позади здания посольства."
L["c_behind_rexxar"] = "Скрытый справа за зданием Рексара."
L["c_behind_stables"] = "За конюшней у Шоу."
L["c_by_pillar_boxes"] = "У стены между колонной и какими-то ящиками."
L["c_center_building"] = "На нижнем этаже центрального здания."
L["c_forge_corner"] = "В углу у кузницы."
L["c_hidden_boxes"] = "Спрятан за какими-то ящиками позади здания Тралла."
L["c_inside_auction"] = "Внутри аукционного дома справа."
L["c_inside_big_tent"] = "Слева внутри большой палатки."
L["c_inside_cacti"] = "Внутри кактусовой грядки за углом."
L["c_inside_hut"] = "Внутри первой хижины справа."
L["c_inside_leatherwork"] = "Внутри мастерской кожевника."
L["c_inside_orphanage"] = "Внутри детского дома."
L["c_inside_transmog"] = "Внутри хижины трансмога."
L["c_left_cathedral"] = "Скрытый слева от входа в собор."
L["c_left_inquisitor"] = "Позади инквизитора слева от лестницы."
L["c_on_small_hill"] = "На вершине небольшого холма."
L["c_top_building"] = "На самом верхнем этаже здания."
L["c_underneath_bridge"] = "Под мостом."
L["c_walkway_corner"] = "На верхней дорожке в углу."
L["c_walkway_platform"] = "На платформе над верхней дорожкой."

L["options_icons_visions_buffs"] = "Баффы"
L["options_icons_visions_buffs_desc"] = "Показать места событий, которые дают баффы на урон, на час."
L["options_icons_visions_chest"] = "Сундуки"
L["options_icons_visions_chest_desc"] = "Показать возможные места сундуков внутри жутких видений."
L["options_icons_visions_crystals"] = "Странные Кристаллы"
L["options_icons_visions_crystals_desc"] = "Показывать расположение Странных Кристаллов внутри жутких видений."
L["options_icons_visions_mail"] = "Почтовый Ящик"
L["options_icons_visions_mail_desc"] = "Показывать расположение почтовых ящиков для получения Письмоеда."
L["options_icons_visions_misc"] = "Разное"
L["options_icons_visions_misc_desc"] = "Показать награды на карте внутри жутких видений."

-------------------------------------------------------------------------------
----------------------------------- VOLDUN ------------------------------------
-------------------------------------------------------------------------------

L["voldun"] = "Вол'дун"
L["elusive_alpaca"] = "Скормите Салат из приморской зелени, альпаке, чтобы выучить ее как маунта. Появляется в течение 10 минут в одном месте, затем долгое возрождение."
L["options_icons_alpaca_voldun_desc"] = "Показать места появления Неуловимого быстронога."
L["options_icons_alpaca_voldun"] = "Неуловимый быстроног"
