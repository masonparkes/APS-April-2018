%early attempt to find hall coefficients (straight line slopes)
clear; close all;

scan25=dlmread('Chesnel_Apr2018.0025',' ',180);
v25=scan25(:,9);
f25=scan25(:,2);
v25=v25./mean(v25);

scan26=dlmread('Chesnel_Apr2018.0026',' ',180);
v26=scan26(:,9);
f26=scan26(:,2);
v26=v26./mean(v26);

scan27=dlmread('Chesnel_Apr2018.0027',' ',180);
v27=scan27(:,9);
f27=scan27(:,2);
v27=v27./mean(v27);

scan28=dlmread('Chesnel_Apr2018.0028',' ',180);
v28=scan28(:,9);
f28=scan28(:,2);
v28=v28./mean(v28);

scan29=dlmread('Chesnel_Apr2018.0029',' ',180);
v29=scan29(:,9);
f29=scan29(:,2);
v29=v29./mean(v29);

scan30=dlmread('Chesnel_Apr2018.0030',' ',180);
v30=scan30(:,9);
f30=scan30(:,2);
v30=v30./mean(v30);

scan31=dlmread('Chesnel_Apr2018.0031',' ',180);
v31=scan31(:,9);
f31=scan31(:,2);
v31=v31./mean(v31);

scan32=dlmread('Chesnel_Apr2018.0026',' ',180);
v32=scan32(:,9);
f32=scan32(:,2);
v32=v32./mean(v32);

scan33=dlmread('Chesnel_Apr2018.0033',' ',180);
v33=scan33(:,9);
f33=scan33(:,2);
v33=v33./mean(v33);

scan34=dlmread('Chesnel_Apr2018.0034',' ',180);
v34=scan34(:,9);
f34=scan34(:,2);
v34=v34./mean(v34);

scan35=dlmread('Chesnel_Apr2018.0035',' ',180);
v35=scan35(:,9);
f35=scan35(:,2);
v35=v35./mean(v35);

scan36=dlmread('Chesnel_Apr2018.0036',' ',180);
v36=scan36(:,9);
f36=scan36(:,2);
v36=v36./mean(v36);

scan37=dlmread('Chesnel_Apr2018.0037',' ',180);
v37=scan37(:,9);
f37=scan37(:,2);
v37=v37./mean(v37);

scan38=dlmread('Chesnel_Apr2018.0038',' ',180);
v38=scan38(:,9);
f38=scan38(:,2);
v38=v38./mean(v38);

scan39=dlmread('Chesnel_Apr2018.0039',' ',180);
v39=scan39(:,9);
f39=scan39(:,2);
v39=v39./mean(v39);

scan40=dlmread('Chesnel_Apr2018.0040',' ',180);
v40=scan40(:,9);
f40=scan40(:,2);
v40=v40./mean(v40);

scan41=dlmread('Chesnel_Apr2018.0041',' ',180);
v41=scan41(:,9);
f41=scan41(:,2);
v41=v41./mean(v41);

scan42=dlmread('Chesnel_Apr2018.0042',' ',180);
v42=scan42(:,9);
f42=scan42(:,2);
v42=v42./mean(v42);

scan43=dlmread('Chesnel_Apr2018.0043',' ',180);
v43=scan43(:,9);
f43=scan43(:,2);
v43=v43./mean(v43);

scan44=dlmread('Chesnel_Apr2018.0044',' ',180);
v44=scan44(:,9);
f44=scan44(:,2);
v44=v44./mean(v44);

scan45=dlmread('Chesnel_Apr2018.0045',' ',180);
v45=scan45(:,9);
f45=scan45(:,2);
v45=v45./mean(v45);

scan46=dlmread('Chesnel_Apr2018.0046',' ',180);
v46=scan46(:,9);
f46=scan46(:,2);
v46=v46./mean(v46);

scan47=dlmread('Chesnel_Apr2018.0047',' ',180);
v47=scan47(:,9);
f47=scan47(:,2);
v47=v47./mean(v47);

scan48=dlmread('Chesnel_Apr2018.0048',' ',180);
v48=scan48(:,9);
f48=scan48(:,2);
v48=v48./mean(v48);

scan49=dlmread('Chesnel_Apr2018.0049',' ',180);
v49=scan49(:,9);
f49=scan49(:,2);
v49=v49./mean(v49);

scan50=dlmread('Chesnel_Apr2018.0050',' ',180);
v50=scan50(:,9);
f50=scan50(:,2);
v50=v50./mean(v50);

scan51=dlmread('Chesnel_Apr2018.0051',' ',180);
v51=scan51(:,9);
f51=scan51(:,2);
v51=v51./mean(v51);

scan52=dlmread('Chesnel_Apr2018.0052',' ',180);
v52=scan52(:,9);
f52=scan52(:,2);
v52=v52./mean(v52);

scan53=dlmread('Chesnel_Apr2018.0053',' ',180);
v53=scan53(:,9);
f53=scan53(:,2);
v53=v53./mean(v53);

scan54=dlmread('Chesnel_Apr2018.0054',' ',180);
v54=scan54(:,9);
f54=scan54(:,2);
v54=v54./mean(v54);

scan55=dlmread('Chesnel_Apr2018.0055',' ',180);
v55=scan55(:,9);
f55=scan55(:,2);
v55=v55./mean(v55);

scan56=dlmread('Chesnel_Apr2018.0056',' ',180);
v56=scan56(:,9);
f56=scan56(:,2);
v56=v56./mean(v56);

scan57=dlmread('Chesnel_Apr2018.0057',' ',180);
v57=scan57(:,9);
f57=scan57(:,2);
v57=v57./mean(v57);

scan58=dlmread('Chesnel_Apr2018.0058',' ',180);
v58=scan58(:,9);
f58=scan58(:,2);
v58=v58./mean(v58);

scan59=dlmread('Chesnel_Apr2018.0059',' ',180);
v59=scan59(:,9);
f59=scan59(:,2);
v59=v59./mean(v59);

scan60=dlmread('Chesnel_Apr2018.0060',' ',180);
v60=scan60(:,9);
f60=scan60(:,2);
v60=v60./mean(v60);

scan61=dlmread('Chesnel_Apr2018.0061',' ',180);
v61=scan61(:,9);
f61=scan61(:,2);
v61=v61./mean(v61);

scan62=dlmread('Chesnel_Apr2018.0062',' ',180);
v62=scan62(:,9);
f62=scan62(:,2);
v62=v62./mean(v62);

scan63=dlmread('Chesnel_Apr2018.0063',' ',180);
v63=scan63(:,9);
f63=scan63(:,2);
v63=v63./mean(v63);

scan64=dlmread('Chesnel_Apr2018.0064',' ',180);
v64=scan64(:,9);
f64=scan64(:,2);
v64=v64./mean(v64);

scan65=dlmread('Chesnel_Apr2018.0065',' ',180);
v65=scan65(:,9);
f65=scan65(:,2);
v65=v65./mean(v65);

scan66=dlmread('Chesnel_Apr2018.0066',' ',180);
v66=scan66(:,9);
f66=scan66(:,2);
v66=v66./mean(v66);

scan67=dlmread('Chesnel_Apr2018.0067',' ',180);
v67=scan67(:,9);
f67=scan67(:,2);
v67=v67./mean(v67);

scan68=dlmread('Chesnel_Apr2018.0068',' ',180);
v68=scan68(:,9);
f68=scan68(:,2);
v68=v68./mean(v68);

scan69=dlmread('Chesnel_Apr2018.0069',' ',180);
v69=scan69(:,9);
f69=scan69(:,2);
v69=v69./mean(v69);

scan70=dlmread('Chesnel_Apr2018.0070',' ',180);
v70=scan70(:,9);
f70=scan70(:,2);
v70=v70./mean(v70);

scan71=dlmread('Chesnel_Apr2018.0071',' ',180);
v71=scan71(:,9);
f71=scan71(:,2);
v71=v71./mean(v71);

scan72=dlmread('Chesnel_Apr2018.0072',' ',180);
v72=scan72(:,9);
f72=scan72(:,2);
v72=v72./mean(v72);

scan73=dlmread('Chesnel_Apr2018.0073',' ',180);
v73=scan73(:,9);
f73=scan73(:,2);
v73=v73./mean(v73);

scan74=dlmread('Chesnel_Apr2018.0074',' ',180);
v74=scan74(:,9);
f74=scan74(:,2);
v74=v74./mean(v74);

scan75=dlmread('Chesnel_Apr2018.0075',' ',180);
v75=scan75(:,9);
f75=scan75(:,2);
v75=v75./mean(v75);

scan76=dlmread('Chesnel_Apr2018.0076',' ',180);
v76=scan76(:,9);
f76=scan76(:,2);
v76=v76./mean(v76);

scan77=dlmread('Chesnel_Apr2018.0077',' ',180);
v77=scan77(:,9);
f77=scan77(:,2);
v77=v77./mean(v77);

scan78=dlmread('Chesnel_Apr2018.0078',' ',180);
v78=scan78(:,9);
f78=scan78(:,2);
v78=v78./mean(v78);

scan79=dlmread('Chesnel_Apr2018.0079',' ',180);
v79=scan79(:,9);
f79=scan79(:,2);
v79=v79./mean(v79);

scan80=dlmread('Chesnel_Apr2018.0080',' ',180);
v80=scan80(:,9);
f80=scan80(:,2);
v80=v80./mean(v80);

scan81=dlmread('Chesnel_Apr2018.0081',' ',180);
v81=scan81(:,9);
f81=scan81(:,2);
v81=v81./mean(v81);

scan82=dlmread('Chesnel_Apr2018.0082',' ',180);
v82=scan82(:,9);
f82=scan82(:,2);
v82=v82./mean(v82);

scan83=dlmread('Chesnel_Apr2018.0083',' ',180);
v83=scan83(:,9);
f83=scan83(:,2);
v83=v83./mean(v83);

scan84=dlmread('Chesnel_Apr2018.0084',' ',180);
v84=scan84(:,9);
f84=scan84(:,2);
v84=v84./mean(v84);

scan85=dlmread('Chesnel_Apr2018.0085',' ',180);
v85=scan85(:,9);
f85=scan85(:,2);
v85=v85./mean(v85);

scan86=dlmread('Chesnel_Apr2018.0086',' ',180);
v86=scan86(:,9);
f86=scan86(:,2);
v86=v86./mean(v86);

scan87=dlmread('Chesnel_Apr2018.0087',' ',180);
v87=scan87(:,9);
f87=scan87(:,2);
v87=v87./mean(v87);

scan88=dlmread('Chesnel_Apr2018.0088',' ',180);
v88=scan88(:,9);
f88=scan88(:,2);
v88=v88./mean(v88);

scan89=dlmread('Chesnel_Apr2018.0089',' ',180);
v89=scan89(:,9);
f89=scan89(:,2);
v89=v89./mean(v89);

scan90=dlmread('Chesnel_Apr2018.0090',' ',180);
v90=scan90(:,9);
f90=scan90(:,2);
v90=v90./mean(v90);

scan91=dlmread('Chesnel_Apr2018.0091',' ',180);
v91=scan91(:,9);
f91=scan91(:,2);
v91=v91./mean(v91);

scan92=dlmread('Chesnel_Apr2018.0092',' ',180);
v92=scan92(:,9);
f92=scan92(:,2);
v92=v92./mean(v92);

scan93=dlmread('Chesnel_Apr2018.0093',' ',180);
v93=scan93(:,9);
f93=scan93(:,2);
v93=v93./mean(v93);

scan94=dlmread('Chesnel_Apr2018.0094',' ',180);
v94=scan94(:,9);
f94=scan94(:,2);
v94=v94./mean(v94);

scan95=dlmread('Chesnel_Apr2018.0095',' ',180);
v95=scan95(:,9);
f95=scan95(:,2);
v95=v95./mean(v95);

scan96=dlmread('Chesnel_Apr2018.0096',' ',180);
v96=scan96(:,9);
f96=scan96(:,2);
v96=v96./mean(v96);

scan97=dlmread('Chesnel_Apr2018.0097',' ',180);
v97=scan97(:,9);
f97=scan97(:,2);
v97=v97./mean(v97);

scan98=dlmread('Chesnel_Apr2018.0098',' ',180);
v98=scan98(:,9);
f98=scan98(:,2);
v98=v98./mean(v98);

scan99=dlmread('Chesnel_Apr2018.0099',' ',180);
v99=scan99(:,9);
f99=scan99(:,2);
v99=v99./mean(v99);

scan100=dlmread('Chesnel_Apr2018.0100',' ',180);
v100=scan100(:,9);
f100=scan100(:,2);
v100=v100./mean(v100);

scan101=dlmread('Chesnel_Apr2018.0101',' ',180);
v101=scan101(:,9);
f101=scan101(:,2);
v101=v101./mean(v101);

scan102=dlmread('Chesnel_Apr2018.0102',' ',180);
v102=scan102(:,9);
f102=scan102(:,2);
v102=v102./mean(v102);

scan103=dlmread('Chesnel_Apr2018.0103',' ',180);
v103=scan103(:,9);
f103=scan103(:,2);
v103=v103./mean(v103);

scan104=dlmread('Chesnel_Apr2018.0104',' ',180);
v104=scan104(:,9);
f104=scan104(:,2);
v104=v104./mean(v104);

scan105=dlmread('Chesnel_Apr2018.0105',' ',180);
v105=scan105(:,9);
f105=scan105(:,2);
v105=v105./mean(v105);

scan106=dlmread('Chesnel_Apr2018.0106',' ',180);
v106=scan106(:,9);
f106=scan106(:,2);
v106=v106./mean(v106);

scan107=dlmread('Chesnel_Apr2018.0107',' ',180);
v107=scan107(:,9);
f107=scan107(:,2);
v107=v107./mean(v107);

scan108=dlmread('Chesnel_Apr2018.0108',' ',180);
v108=scan108(:,9);
f108=scan108(:,2);
v108=v108./mean(v108);

scan109=dlmread('Chesnel_Apr2018.0109',' ',180);
v109=scan109(:,9);
f109=scan109(:,2);
v109=v109./mean(v109);

scan110=dlmread('Chesnel_Apr2018.0110',' ',180);
v110=scan110(:,9);
f110=scan110(:,2);
v110=v110./mean(v110);

figure
plot(f109,v109,f110,v110)%,f109,v109,f110,v110);
legend('109','110')


% figure;
% plot(f93,v93,f95,v95,f96,-v96+2*ones(size(v96)))
% legend('93','95','96')


% figure;
% plot(f90,v90,f91,v91,f92,v92,f93,v93);
% legend('90','91','92','93');

% figure;
% plot(f83,v83,f84,v84,f85,v85,f86,v86,f87,v87,f88,v88)
% legend('83','84','85','86','87')
% 
% figure;
% plot(f83,v83,f86,v86,f50,v50,f48,v48,f88,v88);
% legend('83','86','50','48','88')
% 
% figure;
% plot(f83,v83,f86,v86,f88,v88);
% legend('83','86','88')

% % figure;
% % plot(f57,v57,f58,v58,f59,v59,f60,v60,f61,v61,f62,v62,f63,v63,f64,v64,f65,v65)
% % legend('57','58','59','60','61','62','63','64','65')

% figure;
% plot(f57,v57,f58,v58,f59,v59,f60,v60,f61,v61,f62,v62)
% legend('57','58','59','60','61','62','63','64','65')

% figure;
% plot(f63,v63)
% title('63')

% figure;
% plot(f40,v40,f64,v64,f65,v65,f66,v66,f67,v67,f68,v68)
% legend('40','64','65','66','67','68')

% figure;
% plot(f69,v69,'k',f71,v71,f73,v73,f74,v74,f75,v75,f76,v76,f77,v77,f78,v78,f79,v79,f80,v80)
% legend('69','71','73','74','75','76','77','78','79','80')
% 
% figure;
% plot(f69,v69,f71,v71,f79,v79,f80,v80,f81,v81,f82,v82)
% legend('69','71','79','80')

vavg=(v93+v95)/2;

% figure;
% plot(f58,vavg)


v=v96;
f=f96;

start=floor(size(v,1)/2-(9/100)*size(v,1));
stop=floor(size(v,1)/2+(9/100)*size(v,1));
fpart1=f(start:stop);
vpart1=v(start:stop);
[c,~]=fit(fpart1,vpart1,'poly1');c=coeffvalues(c);
R0right=c(1);
offsetRight=c(2);


start=1;
stop=(9/100)*size(v,1);
fpart2=[f(start:stop);f(end-stop-start:end)];
vpart2=[v(start:stop);v(end-start-stop:end)];
[c,~]=fit(fpart2,vpart2,'poly1');c=coeffvalues(c);
R0left=c(1);
offsetLeft=c(2);

% figure;
% plot(fpart2,vpart2,'b',fpart1,vpart1,'b',f,v,'g:')

R0=(R0right+R0left)/2;
offset=(offsetRight+offsetLeft)/2;



%linear correction plot
% vladj=v-(R0*f+offset*ones(size(v))); 
% figure; 
% plot(f,vladj);
% legend('adjusted')
% title(['R0= ' num2str(R0)]);

vavg=(v38+v37+v36+v35+v39+v40)./3;

% figure;
% plot(f40,v40,f41,v41,f42,v42,f43,v43,f44,v44,f45,v45,f46,v46,f47,v47,f48,v48,f49,v49,f50,v50)
% legend('40','41','42','43','44','45','46','47','48','49','50')
% title('plot of 40-50')
% 
% figure;
% plot(f40,v40,f47,v47,f48,v48,f49,v49,f50,v50)
% legend('40','47','48','49','50')
% title('selected plot of 40-50')

vavg=(v49+v50)/2;

%49-50 avg plot
% figure;
% plot(f50,vavg)
% title('average of 49 & 50')

start=size(vavg,1)/2-(12/100)*size(vavg,1);
stop=size(vavg,1)/2+(12/100)*size(vavg,1);
fpart=f50(start:stop);
vpart=vavg(start:stop);
[c,~]=fit(fpart,vpart,'poly1');c=coeffvalues(c);
R0right=c(1);
offsetRight=c(2);

start=1;
stop=(12/100)*size(vavg,1);
fpart=[f50(start:stop);f50(end-stop-start:end)];
vpart=[vavg(start:stop);vavg(end-start-stop:end)];
[c,~]=fit(fpart,vpart,'poly1');c=coeffvalues(c);
R0left=c(1);
offsetLeft=c(2);


R0=(R0right+R0left)/2;
offset=(offsetRight+offsetLeft)/2;



%linear correction plot
% vadj=vavg-(R0*f50+offset*ones(size(vavg))); 
% figure; 
% plot(f50,vadj); 
% title(['R0= ' num2str(R0)]);

%Graphs of all scans (25-50)    
% figure;
% plot(f25,v25,f26,v26,f27,v27,f28,v28,f29,v29,f30,v30,f31,v31,f32,v32,f33,v33,f34,v34,f35,v35,f36,v36,f37,v37,f38,v38,f39,v39,f40,v40,f41,v41,f42,v42,f43,v43,f44,v44,f45,v45,f46,v46,f47,v47,f48,v48,f50,v50);
% %legend('25','26','27','28','29','30','31','32','33','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50')
% 
%plots of good (not-noisy) scans
% figure;
% plot(f37,v37,f38,v38,f39,v39,f40,v40,f41,v41,f42,v42,f43,v43,f44,v44,f46,v46,f47,v47,f48,v48,f50,v50);
% 
% 
