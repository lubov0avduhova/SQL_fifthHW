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


-- Добавьте новый столбец под названием «время до следующей станции».
select train_id, station, station_time,
       lead(station_time, 1, null) over (partition by train_id order by train_id) - station_time
           as time_to_next_station_interval
from stations;
