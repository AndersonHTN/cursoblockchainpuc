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
    
    function simulaMulta ( uint256 mesesRestantes,
                    uint256 totalMesesContrato)
    public
    view
    returns (uint256 valorMulta) {
        
        valorMulta = valor*numeroMaximoLegalDeAlugueisParaMulta;
        valorMulta = valorMulta/totalMesesContrato;
        valorMulta = valorMulta*mesesRestantes;
        
        return valorMulta;
    }
}

