% Fakta gejala
gejala(daun_menguning).
gejala(bercak_hitam).
gejala(daun_berlubang).
gejala(tanaman_layu).

% Aturan inferensi berdasarkan kombinasi gejala
hama(jamur_daun) :- gejala(daun_menguning), gejala(bercak_hitam).
hama(serangan_ulat) :- gejala(daun_berlubang), gejala(tanaman_layu).
hama(infeksi_virus) :- gejala(daun_menguning), gejala(tanaman_layu).
hama(infeksi_bakteri) :- gejala(bercak_hitam), gejala(daun_berlubang).

% Saran penanganan untuk tiap hama
saran(jamur_daun, 'Lakukan penyemprotan fungisida secara berkala dan jaga kelembaban tanaman.').
saran(serangan_ulat, 'Gunakan insektisida alami dan periksa daun tanaman secara rutin.').
saran(infeksi_virus, 'Segera cabut tanaman yang terinfeksi dan lakukan rotasi tanaman.').
saran(infeksi_bakteri, 'Gunakan bakterisida dan hindari penyiraman berlebihan.').

% Rule utama: diagnosis dan saran
diagnosa(Hama, Saran) :-
    hama(Hama),
    saran(Hama, Saran).
