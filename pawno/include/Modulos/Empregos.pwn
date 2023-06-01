#include <YSI_Coding\y_hooks>

#define PATH "SalveINFO"  //PASTA que vai as infos
#define yMP_SegsPegarServ  15
#define DG_Central_Menu	   500
#define DG_Prox_Serv       DG_Central_Menu+1

#define yMP_TLP_Eletrec       5                       //Tempo para terminar o serviço
#define yMP_VAlor_Eletrc    0.4                     //Defina o valor que o Eletricista vai receber (Distancia * 0.4 ) Tipo: 1700KM * 0.4
#define yMP_TLP_Correio     5                       //Tempo para terminar o serviço
#define yMP_VAlor_Correio   0.35                     //Defina o valor que o Eletricista vai receber (Distancia * 0.4 ) Tipo: 1700KM * 0.4
#define yMP_TLP_Carreter     3                       //Tempo para terminar o serviço
#define yMP_VAlor_Carreter   0.7                     //Defina o valor que o Eletricista vai receber (Distancia * 0.4 ) Tipo: 1700KM * 0.4
#define yMP_TLP_CarFort     3                       //Tempo para terminar o serviço
#define yMP_VAlor_CarFort   0.7                     //Defina o valor que o Eletricista vai receber (Distancia * 0.4 ) Tipo: 1700KM * 0.4
#define yMP_TLP_Prancheiro     3                       //Tempo para terminar o serviço
#define yMP_VAlor_Prancheiro   0.7                     //Defina o valor que o Eletricista vai receber (Distancia * 0.4 ) Tipo: 1700KM * 0.4
#define yMP_TLP_Lenhador     5                       //Tempo para terminar o serviço
#define yMP_VAlor_Lenhador    3.0                     //Defina o valor que o Eletricista vai receber (Distancia * 0.4 ) Tipo: 1700KM * 0.4
#define yMP_TLP_Lixeiro     5                       //Tempo para terminar o serviço
#define yMP_VAlor_Lixeiro   0.2                     //Defina o valor que o Eletricista vai receber (Distancia * 0.4 ) Tipo: 1700KM * 0.4
#define yMP_QntColetLixeir  5                       //Qnt de coletas q vai fazer até volta e desvaziar o caminhao

new yMP_Emprego[MAX_PLAYERS],
    yMP_Infos[MAX_PLAYERS],
	yMP_Carro[MAX_PLAYERS],
	yMP_Bau[MAX_PLAYERS],
	yMP_Skin[MAX_PLAYERS],
	yMP_PegouServ[MAX_PLAYERS],
	yMP_KillTimer[MAX_PLAYERS],
	yMP_AddQntLP[MAX_PLAYERS],
	yMP_Objs[4][MAX_PLAYERS],
	yMP_Valor[MAX_PLAYERS],
	yMP_TempPegar[MAX_PLAYERS],
	Float:yMP_Pos[3][MAX_PLAYERS],
	yMPStr[128],StrGeral[1000]
;
static const Float:yMP_PsStrLixeiro[] ={//POSIÇÃO INICIAL
2047.0392,-1986.8513,13.5469
};
static const Float:yMP_PosC_Lixeiro[][] ={//POSIÇÕES DOS CARROS DE SPAWN
{2080.0605,-2032.7410,14.0924,272.3473},
{2079.4646,-2020.0693,14.1114,270.7017},
{2079.4841,-2006.7107,14.0921,270.2325}
};
static const Float:yMP_PosR_Lixeiro[][] ={
{-1981.6472,167.0605,27.6875,272.1788}, // lixeira
{-2327.8157,-181.5110,35.3203,183.2692}, // lixeira
{-2243.8760,659.5619,49.4453,90.0435}, // lixeira
{-2627.5813,1407.0344,7.0938,249.3016}, // lixeira
{-1549.1837,1017.0623,7.1875,93.1634}, // lixeira
{-1549.1008,482.1907,7.1875,56.7016}, // lixeira
{-2109.3474,-387.3995,35.3359,355.5665}, // lixeira
{-2019.6099,-41.4883,35.3363,182.7000}, // lixeira
{-2087.8677,745.2702,69.5625,186.1065}, // lixeira
{-1960.2692,1188.3480,45.4453,183.5258}, // lixeira
{363.1139,-1766.1265,5.4630,172.1481}, // lixeira
{1333.9841,-1360.2643,13.5469,271.4921}, // lixeira
{1233.3933,-741.9044,96.1531,22.0698}, // lixeira
{309.1299,-1199.7036,76.0947,218.0978}, // lixeira
{1730.8406,-1865.2687,13.5728,2.8923}, // lixeira
{2176.0579,-1762.8571,13.5524,327.6984}, // lixeira
{2481.8406,-1650.5349,13.4688,183.2514}, // lixeira
{2633.9570,-1243.8157,50.0148,268.1204}, // lixeira
{2575.0859,-1053.2290,69.7732,4.4030}, // lixeira
{1698.0043,-1431.9432,13.5469,178.9169}, // lixeira
{2035.6086,1023.7529,10.8203,267.8816}, // lixeira
{2180.3904,1696.8010,11.0567,154.8191}, // lixeira
{2241.5581,2421.1401,10.8203,182.2315}, // lixeira
{1976.3964,2751.1487,10.8203,175.7574}, // lixeira
{2598.8027,1051.6316,10.8125,273.5186}, // lixeira
{898.6940,1984.2214,10.8203,269.0994}, // lixeira
{2173.3584,2161.3965,10.8203,176.7400}, // lixeira
{2537.3291,2170.1211,10.8125,98.1674}, // lixeira
{1726.3420,1619.6322,9.7891,257.9416}, // lixeira
{2435.1272,689.0420,10.8203,93.7410}, // lixeira
/*{2092.5015,-2010.2814,13.5544,184.6382}, // 1
{2099.5388,-2017.3794,13.5544,223.6028}, // 1
{2105.4226,-2023.5339,13.5469,223.6028}, // 1*/
{2069.5110,-1985.3040,13.5469,71.6645}// entregar (DESCARREGAR O CAMINHAO)
};
static const Float:yMP_PsStrLenhador[] ={
    -757.7338,-129.0488,65.7964
};
static const Float:yMP_PosC_Lenhador[][] ={//POSIÇÕES DOS CARROS DE SPAWN ELETRICISTA
{-738.9902,-118.4339,67.6217,18.1849} // car
};
static const Float:yMP_PosR_Lenhad[][] ={
{-673.2883,-187.7297,64.4525,206.8091}, // arvore
{-668.2842,-203.4476,67.9687,203.0491}, // arvore
{-655.7604,-199.4356,68.6855,268.2230}, // arvore
{-658.0467,-182.5992,63.6371,169.8354}, // arvore
{-645.8641,-186.1915,65.9200,246.9161}, // arvore
{-651.9772,-197.5850,68.7426,151.9752}, // arvore
{-652.6773,-214.1584,67.1991,178.9221}, // arvore
{-639.6332,-260.2166,64.5219,222.9821}, // arvore
{-628.7411,-250.1729,63.4989,194.2755}, // arvore
{-627.0770,-265.4133,65.3363,195.8422}, // arvore
{-714.7087,-224.9295,63.1157,154.4818}, // arvore
{-747.4214,-263.8153,56.7831,108.7347}, // arvore
{-756.0074,-272.6002,56.7134,128.1616}, // arvore
{-758.9304,-256.8016,53.0451,148.2151}, // arvore
{-856.4041,-202.1136,66.2524,83.6444}, // arvore
{-870.6253,-213.4603,64.9421,123.4381}, // arvore
{-873.7822,-203.0317,66.1036,23.4838}, // arvore
{-862.1386,-192.2192,66.1736,31.0040}, // arvore
{-873.8752,-180.8453,66.1033,39.7774}, // arvore
{-884.3760,-191.5258,66.0725,126.8849}, // arvore
{-885.8441,-209.6373,66.0682,151.0118}, // arvore
{-930.3773,-135.1693,56.0912,35.0773}, // arvore
{-933.3326,-119.7483,58.1190,31.3173}, // arvore
{-902.1616,-118.4162,56.7289,0.5870}, // arvore
{-929.6451,-133.6148,56.4855,83.6211}, // arvore
{-856.0921,-74.9747,48.5234,331.7601}, // arvore
{-844.1154,-64.6571,45.2782,0.2738}, // arvore
{-821.8376,-72.9147,55.4865,284.7363}, // arvore
{-805.0317,-56.7760,51.4637,313.2499}, // arvore
{-770.5891,-73.8609,66.2599,244.9427}, // arvore
{-762.0801,-65.8233,64.9035,304.7899}, // arvore
{-771.6562,-59.7202,60.7825,56.9643}, // arvore
{-768.8286,-51.1008,56.9572,338.6302}, // arvore
{-762.3685,-40.5435,54.4542,336.4369}, // arvore
{-754.6420,-46.9863,57.4951,228.3358}, // arvore
{-743.7686,-45.7487,61.2247,273.1429}, // arvore
{-724.7006,-31.3550,62.2420,296.5706}, // arvore
{-697.6674,-24.7154,69.2670,298.8364}, // arvore
{-631.5077,-87.0084,65.0848,249.3293}, // arvore
{-638.6720,-99.2812,64.0987,147.4950}, // arvore
{-640.6629,-117.1077,63.7289,168.4885}, // arvore
{-628.3587,-122.2500,65.8641,242.7493}, // arvore
{-623.8438,-156.7956,69.5527,180.0820}, // arvore
{-612.7750,-162.1547,73.4237,230.5291}, // arvore
{-612.2987,-149.9776,72.9141,15.2904}, // arvore
{-770.3059,-75.0082,66.6045,316.3363}, // arvore
{-760.9447,-64.0405,64.2860,114.2345}, // arvore
{-771.6288,-59.6918,60.7746,72.2474}, // arvore
{-817.5411,-72.9051,55.9120,86.9742}, // arvore
{-803.3320,-56.8127,51.9874,313.1796}, // arvore
{-763.1293,-40.1432,54.1161,313.8063}, // arvore
{-799.7225,-16.9192,44.8436,346.9966}, // arvore
{-855.2325,-28.1666,39.2271,92.2542}, // arvore
{-861.5398,-23.5735,36.1338,58.1006}, // arvore
{-865.7008,-32.1988,38.3633,151.7881}, // arvore
{-557.9451,-210.7429,78.4047,83.0976}, // arvore
{-555.0657,-220.6882,76.5284,194.9587}, // arvore
{-534.5321,-215.6210,78.4063,279.8728}, // arvore
{-532.2278,-228.2584,75.1988,218.4589}, // arvore
{-514.6299,-237.1011,70.3623,157.3583}, // arvore
{-517.0999,-224.5275,75.5360,37.3739}, // arvore
{-515.2770,-211.0805,78.4063,354.7602}, // arvore
{-500.8570,-214.5212,78.4063,267.3394}, // arvore
{-504.6105,-227.9384,73.7172,190.8853}, // arvore
{-464.2224,-223.6301,74.6959,224.0989}, // arvore
{-449.4835,-227.3772,69.2299,250.1059}, // arvore
{-451.0216,-216.0537,75.9804,351.3134}, // arvore
{-460.9478,-207.9518,77.9453,34.8672}, // arvore
{-452.1237,-193.8358,76.8022,286.4528}, // arvore
{-440.3598,-202.4274,74.5203,228.4856}, // arvore
{-434.4675,-213.2811,71.8544,219.0856}, // arvore
{-404.5129,-213.1126,62.1942,282.0662}, // arvore
{-405.7877,-198.2533,65.9731,359.2194}, // arvore
{-392.5910,-205.1615,61.3735,238.8257}, // arvore
{-386.7965,-219.9167,58.6808,211.2521}, // arvore
{-378.3699,-214.4326,58.4143,307.1330}, // arvore
{-372.4715,-198.9073,59.3804,335.9599}, // arvore
{-412.0095,-148.5511,66.5858,332.5132}, // arvore
{-401.0695,-151.1074,61.1325,261.0726}, // arvore
{-401.3819,-138.2353,58.7305,345.6734}, // arvore
{-401.0241,-106.8568,50.4854,197.3928}, // arvore
{-389.2715,-99.2873,47.8937,309.3264}, // arvore
{-385.0007,-86.0240,45.8629,352.9527}, // arvore
{-370.1114,-90.3503,46.0478,254.1792}, // arvore
{-373.8008,-102.9182,48.0719,161.1183}, // arvore
{-382.3921,-112.1436,50.1137,139.8115}, // arvore
{-436.0085,-28.0162,56.9865,313.3764}, // arvore
{-445.2998,-22.6976,56.2679,64.9241}, // arvore
{-436.9118,-13.7520,54.1199,319.0165}, // arvore
{-450.2334,-5.9954,54.1829,14.7904}, // arvore
{-440.0358,1.2086,52.8814,307.1097}, // arvore
{-447.3109,8.5920,52.1246,16.3571}, // arvore
{-436.3255,19.4030,51.5330,355.0502}, // arvore
{-429.0553,43.6165,45.4457,334.3700}, // arvore
{-447.2702,27.7237,49.4164,128.5314}, // arvore
{-462.3027,25.3482,49.2744,116.3113}, // arvore
{-418.8398,72.1066,33.2755,322.1733}, // arvore
{-407.5881,69.3848,35.8477,253.8660}, // arvore
{-408.2261,82.3865,29.2521,340.0335}, // arvore
{-503.4453,94.6147,29.3509,69.6477}, // arvore
{-489.5711,66.5743,36.3554,199.3689}, // arvore
{-516.7060,67.0513,34.8374,52.4142}, // arvore
{-516.6709,178.0400,10.8914,6.9336}, // arvore
{-529.4413,175.5651,12.9029,95.6078}, // arvore
{-527.2520,188.6077,11.3433,342.4934}, // arvore
{-538.6760,190.7162,12.3133,80.8810}, // arvore
{-537.7742,206.1538,12.0840,2.5469}, // arvore
{-525.0620,205.2139,11.5300,275.1261}, // arvore
{-513.8903,199.0003,10.4484,245.0458}, // arvore
{-580.6841,243.3621,20.3850,61.1174}, // arvore
{-617.1906,221.2647,23.5813,108.1178}, // arvore
{-616.5723,70.6182,43.0922,160.1317}, // arvore
{-615.9836,55.2008,48.2368,170.7851}, // arvore
{-627.1386,57.7498,48.8119,75.8442}, // arvore
{-572.5368,-30.7161,64.3876,192.3820}, // arvore
{-575.3712,-21.2366,63.9001,17.2270}, // arvore
{-587.2943,-11.4490,63.2293,34.4605}, // arvore
{-597.4612,-20.7682,63.4061,135.6681}, // arvore
{-589.6563,-29.4803,64.1561,192.3820}, // arvore
{-598.8702,-39.4706,63.5762,138.8015}, // arvore
{-757.7338,-129.0488,65.7964}//POSIÇÃO ENTREGAR
};

static const Float:yMP_PsStrPrancheiro[] ={//POSIÇÃO INICIAL
2093.3547,-2078.4580,13.5469
};
static const Float:yMP_PosC_Prancheiro[][] ={//POSIÇÕES DOS CARROS DE SPAWN
{2117.7400,-2078.6091,14.1771,135.6806},
{2125.2285,-2086.4902,14.1705,134.8680},
{2132.4265,-2093.5945,14.1715,134.6762}
};
static const Float:yMP_PosR_Prancheiro[][] ={
{481.8798,-533.1766,25.5296,256.0565},// carga
{-2139.7310,-180.3157,35.3203,177.0255},// carga
{-1821.3174,-81.7542,15.1094,179.1722},// carga
{-1720.5210,56.7590,3.5547,46.9443},// carga
{1695.0499,690.5346,10.8203,178.7420},// carga
{2872.4399,931.4164,10.7500,282.7463},// carga
{2352.6370,2816.8206,10.8203,356.6763},// carga
{2250.4446,2794.1311,10.8203,2.2316},// carga
{1035.7424,2143.2773,10.8203,95.2224},// carga
{135.6704,-245.9890,1.5781,267.3418},// carga
{2086.5173,-2091.0735,13.5469} // entregar (DEPOSITO CENTRAL)
};
static const Float:yMP_PsStrCarFort[] ={//POSIÇÃO INICIAL
1462.9771,-1023.2766,23.8331
};
static const Float:yMP_PosC_CarFort[][] ={//POSIÇÕES DOS CARROS DE SPAWN
{1440.0261,-1029.3130,23.8598,267.4065},
{1449.4747,-1029.1536,23.8589,271.2436},
{1458.6569,-1029.0286,23.8608,269.2950},
{1467.8889,-1028.9772,23.8601,269.0885}
};
static const Float:yMP_PosR_CarFort[][] ={
{1933.1891,-1781.5945,13.3828,180.7111}, // carro forte
{1362.4945,-1282.5206,13.3828,177.8443}, // carro forte
{1348.9617,-1754.6143,13.3545,269.1442}, // carro forte
{1479.2872,-1737.3467,13.5469,268.6174}, // carro forte
{1536.8224,-1671.1075,13.3828,178.4817}, // carro forte
{1826.4287,-1680.9351,13.3828,177.1077}, // carro forte
{2244.9319,-1660.8995,15.4690,253.8938}, // carro forte
{2116.2571,902.5782,10.8203,90.8582}, // carro forte
{2038.6432,1004.4513,10.6719,359.4625}, // carro forte
{1998.7284,1243.2778,10.8130,89.5982}, // carro forte
{2221.6233,1839.7885,10.8203,184.7588}, // carro forte
{2154.9038,2054.8733,10.6719,356.1835}, // carro forte
{2156.0461,2171.2361,10.6719,358.2710}, // carro forte
{2094.5940,2221.0520,10.8203,89.5322}, // carro forte
{2361.6919,2069.2295,10.6719,176.1784}, // carro forte
{2339.8584,2159.9441,10.7266,344.4760}, // carro forte
{2411.2363,2132.6196,10.6719,274.8148}, // carro forte
{-1970.3262,284.6496,35.1719,159.1194}, // carro forte
{-1883.3494,834.6958,35.0078,274.2083}, // carro forte
{-1775.5508,856.5552,24.7344,265.6058}, // carro forte
{-1970.4480,1117.2413,53.3462,182.4131}, // carro forte
{-1676.8243,427.6898,7.1797,310.2486}, // carro forte
{-1613.6200,675.1901,7.1875,82.3397}, // carro forte
{-1644.2883,1217.8087,7.0391,44.0316}, // carro forte
{-2621.5471,1408.6351,7.1016,56.6280}, // carro forte
{-2755.3540,787.6356,53.7393,179.5082}, // carro forte
{-2723.4780,-311.3126,7.1875,134.1395}, // carro forte
{1477.2491,-1028.6914,23.8256,268.8506} // entregar (BANCO)
};

static const Float:yMP_PsStrCarreter[] ={//POSIÇÃO INICIAL CORREIOS
2179.6497,-2255.5310,14.7734
};
static const Float:yMP_PosC_Carreter[][] ={//POSIÇÕES DOS CARROS DE SPAWN ELETRICISTA
{2195.9226,-2233.3223,14.5533,312.8364,		2166.4133,-2273.8821,14.0056,227.7556}, // car
{2199.3181,-2236.5305,14.5651,312.8364,		2175.4592,-2266.9927,14.0313,223.3335}, // car
{2202.6821,-2240.1409,14.5673,312.8364,		2161.3738,-2280.6509,14.0250,226.8984} // car
};
static const Float:yMP_PosR_Carreter[][] ={
{-64.8170,-1121.0718,1.0781,253.5985}, // carreta
{-2114.5334,-2458.3704,30.6250,206.5746}, // carreta
{-1851.0531,132.0260,15.1172,90.6402}, // carreta
{-2628.7241,1371.8525,7.0964,38.9397}, // carreta
{-1472.3936,834.8116,7.1875,266.3985}, // carreta
{-2458.9158,2293.7993,4.9844,177.6776}, // carreta
{-1498.6660,2625.1096,55.6875,26.3362}, // carreta
{-848.4858,1526.2101,21.3579,177.3643}, // carreta
{-224.1966,2704.3662,62.5391,90.2568}, // carreta
{1885.2638,2611.5400,10.8203,6.9094}, // carreta
{2612.7690,1821.9294,10.8203,359.0760}, // carreta
{1443.7208,740.5833,10.8203,3.4393}, // carreta
{126.5943,-268.7717,1.5781,197.3477}, // carreta
{-1029.3523,-622.6889,32.0078,181.6809}, // carreta
{638.1878,-572.1016,16.1875,0.8859}, // carreta
{2339.6086,9.5586,26.3359,355.6200} // carreta
};

static const Float:yMP_PsStrCorreios[] ={//POSIÇÃO INICIAL CORREIOS
1793.2179,-1721.9508,13.5501
};
static const Float:yMP_PosC_Correio[][] ={//POSIÇÕES DOS CARROS DE SPAWN ELETRICISTA
{1772.9156,-1702.3059,13.5845,359.8222}, // car
{1776.6558,-1702.3217,13.5952,358.1374}, // car
{1780.9121,-1702.4270,13.5875,357.4917}, // car
{1784.7891,-1702.4604,13.5977,357.6591}
};
static const Float:yMP_PosR_Correio[][] ={
{1325.9464,-1067.2366,31.5547,98.6062}, // correio
{827.7697,-858.4319,70.3308,16.5251}, // correio
{1535.0341,-800.0409,72.8495,236.3285}, // correio
{850.9291,-1587.0637,13.5469,62.6788}, // correio
{305.1136,-1771.1062,4.5378,353.7284}, // correio
{255.1276,-1366.8818,53.1094,125.4057}, // correio
{1905.7698,-1112.9451,26.6641,353.3637}, // correio
{2626.0085,-1098.6267,69.3692,89.4535}, // correio
{2459.4724,-1691.4332,13.5454,190.5509}, // correio
{1711.6851,-2101.6924,14.0210,356.5598}, // correio
{-2507.9099,49.8874,25.6240,356.4743}, // correio
{-2156.7368,627.1204,52.3828,87.9235}, // correio
{-2382.4185,1244.5092,29.7080,83.7084}, // correio
{-2027.6812,-43.2035,38.8047,359.2498}, // correio
{-1656.7227,942.8268,23.1366,349.0757}, // correio
{-2075.4846,899.7039,64.1328,181.5987}, // correio
{-2634.9006,239.5984,4.5645,254.0878}, // correio
{-2786.9536,-175.2543,10.0625,266.6729}, // correio
{-1813.1034,-135.5226,6.1325,84.0724}, // correio
{-2904.5632,1111.5280,27.0703,87.3401}, // correio
{2019.9662,1008.7462,10.8203,103.4744}, // correio
{2127.4519,2379.6863,10.8203,344.4750}, // correio
{1684.5127,2123.2556,11.4609,113.5925}, // correio
{1364.7853,1897.0962,11.4688,121.4670}, // correio
{984.2295,1879.1888,11.4683,94.4214}, // correio
{985.1443,2343.9856,11.4688,103.0844}, // correio
{1558.1056,1007.6810,10.8125,118.8668}, // correio
{2368.0098,1984.1198,10.8203,293.8325}, // correio
{2627.9861,2349.3010,10.8203,28.7657}, // correio
{1879.1947,2290.3684,10.9799,79.7658} // correio
};

static const Float:yMP_PsStrEletrec[] ={
    2459.9639,-2118.1401,13.5530
};
static const Float:yMP_PosC_Elet[][] ={//POSIÇÕES DOS CARROS DE SPAWN ELETRICISTA
{2475.3997,-2117.4895,13.2412,1.4145}, // car
{2479.7437,-2117.3535,13.2398,1.4813}, // car
{2484.0701,-2117.2280,13.2411,358.8506} // car
};
static const Float:yMP_PosR_Elet[][] ={
{2403.9043,-1741.6608,13.5469,75.2041}, //poste
{1289.8331,-1414.5118,13.3478,169.1870}, //poste
{245.7580,-1244.2339,71.1752,55.2811}, //poste
{610.1337,-1781.8132,14.3228,138.4228}, //poste
{353.3246,-2050.1167,7.8359,119.1450}, //poste
{2012.6724,-1007.0257,30.5698,249.5784}, //poste
{2628.6257,-1094.3110,69.6150,47.2737}, //poste
{2491.8223,-1648.5692,13.5346,5.4009}, //poste
{1676.8038,-2117.9136,13.5469,103.0473}, //poste
{1072.9452,-1053.5732,31.1385,177.6329}, //poste
{-1597.2238,-589.8049,14.1484,314.7837}, //poste
{-2527.1477,-700.3525,139.3203,92.1204}, //poste
{-2759.6733,-102.8825,6.9965,120.4404}, //poste
{-1973.7157,906.7082,45.4453,207.6362}, //poste
{-1568.9526,942.5433,7.1875,45.9818}, //poste
{-1996.0629,239.3112,35.1719,132.8443}, //poste
{-2126.0706,-278.6897,35.3203,166.9926}, //poste
{-2844.1868,395.9940,4.5000,257.0277}, //poste
{-2597.1433,357.8730,4.3220,302.7207}, //poste
{-1222.8776,446.8063,7.1875,288.3809}, //poste
{2532.5754,1206.7832,10.8203,294.8877}, //poste
{2318.4373,1623.2031,10.8203,89.2278}, //poste
{1855.2440,2060.7161,10.8418,355.7663}, //poste
{1140.5562,2044.3600,10.8203,171.9578}, //poste
{1535.8347,2594.8335,10.8203,354.6583}, //poste
{2233.8691,2705.5896,10.8203,200.1089}, //poste
{2539.0571,2242.3210,10.8203,359.7090}, //poste
{2616.6875,1483.1614,10.8203,249.4189}, //poste
{2536.3271,1023.0743,10.8203,303.0891}, //poste
{1956.9874,2201.9399,10.8203,350.9649} //poste
};

hook OnGMInit(){
    CreateDynamicPickup(1239,1,yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2], -1, -1, -1, STREAMER_PICKUP_SD, -1, 0);
    CreateDynamic3DTextLabel("empresa eletrica\n/menuemp ou Y", 0xFFFFFFFF, yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2], 30, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
    CreateDynamicMapIcon(yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2], 52, -1, -1, -1, -1, 10000);
    CreateDynamicPickup(1239,1,yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2], -1, -1, -1, STREAMER_PICKUP_SD, -1, 0);
    CreateDynamic3DTextLabel("Correios\n/menuemp ou Y", 0xFFFFFFFF, yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2], 30, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
	CreateDynamicMapIcon(yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2], 52, -1, -1, -1, -1, 10000);
	CreateDynamicPickup(1239,1,yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2], -1, -1, -1, STREAMER_PICKUP_SD, -1, 0);
    CreateDynamic3DTextLabel("Carreteiro\n/menuemp ou Y", 0xFFFFFFFF, yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2], 30, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
    CreateDynamicMapIcon(yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2], 52, -1, -1, -1, -1, 10000);
    CreateDynamicPickup(1239,1,yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2], -1, -1, -1, STREAMER_PICKUP_SD, -1, 0);
    CreateDynamic3DTextLabel("Carro Forte\n/menuemp ou Y", 0xFFFFFFFF, yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2], 30, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
    CreateDynamicMapIcon(yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2], 52, -1, -1, -1, -1, 10000);
    CreateDynamicPickup(1239,1,yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2], -1, -1, -1, STREAMER_PICKUP_SD, -1, 0);
    CreateDynamic3DTextLabel("Carreteiro Prancheiro\n/menuemp ou Y", 0xFFFFFFFF, yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2], 30, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
    CreateDynamicMapIcon(yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2], 52, -1, -1, -1, -1, 5000);
    CreateDynamicPickup(1239,1,yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2], -1, -1, -1, STREAMER_PICKUP_SD, -1, 0);
    CreateDynamic3DTextLabel("Lenhador\n/menuemp ou Y", 0xFFFFFFFF, yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2], 30, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
    CreateDynamicMapIcon(yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2], 52, -1, -1, -1, -1, 10000);
    for(new i = 0; i < sizeof(yMP_PosR_Lixeiro); i++)
    	CreateObject(3035, yMP_PosR_Lixeiro[i][0],yMP_PosR_Lixeiro[i][1],yMP_PosR_Lixeiro[i][2]-0.25, 0.0, 0.0, yMP_PosR_Lixeiro[i][3]-180.0, 50.0);
    CreateDynamicPickup(1239,1,yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2], -1, -1, -1, STREAMER_PICKUP_SD, -1, 0);
    CreateDynamic3DTextLabel("Lixeiro\n/menuemp ou Y", 0xFFFFFFFF, yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2], 30, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
    CreateDynamicMapIcon(yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2], 52, -1, -1, -1, -1, 10000);
	return 1;
}

hook OnGameModeExit(){
	DOF2_Exit();
	return 1;
}

hook OnPyCn(playerid){
	if(playerid < MAX_PLAYERS){
		new path[50],xNome[32]; GetPlayerName(playerid,xNome,sizeof(xNome));
		format(path,sizeof(path),"%s/%s.ini",PATH,xNome);
	   	yMP_Emprego[playerid] = DOF2_GetInt(path,"Emprego");
   	}
	return 1;
}

hook OnPyDisconnect(playerid, reason){
    if(playerid < MAX_PLAYERS){
		new path[50],xNome[32]; GetPlayerName(playerid,xNome,sizeof(xNome));
		format(path,sizeof(path),"%s/%s.ini",PATH,xNome);
		if(!DOF2_FileExists(path)) DOF2_CreateFile(path);
		DOF2_SetInt(path,"Emprego",yMP_Emprego[playerid]);
		DOF2_SaveFile();
	    yMP_Emprego[playerid] = 0;
	    yMP_PegouServ[playerid] = 0;
		if(yMP_Carro[playerid] != 0){
			DestroyVehicle(yMP_Carro[playerid]);
			yMP_Carro[playerid] = 0;
		}
		if(yMP_Bau[playerid] != 0){
			DestroyVehicle(yMP_Bau[playerid]);
			yMP_Bau[playerid] = 0;
		}
		if(yMP_AddQntLP[playerid] != 0){
			KillTimer(yMP_KillTimer[playerid]);
			yMP_AddQntLP[playerid] = 0;
		}
	    yMP_Infos[playerid] = 0;
	    for(new i = 0; i < sizeof(yMP_Objs); i++) if(IsValidObject(yMP_Objs[i][playerid])) DestroyObject(yMP_Objs[i][playerid]);
    }
	return 1;
}

CMD:pegaremprego(playerid){
    if(yMP_Emprego[playerid] != 0) return SendClientMessage(playerid, 0xFF0000FF, "Você já está em um emprego! Saida dele antes!");
    if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2])){
        yMP_Emprego[playerid] = 1;
        SendClientMessage(playerid, 0x33CC33FF, "Você pegou o emprego de Eletrecista!");
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2])){
        yMP_Emprego[playerid] = 2;
        SendClientMessage(playerid, 0x33CC33FF, "Você pegou o emprego de Correio!");
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2])){
        yMP_Emprego[playerid] = 3;
        SendClientMessage(playerid, 0x33CC33FF, "Você pegou o emprego de Carreteiro!");
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2])){
        yMP_Emprego[playerid] = 4;
        SendClientMessage(playerid, 0x33CC33FF, "Você pegou o emprego de Carro Forte!");
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2])){
        yMP_Emprego[playerid] = 5;
        SendClientMessage(playerid, 0x33CC33FF, "Você pegou o emprego de Carreteiro Prancheiro!");
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2])){
        yMP_Emprego[playerid] = 6;
        return SendClientMessage(playerid, 0x33CC33FF, "Você pegou o emprego de Lenhador!");
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2])){
        yMP_Emprego[playerid] = 7;
        return SendClientMessage(playerid, 0x33CC33FF, "Você pegou o emprego de Lixeiro!");
    }
    else SendClientMessage(playerid, 0xFF0000FF, "Você não está proximo a nenhuma HQ!");
	return 1;
}
CMD:sairemprego(playerid){
    if(yMP_Emprego[playerid] == 0) return SendClientMessage(playerid, 0xFF0000FF, "Você não está em um emprego!");
    if(IsPlayerInAnyVehicle(playerid)) if(GetPlayerVehicleID(playerid) == yMP_Carro[playerid]) return SendClientMessage(playerid, 0xFF0000FF, "Você não pode usar este comando dentro do veiculo da Empresa!");
    if(yMP_Emprego[playerid] == 6){
		if(yMP_PegouServ[playerid] != 0)
			RemovePlayerAttachedObject(playerid, 9),
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	}
	yMP_Emprego[playerid] = 0;
    yMP_Infos[playerid] = 0;
    if(yMP_PegouServ[playerid] != 0) DisablePlayerCheckpoint(playerid);
	yMP_PegouServ[playerid] = 0;
	if(yMP_Carro[playerid] != 0){
		DestroyVehicle(yMP_Carro[playerid]);
		yMP_Carro[playerid] = 0;
	}
	if(yMP_Bau[playerid] != 0){
		DestroyVehicle(yMP_Bau[playerid]);
		yMP_Bau[playerid] = 0;
	}
	if(yMP_AddQntLP[playerid] != 0){
		KillTimer(yMP_KillTimer[playerid]);
		yMP_AddQntLP[playerid] = 0;
	}
	SetPlayerSkin(playerid,yMP_Skin[playerid]);
	SendClientMessage(playerid, 0x33CC33FF, "Você saiu do seu emprego!");
	for(new i = 0; i < sizeof(yMP_Objs); i++) if(IsValidObject(yMP_Objs[i][playerid])) DestroyObject(yMP_Objs[i][playerid]);
	return 1;
}

CMD:menuemp(playerid,params[]){
    format(StrGeral, sizeof(StrGeral), "");
    if(yMP_Emprego[playerid] == 0) return SendClientMessage(playerid, 0xFF0000FF, "Você não está em nenhum emprego!!");
	strcat(StrGeral, "{FFFFFF}Pegar/Entregar um veiculo\nPegar um local de entrega de encomenda\nLocalizar Local\nParar de trabalhar\n");
	ShowPlayerDialog(playerid, DG_Central_Menu, DIALOG_STYLE_LIST, "{FF0000}[Menu Emprego]", StrGeral, "Ok", "Cancelar");
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if(playerid < MAX_PLAYERS){
	    if((newkeys == 65536))
	        if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2]))
	            cmd_menuemp(playerid, "");
	        else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2]))
	            cmd_menuemp(playerid, "");
	        else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2]))
	            cmd_menuemp(playerid, "");
	        else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2]))
	            cmd_menuemp(playerid, "");
	        else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2]))
	            cmd_menuemp(playerid, "");
	        else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2]))
	            cmd_menuemp(playerid, "");
	        else if(IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2]))
	            cmd_menuemp(playerid, "");
    }
	return 1;
}

DEFINE_HOOK_REPLACEMENT__(Dialog, Dg);
hook OnDgResponse(playerid, dialogid, response, listitem, inputtext[]){//
    if(dialogid == DG_Central_Menu){
        if(response){
			if(listitem == 0){
            	if(yMP_Emprego[playerid] == 1){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                if(yMP_Carro[playerid] == 0){
		                new yAlet = random(sizeof(yMP_PosC_Elet));
		                yMP_Carro[playerid] = AddStaticVehicleEx(552,yMP_PosC_Elet[yAlet][0],yMP_PosC_Elet[yAlet][1],yMP_PosC_Elet[yAlet][2]+3.0,yMP_PosC_Elet[yAlet][3],1,0,-1); // car
		                return SendClientMessage(playerid, 0x33CC33FF, "Seu veiculo foi criado!");
	                }else return yMPDellCarrosEmpre(playerid);
	            }
            	else if(yMP_Emprego[playerid] == 2){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                if(yMP_Carro[playerid] == 0){
		                new yAlet = random(sizeof(yMP_PosC_Correio));
		                yMP_Carro[playerid] = AddStaticVehicleEx(413,yMP_PosC_Correio[yAlet][0],yMP_PosC_Correio[yAlet][1],yMP_PosC_Correio[yAlet][2]+3.0,yMP_PosC_Correio[yAlet][3],6,6,-1); // car
		                return SendClientMessage(playerid, 0x33CC33FF, "Seu veiculo foi criado!");
	                }else return yMPDellCarrosEmpre(playerid);
	            }
            	else if(yMP_Emprego[playerid] == 3){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                if(yMP_Carro[playerid] == 0){
		                new yAlet = random(sizeof(yMP_PosC_Carreter));
						yMP_Carro[playerid] = AddStaticVehicleEx(515,yMP_PosC_Carreter[yAlet][0],yMP_PosC_Carreter[yAlet][1],yMP_PosC_Carreter[yAlet][2]+3.0,yMP_PosC_Carreter[yAlet][3],0,1,-1); // carreta
						yMP_Bau[playerid] = AddStaticVehicleEx(435,yMP_PosC_Carreter[yAlet][4],yMP_PosC_Carreter[yAlet][5],yMP_PosC_Carreter[yAlet][6]+1.0,yMP_PosC_Carreter[yAlet][7],0,0,-1); // bau
		                return SendClientMessage(playerid, 0x33CC33FF, "Seu veiculo foi criado!");
	                }else yMPDellCarrosEmpre(playerid);
	            }
	            else if(yMP_Emprego[playerid] == 4){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                if(yMP_Carro[playerid] == 0){
		                new yAlet = random(sizeof(yMP_PosC_CarFort));
						yMP_Carro[playerid] = AddStaticVehicleEx(428,yMP_PosC_CarFort[yAlet][0],yMP_PosC_CarFort[yAlet][1],yMP_PosC_CarFort[yAlet][2]+3.0,yMP_PosC_CarFort[yAlet][3],0,1,-1); // carreta
		                return SendClientMessage(playerid, 0x33CC33FF, "Seu veiculo foi criado!");
	                }else yMPDellCarrosEmpre(playerid);
	            }
            	else if(yMP_Emprego[playerid] == 5){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                if(yMP_Carro[playerid] == 0){
		                new yAlet = random(sizeof(yMP_PosC_Prancheiro));
						yMP_Carro[playerid] = AddStaticVehicleEx(578,yMP_PosC_Prancheiro[yAlet][0],yMP_PosC_Prancheiro[yAlet][1],yMP_PosC_Prancheiro[yAlet][2]+3.0,yMP_PosC_Prancheiro[yAlet][3],0,1,-1); // carreta
		                return SendClientMessage(playerid, 0x33CC33FF, "Seu veiculo foi criado!");
	                }else return yMPDellCarrosEmpre(playerid);
	            }
            	else if(yMP_Emprego[playerid] == 6){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                if(yMP_Carro[playerid] == 0){
		                new yAlet = random(sizeof(yMP_PosC_Lenhador));
		                yMP_Carro[playerid] = AddStaticVehicleEx(552,yMP_PosC_Lenhador[yAlet][0],yMP_PosC_Lenhador[yAlet][1],yMP_PosC_Lenhador[yAlet][2]+3.0,yMP_PosC_Lenhador[yAlet][3],84,31,-1); // car
		                return SendClientMessage(playerid, 0x33CC33FF, "Seu veiculo foi criado!");
	                }else return yMPDellCarrosEmpre(playerid);
	            }
	            else if(yMP_Emprego[playerid] == 7){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                if(yMP_Carro[playerid] == 0){
		                new yAlet = random(sizeof(yMP_PosC_Lixeiro));
						yMP_Carro[playerid] = AddStaticVehicleEx(408,yMP_PosC_Lixeiro[yAlet][0],yMP_PosC_Lixeiro[yAlet][1],yMP_PosC_Lixeiro[yAlet][2]+3.0,yMP_PosC_Lixeiro[yAlet][3],0,1,-1); // carreta
		                return SendClientMessage(playerid, 0x33CC33FF, "Seu veiculo foi criado!");
	                }else yMPDellCarrosEmpre(playerid);
	            }
			}
			else if(listitem == 1){
                if(yMP_PegouServ[playerid] > 0) return SendClientMessage(playerid, 0xFF0000FF, "Você já pegou um serviço de reparos!");
                if(yMP_TempPegar[playerid] > gettime()) return yMPErrTempoServ(playerid);
			    if(yMP_Emprego[playerid] == 1){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                new yAlet = random(sizeof(yMP_PosR_Elet));
	                yMP_Pos[0][playerid] = yMP_PosR_Elet[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Elet[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Elet[yAlet][2];
	                yMP_PegouServ[playerid] = yAlet+1;
	                SetPlayerCheckpoint(playerid, yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2], 2.0);
	                yMP_Objs[0][playerid] = CreateObject(1238, yMP_PosR_Elet[yAlet][0]+1,yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2]-0.7, 0.0, 0.0, -90.2, 50.0);
	                yMP_Objs[1][playerid] = CreateObject(1238, yMP_PosR_Elet[yAlet][0]-1,yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2]-0.7, 0.0, 0.0, -90.2, 50.0);
	                yMP_Objs[2][playerid] = CreateObject(1238, yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1]+1,yMP_PosR_Elet[yAlet][2]-0.7, 0.0, 0.0, -90.2, 50.0);
	                yMP_Objs[3][playerid] = CreateObject(1238, yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1]-1,yMP_PosR_Elet[yAlet][2]-0.7, 0.0, 0.0, -90.2, 50.0);
					yMP_Skin[playerid] = GetPlayerSkin(playerid);	SetPlayerSkin(playerid,260);
	                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2] ,yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2]) * yMP_VAlor_Eletrc);
	                format(yMPStr, sizeof(yMPStr), "Você pegou um serviço! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2] ,yMP_PsStrEletrec[0],yMP_PsStrEletrec[1],yMP_PsStrEletrec[2]));
					return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
	            }
	            else if(yMP_Emprego[playerid] == 2){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                new yAlet = random(sizeof(yMP_PosR_Correio));
	                yMP_Pos[0][playerid] = yMP_PosR_Correio[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Correio[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Correio[yAlet][2];
	                yMP_PegouServ[playerid] = yAlet+1;
	                SetPlayerCheckpoint(playerid, yMP_PosR_Correio[yAlet][0],yMP_PosR_Correio[yAlet][1],yMP_PosR_Correio[yAlet][2], 2.0);
					yMP_Skin[playerid] = GetPlayerSkin(playerid);//	SetPlayerSkin(playerid,260);
	                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Correio[yAlet][0],yMP_PosR_Correio[yAlet][1],yMP_PosR_Correio[yAlet][2] ,yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2]) * yMP_VAlor_Correio);
	                format(yMPStr, sizeof(yMPStr), "Você pegou um serviço! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Correio[yAlet][0],yMP_PosR_Correio[yAlet][1],yMP_PosR_Correio[yAlet][2] ,yMP_PsStrCorreios[0],yMP_PsStrCorreios[1],yMP_PsStrCorreios[2]));
					return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
	            }
			    else if(yMP_Emprego[playerid] == 3){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                new yAlet = random(sizeof(yMP_PosR_Carreter));
	                yMP_Pos[0][playerid] = yMP_PosR_Carreter[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Carreter[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Carreter[yAlet][2];
	                yMP_PegouServ[playerid] = yAlet+1;
	                SetPlayerCheckpoint(playerid, yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2], 4.0);
					yMP_Skin[playerid] = GetPlayerSkin(playerid);	SetPlayerSkin(playerid,133);
	                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2] ,yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2]) * yMP_VAlor_Carreter);
	                format(yMPStr, sizeof(yMPStr), "Você pegou um Transporte! Carregamento a {33CC33}%i{FFFFFF}/KM",yMP_GetDist(yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2] ,yMP_PsStrCarreter[0],yMP_PsStrCarreter[1],yMP_PsStrCarreter[2]));
					return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
	            }
	            else if(yMP_Emprego[playerid] == 4){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                new yAlet = random(sizeof(yMP_PosR_CarFort)-1);
	                yMP_Pos[0][playerid] = yMP_PosR_CarFort[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_CarFort[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_CarFort[yAlet][2];
	                yMP_PegouServ[playerid] = yAlet+1;
	                SetPlayerCheckpoint(playerid, yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2], 4.0);
					yMP_Skin[playerid] = GetPlayerSkin(playerid);	SetPlayerSkin(playerid,71);
	                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2] ,yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2]) * yMP_VAlor_CarFort);
	                format(yMPStr, sizeof(yMPStr), "Você pegou um Transporte! Carregamento a {33CC33}%i{FFFFFF}/KM",yMP_GetDist(yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2] ,yMP_PsStrCarFort[0],yMP_PsStrCarFort[1],yMP_PsStrCarFort[2]));
					return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
	            }
			    else if(yMP_Emprego[playerid] == 5){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                new yAlet = random(sizeof(yMP_PosR_Prancheiro)-1);
	                yMP_Pos[0][playerid] = yMP_PosR_Prancheiro[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Prancheiro[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Prancheiro[yAlet][2];
	                yMP_PegouServ[playerid] = yAlet+1;
	                SetPlayerCheckpoint(playerid, yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2], 4.0);
					yMP_Skin[playerid] = GetPlayerSkin(playerid);	SetPlayerSkin(playerid,272);
	                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2] ,yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2]) * yMP_VAlor_Prancheiro);
	                format(yMPStr, sizeof(yMPStr), "Você pegou um Transporte! Carregamento a {33CC33}%i{FFFFFF}/KM",yMP_GetDist(yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2] ,yMP_PsStrPrancheiro[0],yMP_PsStrPrancheiro[1],yMP_PsStrPrancheiro[2]));
					return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
	            }
			    else if(yMP_Emprego[playerid] == 6){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
                    GivePlayerWeapon(playerid,9,1);
					new yAlet = random(sizeof(yMP_PosR_Lenhad)-1);
	                yMP_Pos[0][playerid] = yMP_PosR_Lenhad[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Lenhad[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Lenhad[yAlet][2];
	                yMP_PegouServ[playerid] = yAlet+1;
	                SetPlayerCheckpoint(playerid, yMP_PosR_Lenhad[yAlet][0],yMP_PosR_Lenhad[yAlet][1],yMP_PosR_Lenhad[yAlet][2], 2.0);
					yMP_Skin[playerid] = GetPlayerSkin(playerid);	SetPlayerSkin(playerid,1);
	                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Lenhad[yAlet][0],yMP_PosR_Lenhad[yAlet][1],yMP_PosR_Lenhad[yAlet][2] ,yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2]) * yMP_VAlor_Lenhador);
	                format(yMPStr, sizeof(yMPStr), "Você pegou um serviço! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Lenhad[yAlet][0],yMP_PosR_Lenhad[yAlet][1],yMP_PosR_Lenhad[yAlet][2] ,yMP_PsStrLenhador[0],yMP_PsStrLenhador[1],yMP_PsStrLenhador[2]));
					return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
	            }
	            else if(yMP_Emprego[playerid] == 7){
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2])) return SendClientMessage(playerid, 0xFF0000FF, "Você não está na HQ!");
	                new yAlet = random(sizeof(yMP_PosR_Lixeiro)-1);
	                yMP_Pos[0][playerid] = yMP_PosR_Lixeiro[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Lixeiro[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Lixeiro[yAlet][2];
	                yMP_PegouServ[playerid] = yAlet+1;
	                SetPlayerCheckpoint(playerid, yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2], 3.0);
					yMP_Skin[playerid] = GetPlayerSkin(playerid);	SetPlayerSkin(playerid,27);
	                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2] ,yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2]) * yMP_VAlor_Lixeiro);
	                format(yMPStr, sizeof(yMPStr), "Você pegou uma coleta! Coleta a {33CC33}%i{FFFFFF}/KM",yMP_GetDist(yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2] ,yMP_PsStrLixeiro[0],yMP_PsStrLixeiro[1],yMP_PsStrLixeiro[2]));
					return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
	            }
			}
			else if(listitem == 2){
				if(yMP_PegouServ[playerid] == 0) return SendClientMessage(playerid, 0xFF0000FF, "Você nao tem nenhum serviço para fazer!");
				SetPlayerCheckpoint(playerid, yMP_Pos[0][playerid],yMP_Pos[1][playerid],yMP_Pos[2][playerid], 2.0);
				return SendClientMessage(playerid, 0xFFFFFFFF, "Você localizou o local!");
	        }
	        else if(listitem == 3){
	            if(yMP_PegouServ[playerid] == 0) return SendClientMessage(playerid, 0xFF0000FF, "Você não está a serviço!");
	            if(IsPlayerInAnyVehicle(playerid)) if(GetPlayerVehicleID(playerid) == yMP_Carro[playerid]) return SendClientMessage(playerid, 0xFF0000FF, "Você não pode usar este comando dentro do veiculo da Empresa!");
			    if(yMP_Emprego[playerid] == 6){
					if(yMP_PegouServ[playerid] != 0)
						RemovePlayerAttachedObject(playerid, 9),
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				}
				yMP_PegouServ[playerid] = 0;
			    yMP_Infos[playerid] = 0;
			    if(yMP_Carro[playerid] != 0){
					DestroyVehicle(yMP_Carro[playerid]);
					yMP_Carro[playerid] = 0;
				}
				if(yMP_Bau[playerid] != 0){
					DestroyVehicle(yMP_Bau[playerid]);
					yMP_Bau[playerid] = 0;
				}
			    if(yMP_AddQntLP[playerid] != 0){
				    KillTimer(yMP_KillTimer[playerid]);
				    yMP_AddQntLP[playerid] = 0;
			    }
			    SetPlayerSkin(playerid,yMP_Skin[playerid]);
			    SendClientMessage(playerid, 0xFFFFFFFF, "Você parou de trabalhar!");
			    DisablePlayerCheckpoint(playerid);
			    yMP_TempPegar[playerid] = gettime()+yMP_SegsPegarServ;
			    for(new i = 0; i < sizeof(yMP_Objs); i++) if(IsValidObject(yMP_Objs[i][playerid])) DestroyObject(yMP_Objs[i][playerid]);
	        }
		}
		return 1;
	}
    if(dialogid == DG_Prox_Serv){
		if(response){
			if(yMP_Emprego[playerid] == 1){
                new yAlet = random(sizeof(yMP_PosR_Elet));
                yMP_Pos[0][playerid] = yMP_PosR_Elet[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Elet[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Elet[yAlet][2];
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2], 2.0);
                yMP_Objs[0][playerid] = CreateObject(1238, yMP_PosR_Elet[yAlet][0]+1,yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2]-0.7, 0.0, 0.0, -90.2, 50.0);
                yMP_Objs[1][playerid] = CreateObject(1238, yMP_PosR_Elet[yAlet][0]-1,yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2]-0.7, 0.0, 0.0, -90.2, 50.0);
                yMP_Objs[2][playerid] = CreateObject(1238, yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1]+1,yMP_PosR_Elet[yAlet][2]-0.7, 0.0, 0.0, -90.2, 50.0);
                yMP_Objs[3][playerid] = CreateObject(1238, yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1]-1,yMP_PosR_Elet[yAlet][2]-0.7, 0.0, 0.0, -90.2, 50.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Eletrc);
                format(yMPStr, sizeof(yMPStr), "Você pegou um serviço! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Elet[yAlet][0],yMP_PosR_Elet[yAlet][1],yMP_PosR_Elet[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
        	}
        	else if(yMP_Emprego[playerid] == 2){
                new yAlet = random(sizeof(yMP_PosR_Correio));
                yMP_Pos[0][playerid] = yMP_PosR_Correio[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Correio[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Correio[yAlet][2];
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_Correio[yAlet][0],yMP_PosR_Correio[yAlet][1],yMP_PosR_Correio[yAlet][2], 2.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Correio[yAlet][0],yMP_PosR_Correio[yAlet][1],yMP_PosR_Correio[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Correio);
                format(yMPStr, sizeof(yMPStr), "Você pegou uma Entrega! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Correio[yAlet][0],yMP_PosR_Correio[yAlet][1],yMP_PosR_Correio[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
        	}
        	else if(yMP_Emprego[playerid] == 3){
                new yAlet = random(sizeof(yMP_PosR_Carreter));
                if(yAlet == yMP_PegouServ[playerid]-1)
					if(yAlet == sizeof(yMP_PosR_Carreter)-1) yAlet -= 1;
					else yAlet += 1;
				yMP_Pos[0][playerid] = yMP_PosR_Carreter[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Carreter[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Carreter[yAlet][2];
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2], 4.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Carreter);
                format(yMPStr, sizeof(yMPStr), "Você pegou um Transporte! Carregamento a {33CC33}%i{FFFFFF}/KM",yMP_GetDist(yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
        	}
        	else if(yMP_Emprego[playerid] == 4){
                new yAlet = random(sizeof(yMP_PosR_CarFort)-1);
                yMP_Pos[0][playerid] = yMP_PosR_CarFort[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_CarFort[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_CarFort[yAlet][2];
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2], 4.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_CarFort);
                format(yMPStr, sizeof(yMPStr), "Você pegou um Transporte! Carregamento a {33CC33}%i{FFFFFF}/KM",yMP_GetDist(yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
        	}
        	else if(yMP_Emprego[playerid] == 5){
                new yAlet = random(sizeof(yMP_PosR_Prancheiro)-1);
                yMP_Pos[0][playerid] = yMP_PosR_Prancheiro[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Prancheiro[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Prancheiro[yAlet][2];
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2], 4.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Prancheiro);
                format(yMPStr, sizeof(yMPStr), "Você pegou um Transporte! Carregamento a {33CC33}%i{FFFFFF}/KM",yMP_GetDist(yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
        	}
			else if(yMP_Emprego[playerid] == 6){
                new yAlet = random(sizeof(yMP_PosR_Lenhad)-1);
                yMP_Pos[0][playerid] = yMP_PosR_Lenhad[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Lenhad[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Lenhad[yAlet][2];
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_Lenhad[yAlet][0],yMP_PosR_Lenhad[yAlet][1],yMP_PosR_Lenhad[yAlet][2], 2.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Lenhad[yAlet][0],yMP_PosR_Lenhad[yAlet][1],yMP_PosR_Lenhad[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Lenhador);
                format(yMPStr, sizeof(yMPStr), "Você pegou um serviço! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Lenhad[yAlet][0],yMP_PosR_Lenhad[yAlet][1],yMP_PosR_Lenhad[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
        	}
        	else if(yMP_Emprego[playerid] == 7){
                new yAlet = random(sizeof(yMP_PosR_Lixeiro)-1);
                yMP_Pos[0][playerid] = yMP_PosR_Lixeiro[yAlet][0];	yMP_Pos[1][playerid] = yMP_PosR_Lixeiro[yAlet][1];	yMP_Pos[2][playerid] = yMP_PosR_Lixeiro[yAlet][2];
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2], 3.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Lixeiro);
                format(yMPStr, sizeof(yMPStr), "Você pegou uma coleta! Coleta a {33CC33}%i{FFFFFF}/KM",yMP_GetDist(yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
        	}
		}else yMPPararDeTrabalhar(playerid);
    }
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid){
    if(playerid < MAX_PLAYERS){
		if(yMP_PegouServ[playerid] > 0){
		    if(yMP_Emprego[playerid] == 1){
		        SendClientMessage(playerid, 0x33CC33FF, "Você está reparando...");
				yMP_KillTimer[playerid] = SetTimerEx("yMP_LPEletrcista", 1000, true,"i",playerid);
				DisablePlayerCheckpoint(playerid);
				ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0,1);
				return 1;
			}
		    else if(yMP_Emprego[playerid] == 2){
		        SendClientMessage(playerid, 0x33CC33FF, "Você está entregando a encomenda...");
				yMP_KillTimer[playerid] = SetTimerEx("yMP_LPCorreios", 1000, true,"i",playerid);
				DisablePlayerCheckpoint(playerid);
	//			ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0,1);
			}
		    else if(yMP_Emprego[playerid] == 3){
		        new yAlet = yMP_PegouServ[playerid]-1;
				if(!IsPlayerInAnyVehicle(playerid)) return yMPKillTimReset(playerid,"Você não está dentro de uma Carreta!",yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2],4.0);
				if(GetPlayerVehicleID(playerid) != yMP_Carro[playerid]) return yMPKillTimReset(playerid,"Você não está com a Carreta da empresa!",yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2],4.0);
				if(GetVehicleTrailer(GetPlayerVehicleID(playerid)) != yMP_Bau[playerid]) return yMPKillTimReset(playerid,"Você não está com o Bau da empresa!",yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2],4.0);
				if(yMP_Infos[playerid] == 0){
			        SendClientMessage(playerid, 0x33CC33FF, "Você está carregando a carreta...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPCarreteiro", 1000, true,"i",playerid);
				}else{
			        SendClientMessage(playerid, 0x33CC33FF, "Você está entregando a encomenda...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPCarreteiro", 1000, true,"i",playerid);
				}
				DisablePlayerCheckpoint(playerid);
			}
		    else if(yMP_Emprego[playerid] == 4){
		        new yAlet = yMP_PegouServ[playerid]-1;
				if(!IsPlayerInAnyVehicle(playerid)) return yMPKillTimReset(playerid,"Você não está dentro de um Carro Forte",yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2],4.0);
				if(yMP_Carro[playerid] != GetPlayerVehicleID(playerid)) return yMPKillTimReset(playerid,"Você não está com o Carro Forte da empresa!!",yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2],4.0);
				if(yMP_Infos[playerid] == 0){
			        SendClientMessage(playerid, 0x33CC33FF, "Você está carregando o Carro Forte...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPCarrForte", 1000, true,"i",playerid);
				}else{
			        SendClientMessage(playerid, 0x33CC33FF, "Você está descarregando o Carro Forte...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPCarrForte", 1000, true,"i",playerid);
				}
				DisablePlayerCheckpoint(playerid);
			}
		    else if(yMP_Emprego[playerid] == 5){
		        new yAlet = yMP_PegouServ[playerid]-1;
				if(!IsPlayerInAnyVehicle(playerid)) return yMPKillTimReset(playerid,"Você não está dentro de um Caminhão Prancha",yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2],4.0);
				if(yMP_Carro[playerid] != GetPlayerVehicleID(playerid))return yMPKillTimReset(playerid,"Você não está com o Caminhão Prancha da Empresa!",yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2],4.0);
				if(yMP_Infos[playerid] == 0){
			        SendClientMessage(playerid, 0x33CC33FF, "Você está carregando o Caminhão Prancha!...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPPrancheiro", 1000, true,"i",playerid);
				}else{
			        SendClientMessage(playerid, 0x33CC33FF, "Você está descarregando o Caminhão Prancha!...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPPrancheiro", 1000, true,"i",playerid);
				}
				DisablePlayerCheckpoint(playerid);
			}
		    else if(yMP_Emprego[playerid] == 6){
		        if(yMP_Infos[playerid] == 1){
		            DisablePlayerCheckpoint(playerid);
			        yMP_Infos[playerid] = 0;
					yMP_AddQntLP[playerid] = 0;
					RemovePlayerAttachedObject(playerid, 9);
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			        GivePlayerMoney(playerid,yMP_Valor[playerid]);
			        format(StrGeral, sizeof(StrGeral), "");
			        format(yMPStr, sizeof(yMPStr), "{FFFFFF}Você recebeu {33CC33}R$%i\n",yMP_Valor[playerid]); strcat(StrGeral, yMPStr);
					strcat(StrGeral, "Você deseja continuar trabalhando?\n");
					return ShowPlayerDialog(playerid, DG_Prox_Serv, DIALOG_STYLE_MSGBOX, "{FF0000}[Lenhador]", StrGeral, "Continuar", "Parar");
		        }else{
			        SendClientMessage(playerid, 0x33CC33FF, "Você está serrando a arvore...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPLenhador", 1000, true,"i",playerid);
					DisablePlayerCheckpoint(playerid);
	//				ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0,1);
				}
				return 1;
			}
		    else if(yMP_Emprego[playerid] == 7){
		        new yAlet = yMP_PegouServ[playerid]-1;
				if(yMP_Infos[playerid] < yMP_QntColetLixeir){
				    if(IsPlayerInAnyVehicle(playerid)) return yMPKillTimReset(playerid,"Você não pode coletar dentro de um veiculo!",yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2],2.0);
	                new Float:Pos[4]; GetVehiclePos(yMP_Carro[playerid],Pos[0],Pos[1],Pos[2]);
					GetVehicleZAngle(yMP_Carro[playerid], Pos[3]);
				    Pos[0] = Pos[0] + -3.5 * floatsin(-Pos[3], degrees);
				    Pos[1] = Pos[1] + -3.5 * floatcos(-Pos[3], degrees);
	                if(!IsPlayerInRangeOfPoint(playerid,2.0,Pos[0],Pos[1],Pos[2])) return yMPKillTimReset(playerid,"Você não está proximo o suficiente da trazeira do seu Caminhão de Lixo!",yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2],2.0);
					SendClientMessage(playerid, 0x33CC33FF, "Você está coletando o lixo...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPLixiero", 1000, true,"i",playerid);
					ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0,1);
				}else{
					if(!IsPlayerInAnyVehicle(playerid)) return yMPKillTimReset(playerid,"Você não está dentro de um Caminhão de Lixo",yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2],2.0);
					if(yMP_Carro[playerid] != GetPlayerVehicleID(playerid)) return yMPKillTimReset(playerid,"Você não está com o Caminhão de Lixo da empresa!!",yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2],2.0);
			        SendClientMessage(playerid, 0x33CC33FF, "Você está descarregando o Caminhão de lixo...");
					yMP_KillTimer[playerid] = SetTimerEx("yMP_LPLixiero", 1000, true,"i",playerid);
				}
				DisablePlayerCheckpoint(playerid);
				return 1;
			}
		}
	}
    return 1;
}
forward yMP_LPLixiero(playerid);
public yMP_LPLixiero(playerid){
	if(yMP_Emprego[playerid] == 7){
	    if(yMP_Infos[playerid] < yMP_QntColetLixeir){
		    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
		    if(yMP_AddQntLP[playerid] >= yMP_TLP_Lixeiro){
		        yMP_Infos[playerid] += 1;
		        ClearAnimations(playerid);
		        DisablePlayerCheckpoint(playerid);
				yMP_AddQntLP[playerid] = 0;
		        KillTimer(yMP_KillTimer[playerid]);
		        yAlet = random(sizeof(yMP_PosR_Lixeiro)-1);
		        new Float:Pos[3],Float:Radiau;   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                if(yMP_Infos[playerid] >= yMP_QntColetLixeir) Radiau = 4.0, yAlet = sizeof(yMP_PosR_Lixeiro)-1;
                else Radiau = 3.0, yMP_Valor[playerid] += floatround(yMP_GetDist(yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Lixeiro);
				yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2], Radiau);
                format(yMPStr, sizeof(yMPStr), "Você pegou o lixo! Info: {33CC33}+R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM | Coleta: [%i/%i]",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2] ,Pos[0],Pos[1],Pos[2]),yMP_Infos[playerid],yMP_QntColetLixeir);
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
		    }
		    if(!IsPlayerInRangeOfPoint(playerid,5.0,yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2]))
		        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2],2.0);
		    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Coletando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Lixeiro);
		    GameTextForPlayer(playerid,yMPStr,1000,5);
	    }else{
		    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
		    if(yMP_AddQntLP[playerid] >= yMP_TLP_Lixeiro){
		        DisablePlayerCheckpoint(playerid);
		        yMP_Infos[playerid] = 0;
				yMP_AddQntLP[playerid] = 0;
		        KillTimer(yMP_KillTimer[playerid]);
		        GivePlayerMoney(playerid,yMP_Valor[playerid]);
		        format(StrGeral, sizeof(StrGeral), "");
		        format(yMPStr, sizeof(yMPStr), "{FFFFFF}Você recebeu {33CC33}R$%i{FFFFFF} pelo Transporte\n",yMP_Valor[playerid]); strcat(StrGeral, yMPStr);
				strcat(StrGeral, "Você deseja continuar trabalhando?\n");
				return ShowPlayerDialog(playerid, DG_Prox_Serv, DIALOG_STYLE_MSGBOX, "{FF0000}[Lixeiro]", StrGeral, "Continuar", "Parar");
		    }
		    if(!IsPlayerInRangeOfPoint(playerid,5.0,yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2]))
		        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_Lixeiro[yAlet][0],yMP_PosR_Lixeiro[yAlet][1],yMP_PosR_Lixeiro[yAlet][2],4.0);
		    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Descarregando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Lixeiro);
		    GameTextForPlayer(playerid,yMPStr,1000,5);
	    }
    }
	return 1;
}
forward yMP_LPLenhador(playerid);
public yMP_LPLenhador(playerid){
    if(yMP_Emprego[playerid] == 6){
        new Keys,ud,lr;
        GetPlayerKeys(playerid,Keys,ud,lr);
		if(GetPlayerWeapon(playerid) == 9)
		    if(Keys == KEY_FIRE || Keys == KEY_WALK){
			    yMP_AddQntLP[playerid]++;
			    if(yMP_AddQntLP[playerid] >= yMP_TLP_Lenhador){
			        ClearAnimations(playerid);
					yMP_AddQntLP[playerid] = 0;
				    KillTimer(yMP_KillTimer[playerid]);
			        new yAlet = sizeof(yMP_PosR_Lenhad)-1;
			        SetPlayerCheckpoint(playerid, yMP_PosR_Lenhad[yAlet][0],yMP_PosR_Lenhad[yAlet][1],yMP_PosR_Lenhad[yAlet][2], 4.0);
			        yMP_Infos[playerid] = 1;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
					SetPlayerAttachedObject(playerid, 9, 19793, 1, 0.0, 0.0+0.45, 0.0,         5.50+90.0, 84.60+1.0, 83.7,         1.0, 1.0, 1.0,           -1);
			    }
			    if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_Pos[0][playerid],yMP_Pos[1][playerid],yMP_Pos[2][playerid])){
			        ClearAnimations(playerid);
			        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_Pos[0][playerid],yMP_Pos[1][playerid],yMP_Pos[2][playerid],2.0);
			    }
			    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Cortando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Lenhador);
			    GameTextForPlayer(playerid,yMPStr,1000,5);
		    }else GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~r~Voce nao esta com a motoserra~n~ligada",1000,5);
		else GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~r~Voce nao esta com a motoserra~n~nas maos",1000,5);
    }
	return 1;
}
forward yMP_LPPrancheiro(playerid);
public yMP_LPPrancheiro(playerid){
	if(yMP_Emprego[playerid] == 5){
	    if(yMP_Infos[playerid] == 0){
		    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
			if(!IsPlayerInAnyVehicle(playerid)) return yMPKillTimReset(playerid,"Você não está dentro de um Caminhão Prancha",yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2],4.0);
		    if(yMP_AddQntLP[playerid] >= yMP_TLP_Prancheiro){
		        yMP_Infos[playerid] = 1;
                yAlet = sizeof(yMP_PosR_Prancheiro)-1;
                yMP_PegouServ[playerid] = yAlet+1;
				yMP_AddQntLP[playerid] = 0;
				KillTimer(yMP_KillTimer[playerid]);
				SetPlayerCheckpoint(playerid, yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2], 4.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Prancheiro);
                yMP_Objs[0][playerid] = CreateObject(3571, 9999.0, 0.0,0.0,	0.0, 0.0, -90.2, 50.0);
                AttachObjectToVehicle(yMP_Objs[0][playerid], GetPlayerVehicleID(playerid), 0.0,  0.0-1.7,  0.0+1.05,  	0.0,  0.0,  -90.0);
				format(yMPStr, sizeof(yMPStr), "Você carregou o Caminhão Prancha! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
		    }
		    if(!IsPlayerInRangeOfPoint(playerid,6.0,yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2]))
		        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2],4.0);
		    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Carregando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Prancheiro);
		    GameTextForPlayer(playerid,yMPStr,1000,5);
	    }else{
		    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
		    if(yMP_AddQntLP[playerid] >= yMP_TLP_Prancheiro){
		        DestroyObject(yMP_Objs[0][playerid]);
    			yMP_Infos[playerid] = 0;
				yMP_AddQntLP[playerid] = 0;
				KillTimer(yMP_KillTimer[playerid]);
				GivePlayerMoney(playerid,yMP_Valor[playerid]);
				format(StrGeral, sizeof(StrGeral), "");
				format(yMPStr, sizeof(yMPStr), "{FFFFFF}Você recebeu {33CC33}R$%i\n",yMP_Valor[playerid]); strcat(StrGeral, yMPStr);
				strcat(StrGeral, "Você deseja continuar trabalhando?\n");
				ShowPlayerDialog(playerid, DG_Prox_Serv, DIALOG_STYLE_MSGBOX, "{FF0000}[Carreteiro Prancha]", StrGeral, "Continuar", "Parar");
		    }
		    if(!IsPlayerInRangeOfPoint(playerid,6.0,yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2]))
				return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_Prancheiro[yAlet][0],yMP_PosR_Prancheiro[yAlet][1],yMP_PosR_Prancheiro[yAlet][2],4.0);
		    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Descarregando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Prancheiro);
		    GameTextForPlayer(playerid,yMPStr,1000,5);
	    }
    }
	return 1;
}

forward yMP_LPCarrForte(playerid);
public yMP_LPCarrForte(playerid){
	if(yMP_Emprego[playerid] == 4){
	    if(yMP_Infos[playerid] == 0){
		    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
		    if(yMP_AddQntLP[playerid] >= yMP_TLP_CarFort){
		        yMP_Infos[playerid] = 1;
				yMP_AddQntLP[playerid] = 0;
		        KillTimer(yMP_KillTimer[playerid]);
                yAlet = sizeof(yMP_PosR_CarFort)-1;
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2], 4.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_CarFort);
                format(yMPStr, sizeof(yMPStr), "Você carregou o seu Carro Forte! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
		    }
		    if(!IsPlayerInRangeOfPoint(playerid,5.0,yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2]))
		        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2],4.0);
		    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Carregando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_CarFort);
		    GameTextForPlayer(playerid,yMPStr,1000,5);
	    }else{
		    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
		    if(yMP_AddQntLP[playerid] >= yMP_TLP_CarFort){
		        yMP_Infos[playerid] = 0;
				yMP_AddQntLP[playerid] = 0;
		        KillTimer(yMP_KillTimer[playerid]);
		        GivePlayerMoney(playerid,yMP_Valor[playerid]);
		        format(StrGeral, sizeof(StrGeral), "");
		        format(yMPStr, sizeof(yMPStr), "{FFFFFF}Você recebeu {33CC33}R$%i{FFFFFF} pelo Transporte\n",yMP_Valor[playerid]); strcat(StrGeral, yMPStr);
				strcat(StrGeral, "Você deseja continuar trabalhando?\n");
				return ShowPlayerDialog(playerid, DG_Prox_Serv, DIALOG_STYLE_MSGBOX, "{FF0000}[Carro Forte]", StrGeral, "Continuar", "Parar");
		    }
		    if(!IsPlayerInRangeOfPoint(playerid,5.0,yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2]))
		        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_CarFort[yAlet][0],yMP_PosR_CarFort[yAlet][1],yMP_PosR_CarFort[yAlet][2],4.0);
		    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Descarregando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_CarFort);
		    GameTextForPlayer(playerid,yMPStr,1000,5);
	    }
    }
	return 1;
}
forward yMP_LPCarreteiro(playerid);
public yMP_LPCarreteiro(playerid){
	if(yMP_Emprego[playerid] == 3){
	    if(yMP_Infos[playerid] == 0){
		    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
		    if(yMP_AddQntLP[playerid] >= yMP_TLP_Carreter){
		        yMP_Infos[playerid] = 1;
				yMP_AddQntLP[playerid] = 0;
		        KillTimer(yMP_KillTimer[playerid]);
                yAlet = random(sizeof(yMP_PosR_Carreter));
                if(yAlet == yMP_PegouServ[playerid]-1)
					if(yAlet == sizeof(yMP_PosR_Carreter)-1) yAlet -= 1;
					else yAlet += 1;
                yMP_PegouServ[playerid] = yAlet+1;
                SetPlayerCheckpoint(playerid, yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2], 4.0);
				new Float:Pos[3];   GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
                yMP_Valor[playerid] = floatround(yMP_GetDist(yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2] ,Pos[0],Pos[1],Pos[2]) * yMP_VAlor_Carreter);
                format(yMPStr, sizeof(yMPStr), "Você carregou a sua Carreta! Info: {33CC33}R$%i{FFFFFF} | {33CC33}%i{FFFFFF}/KM",yMP_Valor[playerid],	yMP_GetDist(yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2] ,Pos[0],Pos[1],Pos[2]));
				return SendClientMessage(playerid, 0xFFFFFFFF, yMPStr);
		    }
		    if(!IsPlayerInRangeOfPoint(playerid,8.0,yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2]))
		        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2],4.0);
		    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Carregando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Carreter);
		    GameTextForPlayer(playerid,yMPStr,1000,5);
	    }else{
		    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
		    if(yMP_AddQntLP[playerid] >= yMP_TLP_Carreter){
		        yMP_Infos[playerid] = 0;
				yMP_AddQntLP[playerid] = 0;
		        KillTimer(yMP_KillTimer[playerid]);
		        GivePlayerMoney(playerid,yMP_Valor[playerid]);
		        format(StrGeral, sizeof(StrGeral), "");
		        format(yMPStr, sizeof(yMPStr), "{FFFFFF}Você recebeu {33CC33}R$%i{FFFFFF} pelo Transporte\n",yMP_Valor[playerid]); strcat(StrGeral, yMPStr);
				strcat(StrGeral, "Você deseja continuar trabalhando?\n");
				return ShowPlayerDialog(playerid, DG_Prox_Serv, DIALOG_STYLE_MSGBOX, "{FF0000}[Carreteiro]", StrGeral, "Continuar", "Parar");
		    }
		    if(!IsPlayerInRangeOfPoint(playerid,8.0,yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2]))
		        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_Carreter[yAlet][0],yMP_PosR_Carreter[yAlet][1],yMP_PosR_Carreter[yAlet][2],4.0);
		    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Descarregando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Carreter);
		    GameTextForPlayer(playerid,yMPStr,1000,5);
	    }
    }
	return 1;
}

forward yMP_LPCorreios(playerid);
public yMP_LPCorreios(playerid){
	if(yMP_Emprego[playerid] == 2){
	    yMP_AddQntLP[playerid]++;   new yAlet = yMP_PegouServ[playerid]-1;
	    if(yMP_AddQntLP[playerid] >= yMP_TLP_Correio){
			ClearAnimations(playerid);
			yMP_AddQntLP[playerid] = 0;
	        KillTimer(yMP_KillTimer[playerid]);
	        GivePlayerMoney(playerid,yMP_Valor[playerid]);
	        format(StrGeral, sizeof(StrGeral), "");
	        format(yMPStr, sizeof(yMPStr), "{FFFFFF}Você recebeu {33CC33}R$%i{FFFFFF} pela entrega!\n",yMP_Valor[playerid]); strcat(StrGeral, yMPStr);
			strcat(StrGeral, "Você deseja continuar trabalhando?\n");
			return ShowPlayerDialog(playerid, DG_Prox_Serv, DIALOG_STYLE_MSGBOX, "{FF0000}[Correios]", StrGeral, "Continuar", "Parar");
	    }
	    if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_PosR_Correio[yAlet][0],yMP_PosR_Correio[yAlet][1],yMP_PosR_Correio[yAlet][2]))
	        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_PosR_Correio[yAlet][0],yMP_PosR_Correio[yAlet][1],yMP_PosR_Correio[yAlet][2],2.0);
	    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Entregando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Correio);
	    GameTextForPlayer(playerid,yMPStr,1000,5);
    }
	return 1;
}
forward yMP_LPEletrcista(playerid);
public yMP_LPEletrcista(playerid){
    if(yMP_Emprego[playerid] == 1){
	    yMP_AddQntLP[playerid]++;
	    if(yMP_AddQntLP[playerid] >= yMP_TLP_Eletrec){
	        for(new i = 0; i < sizeof(yMP_Objs); i++) if(IsValidObject(yMP_Objs[i][playerid])) DestroyObject(yMP_Objs[i][playerid]);
			ClearAnimations(playerid);
			yMP_AddQntLP[playerid] = 0;
	        KillTimer(yMP_KillTimer[playerid]);
	        GivePlayerMoney(playerid,yMP_Valor[playerid]);
	        format(StrGeral, sizeof(StrGeral), "");
	        format(yMPStr, sizeof(yMPStr), "{FFFFFF}Você recebeu {33CC33}R$%i{FFFFFF} pelo serviço feito!\n",yMP_Valor[playerid]); strcat(StrGeral, yMPStr);
			strcat(StrGeral, "Você deseja continuar trabalhando?\n");
			return ShowPlayerDialog(playerid, DG_Prox_Serv, DIALOG_STYLE_MSGBOX, "{FF0000}[Eletricista]", StrGeral, "Continuar", "Parar");
	    }
	    if(!IsPlayerInRangeOfPoint(playerid,2.0,yMP_Pos[0][playerid],yMP_Pos[1][playerid],yMP_Pos[2][playerid])){
	        ClearAnimations(playerid);
	        return yMPKillTimReset(playerid,"Você afastou do local!",yMP_Pos[0][playerid],yMP_Pos[1][playerid],yMP_Pos[2][playerid],2.0);
	    }
	    format(yMPStr, sizeof(yMPStr), "~n~~n~~n~~n~~n~~r~~w~Reparando~n~~r~%i~w~/~g~%i", yMP_AddQntLP[playerid],yMP_TLP_Eletrec);
	    GameTextForPlayer(playerid,yMPStr,1000,5);
    }
	return 1;
}



stock yMPErrTempoServ(playerid){
    format(yMPStr, sizeof(yMPStr), "Você pegou um serviço recentemente! Aguarde %i/Segs!",yMP_TempPegar[playerid] - gettime());
	return SendClientMessage(playerid, 0xFF0000FF, yMPStr);
}
stock yMPKillTimReset(playerid,string[],Float:X,Float:Y,Float:Z,Float:Radiau){
	if(yMP_AddQntLP[playerid] != 0){
		yMP_AddQntLP[playerid] = 0;
		KillTimer(yMP_KillTimer[playerid]);
	}
	if(Radiau != 0.0) SetPlayerCheckpoint(playerid, X,Y,Z, Radiau);
	if(yMP_TempPegar[playerid] < gettime()){
		yMP_TempPegar[playerid] = gettime()+2;
		SendClientMessage(playerid, 0xFF0000FF, string);
	}
	return 1;
}
stock yMPDellCarrosEmpre(playerid){
	DestroyVehicle(yMP_Carro[playerid]);
	yMP_Carro[playerid] = 0;
	if(yMP_Bau[playerid] != 0){
		DestroyVehicle(yMP_Bau[playerid]);
		yMP_Bau[playerid] = 0;
	}
	return SendClientMessage(playerid, 0x33CC33FF, "Seu veiculo foi deletado!");
}
stock yMPPararDeTrabalhar(playerid){
	if(yMP_Emprego[playerid] == 6){
		if(yMP_PegouServ[playerid] != 0)
			RemovePlayerAttachedObject(playerid, 9),
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	}
	yMP_PegouServ[playerid] = 0;
	SetPlayerSkin(playerid,yMP_Skin[playerid]);
	return SendClientMessage(playerid, 0xFF0000FF, "Você parou de trabalhar!");
}
stock yMP_GetDist(Float:x1, Float:y1, Float:z1, 	Float:x2, Float:y2, Float:z2)
	return floatround(floatsqroot(((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)) + ((z1 - z2) * (z1 - z2))));
