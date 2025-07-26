programa
{
	
	funcao inicio()
	{
		caracter jogo[3][3]
		caracter sinal 
		inteiro linha, coluna 
		logico parar
		
		parar = falso
		
		enquanto(nao parar)
		{
			escreva("Digite o sinal (O ou X) ou P para parar")
			leia(sinal)

			se(sinal == 'P')
			{
				parar = verdadeiro
			}
			senao
			{
				escreva("digite a linha (0-2)")
				leia (linha)

				escreva("digite a coluna (0-2)")
				leia(coluna)

				se(sinal != 'O' e sinal != 'X'
				ou(linha < 0 ou linha  > 2)
				ou (coluna < 0 ou coluna > 2)
				)

				{
					escreva("entrada invalida")
				}
				senao
				{ 
					jogo[linha][coluna] = sinal
				}
				escreva("O jogo atual é esse: ")
				para(inteiro i = 0; i< 3; i++)
				{
					para(inteiro j = 0; j<3; j++)
					{
						escreva(jogo[i][j] , " ")
					}
					escreva("\n")
					}
				}
			}
		}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 799; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */