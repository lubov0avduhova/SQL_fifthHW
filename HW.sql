-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
create view carBelow as
    select name, cost
    from cars
    where cost < 25000;

-- 2.	Изменить в существующем представлении порог для стоимости:
-- пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
-- в postgresql для таких случаев используется create or replace
create or replace view carBelow as
    select name, cost
    from cars
    where cost < 30000;


-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
create view twoCars as
    select name, cost
    from cars
    where name in ('Skoda', 'Audi');


-- Чтобы получить это значение, мы вычитаем время станций для пар смежных станций.
--Проще это сделать с помощью оконной функции LEAD .
-- Эта функция сравнивает значения из одной строки со следующей строкой,
-- чтобы получить результат.
-- В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.

select train_id, station, station_time,
       lead(station_time, 1, null) over (partition by train_id order by train_id) - station_time
           as time_to_next_station_interval
from stations;
