programa
{
    funcao inicio()
    {
        inteiro i, clientesComDesconto = 0
        real descontoDia, totalRecebido = 0.0
        cadeia nomes[6]
        real valores[6], valorFinal[6]

        escreva("Qual o valor do desconto do dia? ")
        leia(descontoDia)

        para (i = 0; i < 6; i++)
        {
            escreva("\nQual o nome do cliente? ")
            leia(nomes[i])

            escreva("Quanto ", nomes[i], " gastou na loja? ")
            leia(valores[i])

            se(valores[i] > 100)
            {
                valorFinal[i] = valores[i] - descontoDia
                clientesComDesconto++
            }
            senao
            {
                valorFinal[i] = valores[i]
            }
            
            totalRecebido += valorFinal[i]
        }

        escreva("\nResumo das compras:\n")
        para (i = 0; i < 6; i++)
        {
            se (valores[i] > 100)
            {
                escreva(nomes[i], " recebeu desconto. Valor total (com o desconto): ", valorFinal[i], "\n")
            }
            senao
            {
                escreva(nomes[i], " não recebeu desconto. Valor total: ", valorFinal[i], "\n")
            }
        }
        escreva("\nValor total recebido pela loja: ", totalRecebido)
        escreva("\nQuantidade de clientes que receberam desconto: ", clientesComDesconto)
        escreva("\nPrograma finalizado.\n")
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 794; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */