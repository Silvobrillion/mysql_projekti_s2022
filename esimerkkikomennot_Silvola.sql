-- Izabel Silvola, ryhmä INTIM21A6
-- Esimerkkejä komennoista. HUOM Kaikkien esimerkkien edessä pitää olla:
USE projekti_autokauppa;

-- Toimipisteiden myyjien määrä:
SELECT toimipiste_id, count(*) as myyjat FROM myyja GROUP BY toimipiste_id;

-- Kaikki myynnissä olevat autot:
SELECT * FROM auto WHERE myyty = false;

-- Auton myynti, kun tiedetään, että auton id on 4 ja myyjän id on 2:
USE projekti_autokauppa;
INSERT INTO myynti VALUES (DEFAULT, 4, 2, 42500, DEFAULT);
UPDATE auto SET myyty = true WHERE auto_id = 4;

-- Esimerkki auton lisäämisestä (tätä autoa ei ole tietokannassa):
INSERT INTO auto VALUES (DEFAULT, 2012, "Skoda", "Octavia", "Manuaali", "Bensiini", 125600, "LAD-318", 9800, DEFAULT, 2, DEFAULT);

-- Kokonainen liikevoitto tässä kuukaudessa:
SELECT sum(myynti.myyntihinta - auto.ostohinta) as liikevoitto,
	MONTH(CURRENT_DATE()) as kuukausi
FROM myynti JOIN auto ON auto.auto_id = myynti.auto_id
WHERE YEAR(myynti.myyntipaiva) = YEAR(CURRENT_DATE()) AND MONTH(myynti.myyntipaiva) = MONTH(CURRENT_DATE());

-- tai esimerkiksi viime kuukaudessa:
SELECT sum(myynti.myyntihinta - auto.ostohinta) as liikevoitto,
	MONTH(CURRENT_DATE - INTERVAL 1 MONTH) as kuukausi
FROM myynti JOIN auto ON auto.auto_id = myynti.auto_id
WHERE YEAR(myynti.myyntipaiva) = YEAR(CURRENT_DATE()) AND MONTH(myynti.myyntipaiva) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH);

-- Jaetaan tämän kuukauden myynnit per toimipiste ja näytetään myös kaupunki, jossa toimipiste sijaitsee:
SELECT sum(myynti.myyntihinta - auto.ostohinta) as liikevoitto, auto.toimipiste_id,
	(SELECT osoite.kaupunki FROM toimipiste JOIN osoite ON toimipiste.osoite_id = osoite.osoite_id 
	WHERE auto.toimipiste_id = toimipiste.toimipiste_id) as kaupunki
FROM myynti JOIN auto ON auto.auto_id = myynti.auto_id
WHERE YEAR(myynti.myyntipaiva) = YEAR(CURRENT_DATE()) AND MONTH(myynti.myyntipaiva) = MONTH(CURRENT_DATE())
GROUP BY auto.toimipiste_id;

-- Laksetaan myyjien nettomyynnit viime kuukaudessa:
SELECT sum(myynti.myyntihinta - auto.ostohinta) as nettomyynnit, 
    CONCAT(myyja.etunimi, " ", myyja.sukunimi) as myyja,
    MONTH(CURRENT_DATE - INTERVAL 1 MONTH) as kuukausi
FROM myynti JOIN auto ON auto.auto_id = myynti.auto_id
JOIN myyja ON myyja.myyja_id = myynti.myyja_id
WHERE YEAR(myynti.myyntipaiva) = YEAR(CURRENT_DATE()) AND MONTH(myynti.myyntipaiva) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
GROUP BY myynti.myyja_id;

-- tai tämän kuukauden nettomyynnit:
SELECT sum(myynti.myyntihinta - auto.ostohinta) as nettomyynnit, 
    CONCAT(myyja.etunimi, " ", myyja.sukunimi) as myyja,
    MONTH(CURRENT_DATE()) as kuukausi
FROM myynti JOIN auto ON auto.auto_id = myynti.auto_id
JOIN myyja ON myyja.myyja_id = myynti.myyja_id
WHERE YEAR(myynti.myyntipaiva) = YEAR(CURRENT_DATE()) AND MONTH(myynti.myyntipaiva) = MONTH(CURRENT_DATE())
GROUP BY myynti.myyja_id;
