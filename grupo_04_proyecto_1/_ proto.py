#The algorithm solution in the prototyping language
#Grupo 04

def multiplica(multiplicando,multiplicador):
    #starting values
    SHL,i,suma,resultado=0,0,0,multiplicador
    #Remove all multiples (2 ^ n) from the multiplier.
    #PD: enter decimals, exit binaries.
    while multiplicador != 0:
        while resultado != 1:
            resultado = resultado // 2
            SHL +=1
        #If it finds a multiple, it moves the value with SHL and autosum.
        suma += multiplicando<<SHL
        #I take the remainder and keep looking for multiples of type 2 ^ n
        multiplicador = multiplicador - 2**SHL
        resultado=multiplicador
        i+=1
        #restart the SHL
        SHL = 0
    #I print the residue in binary form.
    print((bin(suma)[2:]).zfill(16))
#Call
multiplica(255,255)


#Other Solucion
##Professor, if you have time, we also present this other solution, for a little more feedback. Thank you.
"""
def multiplicar2(multiplicando,multiplicador):

    #start values
    #PD: the multiplier enters as binary, but the multiplying is decimal.
    inicio,SHL,resultado = 7,0,0
    #convert multiplier to binary 1byte.
    b=str(bin(multiplicador)[2:]).zfill(8)
    #Run the array back and forth, if it finds a '0' the SHL
    #save the value of the times that needs to be delayed
    #When it finds a '1' it displaces the multiplying the quantities it has in SHL
    while SHL != 8:
        if b[inicio] == '1':
            #SHL <<
            resultado += multiplicando<<SHL
        SHL += 1
        inicio -=1
    #The remainder passes it to binary and prints it.
    print((bin(resultado)[2:]).zfill(16))
multiplicar2(56,10)
"""