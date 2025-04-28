% Definisi gejala sebagai dynamic agar bisa berubah-ubah
:- dynamic gejala/1.

% Diagnosis berdasarkan kombinasi gejala yang dimasukkan user
diagnosis(hama_jamur_daun) :-
    gejala(daun_menguning),
    gejala(bercak_hitam).

diagnosis(serangan_ulat) :-
    gejala(daun_berlubang),
    gejala(tanaman_layu).

diagnosis(infeksi_virus) :-
    gejala(daun_menguning),
    gejala(tanaman_layu).

diagnosis(infeksi_bakteri) :-
    gejala(bercak_hitam),
    gejala(daun_berlubang).

% Saran berdasarkan diagnosis
saran(hama_jamur_daun, 'Semprotkan fungisida dan jaga kelembaban tanaman.').
saran(serangan_ulat, 'Gunakan insektisida alami dan periksa daun tanaman secara rutin.').
saran(infeksi_virus, 'Cabut tanaman yang terinfeksi dan lakukan rotasi tanaman.').
saran(infeksi_bakteri, 'Gunakan bakterisida dan hindari penyiraman berlebihan.').

% Menanyakan gejala kepada user dan menyimpannya
tanya_gejala :-
    tanya(daun_menguning, 'Apakah daun menguning? (ya/tidak)'),
    tanya(bercak_hitam, 'Apakah terdapat bercak hitam? (ya/tidak)'),
    tanya(daun_berlubang, 'Apakah daun berlubang? (ya/tidak)'),
    tanya(tanaman_layu, 'Apakah tanaman layu? (ya/tidak)').

tanya(Gejala, Pertanyaan) :-
    write(Pertanyaan), nl,
    read(Jawaban),
    (Jawaban == ya -> assertz(gejala(Gejala)) ; true).

% Predikat utama untuk menjalankan sistem
identifikasi_hama :-
    retractall(gejala(_)), % Reset semua gejala sebelumnya
    tanya_gejala,
    ( diagnosis(Hama) ->
        write('\n[ Hasil Diagnosis ]'), nl,
        write('- Diagnosis: '), write(Hama), nl,
        saran(Hama, Saran),
        write('- Saran Penanganan: '), write(Saran), nl
    ;
        write('\nTidak ditemukan diagnosis yang sesuai.'), nl,
        write('Saran: Periksa lebih lanjut atau konsultasikan dengan ahli.'), nl
    ).
