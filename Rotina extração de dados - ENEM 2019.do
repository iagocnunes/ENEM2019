clear all
set more off
set dp comma
import delimited "C:\Users\IJSN\Desktop\DRS - DIAGNÓSTICO\Enem 2019\DADOS\MICRODADOS_ENEM_2019.csv", delimiter(";")
gen one = 1
keep if co_uf_residencia == 32
sum one
gen Concl2018 = 1 if tp_st_conclusao==1 & tp_ano_concluiu==1
sum Concl2018
tab tp_st_conclusao
tab in_treineiro if Concl2018==1
tab in_treineiro tp_st_conclusao
keep if Concl2018==1 | tp_st_conclusao==2
sum one
tab tp_presenca_cn, m
tab tp_presenca_ch, m
tab tp_presenca_lc, m
tab tp_presenca_mt, m
drop if tp_presenca_cn!=1 | tp_presenca_ch!=1 | tp_presenca_lc!=1 | tp_presenca_mt!=1
sum one
table co_municipio_residencia q006, m
table co_municipio_residencia tp_sexo, m
table co_municipio_residencia tp_cor_raca, m
table co_municipio_residencia tp_ensino, m

gen microrreg = ""
replace microrreg = "Caparao" if co_municipio_residencia==3200201 | co_municipio_residencia==3201100 | co_municipio_residencia==3201803 | co_municipio_residencia==3202009 | co_municipio_residencia==3202306 | co_municipio_residencia==3202454 | co_municipio_residencia==3202553 | co_municipio_residencia==3202652 | co_municipio_residencia==3203007 | co_municipio_residencia==3203106 | co_municipio_residencia==3203700 | co_municipio_residencia==3204807
replace microrreg = "Central Serrana" if co_municipio_residencia==3202702 | co_municipio_residencia==3202900 | co_municipio_residencia==3204500 | co_municipio_residencia==3204559 | co_municipio_residencia==3204609
replace microrreg = "Central Sul" if co_municipio_residencia==3200508 | co_municipio_residencia==3200706 | co_municipio_residencia==3201209 | co_municipio_residencia==3201407 | co_municipio_residencia==3203403 | co_municipio_residencia==3203809 | co_municipio_residencia==3205036
replace microrreg = "Centro-Oeste" if co_municipio_residencia==3200359 | co_municipio_residencia==3200805 | co_municipio_residencia==3201506 | co_municipio_residencia==3202256 | co_municipio_residencia==3203353 | co_municipio_residencia==3204005 | co_municipio_residencia==3204658 | co_municipio_residencia==3204708 | co_municipio_residencia==3204955 | co_municipio_residencia==3205176 
replace microrreg = "Litoral Sul" if co_municipio_residencia==3200300 | co_municipio_residencia==3200409 | co_municipio_residencia==3202603 | co_municipio_residencia==3202801 | co_municipio_residencia==3203320 | co_municipio_residencia==3204203 | co_municipio_residencia==3204302| co_municipio_residencia==3204401
replace microrreg = "Metropolitana" if co_municipio_residencia==3201308 | co_municipio_residencia==3202207 | co_municipio_residencia==3202405 | co_municipio_residencia==3205002 | co_municipio_residencia==3205101 | co_municipio_residencia==3205200 | co_municipio_residencia==3205309
replace microrreg = "Nordeste" if co_municipio_residencia==3201001 | co_municipio_residencia==3201605 | co_municipio_residencia==3203056 | co_municipio_residencia==3203502 | co_municipio_residencia==3203601 | co_municipio_residencia==3204054 | co_municipio_residencia==3204104 | co_municipio_residencia==3204252 | co_municipio_residencia==3204906
replace microrreg = "Noroeste" if co_municipio_residencia==3200136 | co_municipio_residencia==3200169 | co_municipio_residencia==3200904 | co_municipio_residencia==3202108 | co_municipio_residencia==3203304 | co_municipio_residencia==3203908 | co_municipio_residencia==3205150 
replace microrreg = "Rio Doce" if co_municipio_residencia==3200607 | co_municipio_residencia==3202504 | co_municipio_residencia==3203130 | co_municipio_residencia==3203205 | co_municipio_residencia==3204351 | co_municipio_residencia==3205010
replace microrreg = "Sudoeste Serrana" if co_municipio_residencia==3200102 | co_municipio_residencia==3201159 | co_municipio_residencia==3201704 | co_municipio_residencia==3201902 | co_municipio_residencia==3203163 | co_municipio_residencia==3203346 | co_municipio_residencia==3205069

mean nu_nota_mt
mean nu_nota_lc
mean nu_nota_cn
mean nu_nota_ch
mean nu_nota_redacao
mean nu_nota_mt if q006=="A" | q006=="B" | q006=="C"
mean nu_nota_lc if q006=="A" | q006=="B" | q006=="C"
mean nu_nota_cn if q006=="A" | q006=="B" | q006=="C"
mean nu_nota_ch if q006=="A" | q006=="B" | q006=="C"
mean nu_nota_redacao if q006=="A" | q006=="B" | q006=="C"
mean nu_nota_mt if q006=="Q" | q006=="P" | q006=="O"
mean nu_nota_lc if q006=="Q" | q006=="P" | q006=="O"
mean nu_nota_cn if q006=="Q" | q006=="P" | q006=="O"
mean nu_nota_ch if q006=="Q" | q006=="P" | q006=="O"
mean nu_nota_redacao if q006=="Q" | q006=="P" | q006=="O"

mean nu_nota_mt, over(co_municipio_residencia)
mean nu_nota_lc, over(co_municipio_residencia)
mean nu_nota_cn, over(co_municipio_residencia)
mean nu_nota_ch, over(co_municipio_residencia)
mean nu_nota_redacao, over(co_municipio_residencia)
mean nu_nota_mt if q006=="A" | q006=="B" | q006=="C", over(co_municipio_residencia)
mean nu_nota_lc if q006=="A" | q006=="B" | q006=="C", over(co_municipio_residencia)
mean nu_nota_cn if q006=="A" | q006=="B" | q006=="C", over(co_municipio_residencia)
mean nu_nota_ch if q006=="A" | q006=="B" | q006=="C", over(co_municipio_residencia)
mean nu_nota_redacao if q006=="A" | q006=="B" | q006=="C", over(co_municipio_residencia)
mean nu_nota_mt if q006=="Q" | q006=="P" | q006=="O", over(co_municipio_residencia)
mean nu_nota_lc if q006=="Q" | q006=="P" | q006=="O", over(co_municipio_residencia)
mean nu_nota_cn if q006=="Q" | q006=="P" | q006=="O", over(co_municipio_residencia)
mean nu_nota_ch if q006=="Q" | q006=="P" | q006=="O", over(co_municipio_residencia)
mean nu_nota_redacao if q006=="Q" | q006=="P" | q006=="O", over(co_municipio_residencia)

bys microrreg: egen meanMT = mean(nu_nota_mt)
tab microrreg meanMT, m
bys microrreg: egen meanLC = mean(nu_nota_lc)
tab microrreg meanLC, m
bys microrreg: egen meanCN = mean(nu_nota_cn)
tab microrreg meanCN, m
bys microrreg: egen meanCH = mean(nu_nota_ch)
tab microrreg meanCH, m
bys microrreg: egen meanRED = mean(nu_nota_redacao)
tab microrreg meanRED, m

*********** por sexo **************
mean nu_nota_mt if tp_sexo=="M", over(co_municipio_residencia)
mean nu_nota_lc if tp_sexo=="M", over(co_municipio_residencia)
mean nu_nota_cn if tp_sexo=="M", over(co_municipio_residencia)
mean nu_nota_ch if tp_sexo=="M", over(co_municipio_residencia)
mean nu_nota_redacao if tp_sexo=="M", over(co_municipio_residencia)
mean nu_nota_mt if tp_sexo=="F", over(co_municipio_residencia)
mean nu_nota_lc if tp_sexo=="F", over(co_municipio_residencia)
mean nu_nota_cn if tp_sexo=="F", over(co_municipio_residencia)
mean nu_nota_ch if tp_sexo=="F", over(co_municipio_residencia)
mean nu_nota_redacao if tp_sexo=="F", over(co_municipio_residencia)

bys microrreg: egen meanMT_masc = mean(nu_nota_mt) if tp_sexo=="M"
tab microrreg meanMT_masc, m
bys microrreg: egen meanLC_masc = mean(nu_nota_lc) if tp_sexo=="M"
tab microrreg meanLC_masc, m
bys microrreg: egen meanCN_masc = mean(nu_nota_cn) if tp_sexo=="M"
tab microrreg meanCN_masc, m
bys microrreg: egen meanCH_masc = mean(nu_nota_ch) if tp_sexo=="M"
tab microrreg meanCH_masc, m
bys microrreg: egen meanRED_masc = mean(nu_nota_redacao) if tp_sexo=="M"
tab microrreg meanRED_masc, m

bys microrreg: egen meanMT_fem = mean(nu_nota_mt) if tp_sexo=="F"
tab microrreg meanMT_fem, m
bys microrreg: egen meanLC_fem = mean(nu_nota_lc) if tp_sexo=="F"
tab microrreg meanLC_fem, m
bys microrreg: egen meanCN_fem = mean(nu_nota_cn) if tp_sexo=="F"
tab microrreg meanCN_fem, m
bys microrreg: egen meanCH_fem = mean(nu_nota_ch) if tp_sexo=="F"
tab microrreg meanCH_fem, m
bys microrreg: egen meanRED_fem = mean(nu_nota_redacao) if tp_sexo=="F"
tab microrreg meanRED_fem, m

********* por raça **********
mean nu_nota_mt if tp_cor_raca==1, over(co_municipio_residencia)
mean nu_nota_lc if tp_cor_raca==1, over(co_municipio_residencia)
mean nu_nota_cn if tp_cor_raca==1, over(co_municipio_residencia)
mean nu_nota_ch if tp_cor_raca==1, over(co_municipio_residencia)
mean nu_nota_redacao if tp_cor_raca==1, over(co_municipio_residencia)
mean nu_nota_mt if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5, over(co_municipio_residencia)
mean nu_nota_lc if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5, over(co_municipio_residencia)
mean nu_nota_cn if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5, over(co_municipio_residencia)
mean nu_nota_ch if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5, over(co_municipio_residencia)
mean nu_nota_redacao if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5, over(co_municipio_residencia)

bys microrreg: egen meanMT_bran = mean(nu_nota_mt) if tp_cor_raca==1
tab microrreg meanMT_bran, m
bys microrreg: egen meanLC_bran = mean(nu_nota_lc) if tp_cor_raca==1
tab microrreg meanLC_bran, m
bys microrreg: egen meanCN_bran = mean(nu_nota_cn) if tp_cor_raca==1
tab microrreg meanCN_bran, m
bys microrreg: egen meanCH_bran = mean(nu_nota_ch) if tp_cor_raca==1
tab microrreg meanCH_bran, m
bys microrreg: egen meanRED_bran = mean(nu_nota_redacao) if tp_cor_raca==1
tab microrreg meanRED_bran, m

bys microrreg: egen meanMT_nb = mean(nu_nota_mt) if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5
tab microrreg meanMT_nb, m
bys microrreg: egen meanLC_nb = mean(nu_nota_lc) if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5
tab microrreg meanLC_nb, m
bys microrreg: egen meanCN_nb = mean(nu_nota_cn) if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5
tab microrreg meanCN_nb, m
bys microrreg: egen meanCH_nb = mean(nu_nota_ch) if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5
tab microrreg meanCH_nb, m
bys microrreg: egen meanRED_nb = mean(nu_nota_redacao) if tp_cor_raca==2 | tp_cor_raca==3 | tp_cor_raca==4 | tp_cor_raca==5
tab microrreg meanRED_nb, m


* média do Leonardo Da Vinci, para verificar se batem os valores extraidos com os divulgados
mean nu_nota_mt if co_escola==32040032
mean nu_nota_lc if co_escola==32040032
mean nu_nota_ch if co_escola==32040032
mean nu_nota_cn if co_escola==32040032



