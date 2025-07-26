programa  
{  
    funcao inicio()  
    {  
        // Declaração de variáveis  
        cadeia nome, vegetariano, dieta, pagamento  

        // Entrada de dados  
        escreva("Digite seu nome: ")  
        leia(nome)  

        escreva("Você é vegetariano? (sim/não): ")  
        leia(vegetariano)  

        escreva("Você está em dieta? (sim/não): ")  
        leia(dieta)  

        // Definição do prato sugerido  
        se (dieta == "sim" e vegetariano == "sim")  
        {  
            escreva("Olá ", nome, ", sugerimos que experimente nossa salada ao molho rose.\n")  
        }  
        senao se (dieta == "sim" e vegetariano == "não")  
        {  
            escreva("Olá ", nome, ", sugerimos que experimente nosso frango grelhado.\n")  
        }  
        senao se (dieta == "não" e vegetariano == "sim")  
        {  
            escreva("Olá ", nome, ", sugerimos que experimente nosso macarrão de tomates.\n")  
        }  
        senao  
        {  
            escreva("Olá ", nome, ", sugerimos que experimente nossa lasanha de berinjela.\n")  
        }  

        // Opção de pagamento  
        escreva("Você deseja pagar em dinheiro ou cartão? (dinheiro/cartão): ")  
        leia(pagamento)  

        se (pagamento == "dinheiro")  
        {  
            escreva("Você ganhou 15% de desconto!\n")  
        }  
    }  
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 580; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */