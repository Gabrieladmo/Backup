//------------------0608---------------------//

BEGIN{
    print "TIPOS DE ARQUIVOS"
    nRegLidos=0
    nRegTotal=0
    nRegTam0=0
    nRegDir=0
    nRegCom=0
    nRegOut=0
    tamMedio=0
}

NF >= 8{
    if($5 > 0){
	nRegLidos++
	if(substr($1,1,1)== "d"){
	    nRegDir++
	    print "Tipo: Diretorio Nome: ",$8," Tamanho: ",$5
	}else if(substr($1,1,1)== "-"){
	    nRegCom++
	    tamMedio = tamMedio + $5
	    print "Tipo: COMUM     Nome: ",$8," Tamanho: ",$5
	}else{
	    nRegOut++
	    print "Tipo: OUTROS    Nome: ",$8,"Tamanho: ",$5
	}
    }
}

{
    nRegTotal++
    if($5 == 0){
	nRegTam0++
    }
}

END{
    print "Tot Reg Lid: ",nRegTotal
    print "Tot Reg N Ign: ",nRegLidos
    print "Tot Reg Tam 0: ",nRegTam0
    print "Tot Reg Dir: ",nRegDir
    print "Tot Reg Com: ",nRegCom
    print "Tot Reg Out: ",nRegOut
    print "Tam Medio Arq Com: ",tamMedio/nRegCom
    print "É NÓIS"
}

//------------------0608---------------------//

BEGIN{
    print "TIPOS DE ARQUIVO"
    contTotal=0
    contNIgn=0
    contZero=0
    contDir=0
    contComum=0
    contOutros=0
    tamComum=0
}

NF >= 8{
    if($5 > 0){
	contNIgn++
	tipoArq = substr($1, 1, 1)
	if(tipoArq == "d"){
	    contDir++
	    tipoArq = "Diretorio"
	}else if(tipoArq == "-"){
	    contComum++
	    tamComum = tamComum + $5
	    tipoArq = "Comum"
	}else{
	    contOutros++
	    tipoArq = "Outros"
	}
	#print "Tipo: ", tipoArq, " Nome: ", $8, " Tamanho: ", $5
	printf("Tipo: %-10s Nome: %-25s Tamanho: %d\n", tolower(tipoArq), $8, $5)
    }
}

{
    contTotal++
    if($5 == 0){
	contZero++
    }
}

END{
    print "Nº total de reg. lidos: ", contTotal
    print "Nº total de reg. nao ignorados: ", contNIgn
    print "Nº total de reg. tam zero: ", contZero
    print "Nº total de reg. diretorio: ", contDir
    print "Nº total de reg. comum: ", contComum
    print "Nº total de reg. outros: ", contOutros
    print "Tamanho medio dos arquivos comuns: ", tamComum/contComum
}

