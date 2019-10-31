pragma solidity 0.5.12;

contract AtaDeConstatacaoDeConta {
    
     struct dados {
        address enderecoDoTabeliao;
        address enderecoDoRequerente;
        string comarca;
        string nomeDoCartorio;
        string numeroDoLivro;
        string numeroDaFolhaDoLivro;
        bool aprovado;
        uint dataDaConstatacao;
    }
    
    address contaDoTabeliao = 0xa5CC5Be1a3E85Cd072D624A0528749fF4d13398F;

    mapping(address=>dados) public contaDoRequerente;
    
        
    function registro(
        string memory Cidade, 
        string memory Cartorio, 
        string memory Livro, 
        string memory Folha
        ) 
        public 
        returns (bool)
        {
        
        dados memory req=dados(0x0000000000000000000000000000000000000000, msg.sender, Cidade, Cartorio, Livro, Folha, false, 0);
        contaDoRequerente [msg.sender]=req;
        return true;
    }
    
    function aprovar (address _contaDoRequerente) public returns (bool) 
    {
        require (msg.sender == contaDoTabeliao, "Somente o Tabeliao"); 
        contaDoRequerente[_contaDoRequerente].enderecoDoTabeliao = msg.sender;
        contaDoRequerente[_contaDoRequerente].aprovado = true;
        contaDoRequerente[_contaDoRequerente].dataDaConstatacao = now;
    }
    
    
        
}
