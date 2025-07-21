DROP TABLE  Clothes;

CREATE TABLE Clothes
(
    Type VARCHAR(20),
    Category VARCHAR(20),
    Origin VARCHAR(20),
    Brand VARCHAR(20),
    Fit VARCHAR(20),
    Year INT,
    Number INT,
    Color VARCHAR(20),
    Tradeable BOOLEAN,
    Source VARCHAR(20),
    CHECK (Type IN ('Jersey', 'Shorts', 'Long Sleeve','Shorty Shorts', 'Tank', 'Pants', 'Sweater','Hoodie','Jacket/Kway')),
    CHECK (Category IN ('National Team','Club Team','University Team', 'Event', 'Store')),
    CHECK (Fit in ('Large', 'Right','Tight')),
    CHECK (Year >= 2000),
    CHECK (Number IS NULL OR (Number >= 0 AND Number <= 99)),
    CHECK (Color in ('Dark', 'Light','Reversible'))

);

INSERT INTO Clothes (Type, Category, Origin, Brand, Fit, Year, Number, Color, Tradeable, Source)
VALUES
    ('Shorts', 'National Team', 'Japan', 'Gaia', 'Large', 2017, 66, 'Dark', FALSE, 'Gift'),
    ('Shorts', 'Event', 'Ireland', 'Force', 'Right', 2023, NULL, 'Light', TRUE, 'EUC 2023'),
    ('Shorts', 'Club Team', 'USA', 'BE', 'Right', 2023, 66, 'Dark', TRUE, 'WU24 2025'),
    ('Long Sleeve', 'National Team', 'Japan', 'Boon', 'Right', 2019, NULL, 'Dark', FALSE, 'Gift'),
    ('Jersey', 'National Team', 'Japan', 'VC', 'Right', 2025, 3, 'Dark', TRUE, 'WU24 2025'),
    ('Hoodie', 'National Team', 'Great Britain', 'Lookfly', 'Right', 2023, 9, 'Dark', FALSE, 'EMUC 2023'),
    ('Shorts', 'National Team', 'Australia', 'RubixWear', 'Right', 2025, 3, 'Dark', TRUE, 'WU24 2025'),
    ('Shorts', 'National Team', 'Japan', 'Gaia', 'Right', 2016, 8, 'Dark', TRUE, 'WU24 2025'),
    ('Pants', 'Club Team', 'Italy', '9UP', 'Right', 2023, 66, 'Dark', FALSE, 'Team uniform'),
    ('Jersey', 'National Team', 'Australia', 'Paladin', 'Right', 2023, 86, 'Dark', FALSE, 'Windmill 2024'),
    ('Jersey', 'National Team', 'Japan', 'Boon', 'Tight', 2020, 21, 'Light', TRUE, 'Windmill 2024'),
    ('Shorts', 'National Team', 'France', 'Other', 'Right', 2018, 2, 'Light', TRUE, 'WUCC 2022'),
    ('Jersey', 'National Team', 'Japan', 'Boon', 'Right', 2023, 32, 'Dark', FALSE, 'WJUC 2024'),
    ('Shorts', 'National Team', 'Japan', 'VC', 'Right', 2025, 33, 'Dark', TRUE, 'WU24 2025'),
    ('Hoodie', 'Event', 'USA', 'VC', 'Right', 2022, NULL, 'Dark', FALSE, 'WUCC 2022'),
    ('Shorts', 'Club Team', 'Italy', 'BE', 'Right', 2023, 66, 'Dark', FALSE, 'Team uniform'),
    ('Jersey', 'Club Team', 'Italy', 'BE', 'Right', 2023, 66, 'Light', FALSE, 'Team uniform'),
    ('Jersey', 'Club Team', 'Venezuela', 'Osh!', 'Right', 2022, 97, 'Dark', TRUE, 'Windmill 2024'),
    ('Tank', 'National Team', 'Japan', 'VC', 'Right', 2023, 33, 'Light', FALSE, 'WU24 2025'),
    ('Shorts', 'Club Team', 'Japan', 'Other', 'Right', 2022, 66, 'Dark', FALSE, 'EYUC 2023'),
    ('Jersey', 'Club Team', 'Italy', 'BE', 'Right', 2023, 66, 'Dark', FALSE, 'Team uniform'),
    ('Shorty Shorts', 'National Team', 'Japan', 'VC', 'Right', 2025, 29, 'Dark', FALSE, 'WU24 2025'),
    ('Jersey', 'National Team', 'USA', 'Five', 'Large', 2016, 19, 'Dark', FALSE, 'EMUC 2023'),
    ('Jacket/Kway', 'National Team', 'Australia', 'RubixWear', 'Right', 2025, NULL, 'Dark', TRUE, 'WU24 2025'),
    ('Jacket/Kway', 'National Team', 'USA', 'Spin', 'Right', 2025, NULL, 'Dark', TRUE, 'WU24 2025'),
    ('Long Sleeve', 'Club Team', 'USA', 'DH', 'Right', 2023, 66, 'Light', FALSE, 'Store'),
    ('Sweater', 'Club Team', 'Italy', 'Other', 'Right', 2024, NULL, 'Dark', TRUE, 'Store'),
    ('Tank', 'Event', 'Italy', '9UP', 'Right', 2024, 66, 'Dark', FALSE, 'Team uniform'),
    ('Jersey', 'Club Team', 'Italy', 'Geff', 'Right', 2017, 26, 'Dark', TRUE, 'Gift'),
    ('Sweater', 'Store', 'France', 'Force', 'Right', 2024, NULL, 'Dark', TRUE, 'Store'),
    ('Tank', 'Club Team', 'Egypt', 'Other', 'Tight', 2023, 97, 'Light', TRUE, 'Gift'),
    ('Jersey', 'Event', 'France', 'Other', 'Right', 2019, 5, 'Dark', TRUE, 'Gift'),
    ('Jersey', 'National Team', 'Italy', 'Manifattura Sportiva', 'Right', 2025, 66, 'Dark', FALSE, 'Team uniform'),
    ('Jersey', 'National Team', 'Japan', 'Boon', 'Right', 2025, 29, 'Light', FALSE, 'WU24 2025'),
    ('Jacket/Kway', 'National Team', 'Japan', 'ClubUltimate', 'Right', 2025, 31, 'Dark', FALSE, 'WU24 2025'),
    ('Pants', 'National Team', 'Italy', 'Manifattura Sportiva', 'Right', 2025, NULL, 'Dark', FALSE, 'Team uniform'),
    ('Long Sleeve', 'Event', 'Japan', 'ClubUltimate', 'Tight', 2024, NULL, 'Dark', TRUE, 'WU24 2025'),
    ('Long Sleeve', 'Event', 'Japan', 'ClubUltimate', 'Tight', 2025, NULL, 'Dark', TRUE, 'WU24 2025'),
    ('Shorts', 'Event', 'Spain', 'VC', 'Right', 2025, NULL, 'Dark', FALSE, 'WU24 2025'),
    ('Shorts', 'Club Team', 'Japan', 'Boon', 'Right', 2021, 87, 'Dark', FALSE, 'WUCC 2022');



# Vestiti della nazionale giapponese
select type from Clothes
where origin = 'Japan' and category = 'National Team';

# Numero di ogni tipo di vestito della nazionale giaponese
select type, count(*) from Clothes
where origin = 'Japan' and Category = 'National Team'
group by type;

# Sorgente con numero maggiore di vestiti ottenuti
select Source, count(*) as TotaleVestiti from Clothes
group by Source
order by TotaleVestiti DESC
limit 1;

# Sorgenti con numero minore di vestiti ottenuti
SELECT Source, COUNT(*) AS TotaleVestiti
FROM Clothes
GROUP BY Source
HAVING COUNT(*) = (
    SELECT MIN(Conteggio)
    FROM (
        SELECT COUNT(*) AS Conteggio
        FROM Clothes
        GROUP BY Source
    ) AS Subconteggi
);

# 10 Vestiti più datati
select * from Clothes
order by Year ASC
limit 10;