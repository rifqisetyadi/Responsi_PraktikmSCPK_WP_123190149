%Untuk Menampilkan Data
data = xlsread('dataRE.xlsx', 'C2:E51');
data1 = xlsread('dataRE.xlsx', 'H2:H51');
x = [data data1];
k = [1,0,1,0]; %jenis kriteria 1 untuk keuntungan 0 untuk biaya
%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan 0= atribut biaya
w = [3, 5, 4, 1]; %Nilai bobot tiap kriteria 

%Tahapan Perbaikan Bobot
[m n]=size (x); %Inisialisasi Ukuran X 
w = w./sum(w); %Membagi Bobot Kriteria Dengan Jumlah Total Seluruh Bobot

%Tahapann Melakukan Perhitungan Vektor (S) Per baris
for j=1:n, 
    if k(j)==0, 
        w(j)=-1*w(j); 
    end; 
end; 
for i=1:m, 
    S(i)=prod(x(i,:).^w); 
end;

%Tahapan Proses Perangkingan 
V= S/sum(S)