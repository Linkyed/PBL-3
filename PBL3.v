module PBL3 (CH0, CH1, clk, OUT, dig0, dig1, dig2, dig3);
	input CH0, CH1, clk;
	output [6:0]OUT;
	output dig0, dig1, dig2, dig3;
	
	
	wire [3:0] unidade_gar, dezena_gar, unidade_r;
	wire [2:0] quant_recargas;
	wire [6:0] SEG_unidade_gar, SEG_dezena_gar, SEG_dezena_rolha, SEG_unidade_rolha;
	wire [1:0] sel_7seg, dezena_r;
	wire unidade_completa_gar, dig0_inv, dig1_inv, dig2_inv, dig3_inv;
	
	contador_3bit_padrao recargas_disponiveis (recarga_auto, CH1, quant_recargas);
	
	nand And4 (pode_recaregar, quant_recargas[0], quant_recargas[1], quant_recargas[2]);
	nand And0 (r_zerada, ~unidade_r[0], ~unidade_r[1], ~unidade_r[2], ~unidade_r[3], ~dezena_r[0], ~dezena_r[1]);
	and And1 (pode_diminuir, CH0, r_zerada);
	
	contador_4bit_desc_lim5 cont_unidade_rolha (pode_diminuir, CH1, unidade_r);
	
	and And2 (unidade_completa_r, unidade_r[0], ~unidade_r[1], ~unidade_r[2], unidade_r[3]);
	and And3 (minimo_rolhas, unidade_r[0], ~unidade_r[1], unidade_r[2], ~unidade_r[3], ~dezena_r[0], ~dezena_r[1]);
	and And5 (recarga_auto, minimo_rolhas, pode_recaregar);
	
	contador_2bit_desc_lim2 cont_dezena_rolha (unidade_completa_r, recarga_auto, dezena_r);
	
	decod_numeros_7seg_0a9 decod_unidade_r (unidade_r[3], unidade_r[2], unidade_r[1], unidade_r[0], SEG_unidade_rolha[1], 
	SEG_unidade_rolha[2], SEG_unidade_rolha[3], SEG_unidade_rolha[4], SEG_unidade_rolha[5], SEG_unidade_rolha[6]);
	
	decod_numeros_7seg_0a3 decod_dezena_r (dezena_r[1], dezena_r[0], SEG_dezena_rolha[1], 
	SEG_dezena_rolha[2], SEG_dezena_rolha[3], SEG_dezena_rolha[4], SEG_dezena_rolha[5], SEG_dezena_rolha[6]);
	
	
	// CONTADORES DE 4 BITS COM RESET AO CHEGAR NO NUMERO 10(1010) em binario
	contador_4bit_asc_lim9 cont_unidade_gar (CH0, unidade_gar, unidade_completa_gar);
	contador_4bit_asc_lim9 cont_dezena_gar (unidade_completa_gar, dezena_gar);
	
	// DECODIFICADORES DE ENTRADAS DE 4 BITS PARA SAIDAS DE 7 BITS, USADOS PARA REPRESENTAR OS NUMEROS DE 0 A 9 NO MOSTRADOR DE 7 SEGMENTOS
	decod_numeros_7seg_0a9 decod_unidade_gar (unidade_gar[3], unidade_gar[2], unidade_gar[1], unidade_gar[0], SEG_unidade_gar[0], SEG_unidade_gar[1], 
	SEG_unidade_gar[2], SEG_unidade_gar[3], SEG_unidade_gar[4], SEG_unidade_gar[5], SEG_unidade_gar[6]);
	
	decod_numeros_7seg_0a9 decod_dezena_gar (dezena_gar[3], dezena_gar[2], dezena_gar[1], dezena_gar[0], SEG_dezena_gar[0], SEG_dezena_gar[1], SEG_dezena_gar[2], 
	SEG_dezena_gar[3], SEG_dezena_gar[4], SEG_dezena_gar[5], SEG_dezena_gar[6]);
	
	// CONTADOR DE 2 BITS
	contador_2bit_asc cont_dig_7seg (clk, 0, sel_7seg);
	
	
	// DECODIFICADOR 2 PRA 4 PARA LIGAR OS DIGITOS DO MOSTRADOR DE 7 SEGMENTOS NA ORDEM CORRETA
	decod_2_4 decod_dig_7seg (sel_7seg[0], sel_7seg[1], dig0_inv, dig1_inv, dig2_inv, dig3_inv);
	assign dig0 = ~dig0_inv;
	assign dig1 = ~dig1_inv;
	assign dig2 = ~dig2_inv;
	assign dig3 = ~dig3_inv;
	
	// MULTIPLEXADOR 4 PRA 1 PRA EXIBIR AS UNIDADES E DEZENAS DE DUZIAS DE GARRAFAZ PRODUZIDAS NO MOSTRADOR
	MUX_4_1 mux_4_1_7seg (SEG_dezena_gar, SEG_unidade_gar, SEG_dezena_rolha, SEG_unidade_rolha, sel_7seg, OUT);

	
endmodule