%% 2D-FFT
function rdm = TwoDFFT(frame)
range_win = hamming(256);   %�Ӻ�����
doppler_win = hamming(128);

for m=1:128
  temp=frame(:,m).*range_win;    %�Ӵ�����
  temp_fft=fft(temp);    %��ÿ��chirp��N��FFT
  rdm(:,m)=temp_fft;
end

for n=1:256
  temp=rdm(n,:).*(doppler_win)';    
  % temp=range_profile(n,:,k);
  temp_fft=fftshift(fft(temp));    %��rangeFFT�������M��FFT
  rdm(n,:)=temp_fft;  
end
rdm = rdm;