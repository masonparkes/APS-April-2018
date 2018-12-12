initializeMatrices;

%%
%Field cooled scans start at 114, but some of thos might not be good
%x-rays started at 139
%we tried to align for a while so we aren't sure any are on the sample
%159 shutter says closed
%169 says open again
%open until scan 190. 179-190 were the detuning study.
%after checking 114:134
%     114,115, is just noise
%     116, starts showing some signs of shape
%     117 looks like a noisy line but is open a little
%     118 looks like a noisy flat line
%     119 is noisy and has some open spaces
%     120 shows some signs of the shape we usually got.
%     121 is also similr
%     122 similar but maybe noisier
%     123 sharp center peak but noisy
%     124 open weird shape
%     125 horseshoe-ish shape, but looks relatively clean
%     126 open and shaped like a blob
%     127:129 is just a zig zag with few points
%     130:133 don’t even run
%     No data for 127:133 in logbook
%     134 looks good
%135:159 all looked good
%159:169 all look good too
%170:176 look normal
%   177 has a dramatic slope after saturation
%   178 also has a strange shape but looks clean
%179:190 look good again
%Pre-Illumination: 134:138
%Illuminated: 139:159
%Post illumination: 160:168

figure;
hold on;
title('Before during and after illumination')
makePlot([134:138]);
makePlot([139:158]);
makePlot([159:168]);
legend('before','during','after');
xlabel('Applied Field (Gauss)')
ylabel('Voltage');

%There was another possible set we could look at.
figure;
hold on;
title('Before during and after illumination')
makePlot([134:138]);
makePlot([139:158]);
makePlot([159:168]);
makePlot([179:190]);
legend('before','during','after','detuning study');
xlabel('Applied Field (Gauss)')
ylabel('Voltage');

%There was another possible set we could look at.
%We feild cooled again at scan 230, but that was near the end and it
%doesn't lokk like we got too much data after that.