CREATE TABLE Provinsi(
    Id_provinsi INT NOT NULL,
    Nama_provinsi VARCHAR(100),
    PRIMARY KEY (Id_provinsi)
);

CREATE TABLE Kota(
    Id_kota INT NOT NULL,
    Nama_kota VARCHAR(100),
    Id_provinsi INT NOT NULL,
    PRIMARY KEY(Id_kota),
    FOREIGN KEY(Id_provinsi) REFERENCES Provinsi(Id_provinsi) 
);

INSERT INTO Provinsi (Id_provinsi,Nama_provinsi) VALUES (1,"DKI Jakarta");
INSERT INTO Provinsi (Id_provinsi,Nama_provinsi) VALUES (2,"Jawa Tengah");
INSERT INTO Provinsi (Id_provinsi,Nama_provinsi) VALUES (3,"Papua Barat");
INSERT INTO Provinsi (Id_provinsi,Nama_provinsi) VALUES (4,"Jawa Timur");
INSERT INTO Provinsi (Id_provinsi,Nama_provinsi) VALUES (5,"Jawa Barat");
INSERT INTO Provinsi (Id_provinsi,Nama_provinsi) VALUES (6,"Bali");
INSERT INTO Provinsi (Id_provinsi,Nama_provinsi) VALUES (7,"Sulawesi Selatan");

INSERT INTO Kota (Id_kota,Nama_kota,Id_provinsi) VALUES (1,"Jakarta Pusat",1);
INSERT INTO Kota (Id_kota,Nama_kota,Id_provinsi) VALUES (2,"Semarang",2);
INSERT INTO Kota (Id_kota,Nama_kota,Id_provinsi) VALUES (3,"Surabaya",4);
INSERT INTO Kota (Id_kota,Nama_kota,Id_provinsi) VALUES (4,"Malang",4);
INSERT INTO Kota (Id_kota,Nama_kota,Id_provinsi) VALUES (5,"Bandung",5);
INSERT INTO Kota (Id_kota,Nama_kota,Id_provinsi) VALUES (6,"Denpasar",6);
INSERT INTO Kota (Id_kota,Nama_kota,Id_provinsi) VALUES (7,"Makasar",7);

-- No 1

SELECT COUNT(*) AS Jumlah_Kota_Jawa_Timur
FROM Kota k
INNER JOIN Provinsi p ON k.Id_provinsi = p.Id_provinsi
WHERE p.Nama_Provinsi = 'Jawa Timur';

-- No 2 

SELECT p.Nama_Provinsi
FROM Provinsi p
INNER JOIN Kota k ON p.Id_Provinsi = k.Id_provinsi
GROUP BY p.Nama_Provinsi
ORDER BY COUNT(k.Id_kota) DESC
LIMIT 1;

-- No 3

SELECT p.Nama_Provinsi, COUNT(k.Id_kota) AS Total_Kota
FROM Provinsi p
JOIN Kota k ON p.Id_Provinsi = k.Id_provinsi
WHERE p.Nama_Provinsi = 'Jawa Timur'
GROUP BY p.Nama_Provinsi;

-- No 4

SELECT p.Nama_Provinsi, k.Nama_kota
FROM Provinsi p
LEFT JOIN Kota k ON p.Id_Provinsi = k.Id_provinsi;

-- No 5

SELECT p.Nama_Provinsi
FROM Provinsi p
LEFT JOIN Kota k ON p.Id_Provinsi = k.Id_provinsi
WHERE k.Id_kota IS NULL;
