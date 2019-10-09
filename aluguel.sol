pragma solidity 0.5.12;

// comentario de contrato primeiro - o // implica comentário em uma mesma linha, não precisa fechar, apenas começar com //

contract Aluguel {
    
    /* teste comentario
    quando ultrapassa uma linha, é preciso abrir e fechar
    string = "texto" dentro de aspas
    uint = numero inteiro 
    adress = endereço ethereum
    bool = verdadeiro ou falso
    uint256 constant = não muda
    */
    
    string public locatario;
    string public locador;
    uint256 private valor;
    uint256 constant numeroMaximoLegalDeAlugueisParaMulta = 3;
    constructor(
        string memory nomeLocador, 
        string memory nomeLocatario,
        uint256 valorDoAluguel)
    public {
        locador = nomeLocador;
        locatario = nomeLocatario;
        valor = valorDoAluguel;
        
    }
    function valorAtualDoAluguel () public view returns (uint256) {
        return valor;
    }
    
    function simulaMulta ( uint256 mesesRestantes, uint256 totalMesesContrato) public view returns (uint256 valorMulta) 
    {
        valorMulta = valor*numeroMaximoLegalDeAlugueisParaMulta;
        valorMulta = valorMulta/totalMesesContrato;
        valorMulta = valorMulta*mesesRestantes;
        return valorMulta;
    }
    
    function reajusteAluguel (uint256 percentualReajuste) public
    {
        if (percentualReajuste > 20)
        {
            percentualReajuste = 20;
        }
        
        
        uint256 valorDoAcrescimo = 0;
        valorDoAcrescimo = (valor*percentualReajuste)/100;
        valor = valor + valorDoAcrescimo;
    }
    function aditamentoValorAluguel(uint256 valorCerto) public
    {
        valor = valorCerto;
        
    }
    
    function aplicaMulta (uint256 mesesRestantes, uint256 percentual) public
    {
        require (mesesRestantes<30, "Periodo de contrato invalido");
        for (uint i=1; i<mesesRestantes; i++) {
            valor = valor+((valor*percentual)/100);
        }
    }

    
}
