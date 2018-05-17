-- Tabela Cliente
CREATE TABLE TB_CLIENTE{
    ID INT,
    Nome VARCHAR(100),
    Municipio VARCHAR(100),
    UF VARCHAR(2),

    PRIMARY KEY (ID)
}



-- Tabela TipoCultivo
CREATE TABLE TB_TIPO_CULTIVO{
    ID INT,
    Descricao VARCHAR(20),

    PRIMARY KEY (ID)
}



-- Tabela Lavoura
CREATE TABLE TB_LAVOURA{
    ID INT,
    NomeTalhao VARCHAR(100),
    Espacamento DOUBLE(10,2),
    Populacao DOUBLE(10,2),
    CulturaAntecessora VARCHAR(100),
    MeioCultivo VARCHAR(100),
    TamanhoColhido DOUBLE(10,2),

    ClienteID INT,
    TipoCultivoID INT,
    
    PRIMARY KEY (ID)
}

ALTER TABLE TB_LAVOURA ADD CONSTRAINT FK_Lavoura_ClienteID FOREIGN KEY (ClienteID) REFERENCES TB_CLIENTE(ID)
ALTER TABLE TB_LAVOURA ADD CONSTRAINT FK_Lavoura_TipoCultivoID FOREIGN KEY (TipoCultivoID) REFERENCES TB_TIPO_CULTIVO(ID)



-- Tabela Produto Yara
CREATE TABLE TB_PRODUTO_YARA{
    ID INT,
    Produto VARCHAR(100),
    Fabricante VARCHAR(100),
    Dose DOUBLE(10,2),
    CustoProduto DOUBLE(10,2),

    PRIMARY KEY (ID)
}



-- Tabela Produto Atual
CREATE TABLE TB_PRODUTO_ATUAL{
    ID INT,
    Produto VARCHAR(100),
    Fabricante VARCHAR(100),
    Dose DOUBLE(10,2),
    CustoProduto DOUBLE(10,2),

    PRIMARY KEY (ID)
}



-- Tabela Tratamento Yara
CREATE TABLE TB_TRATAMENTO_YARA{
    ID INT,
    LavouraID INT,
    Foto VARCHAR(100),
    CustoTratamento DOUBLE(10,2),
    ProdutividadeTratamento DOUBLE(10,2),
    ProdutoYaraID INT,

    PRIMARY KEY (ID)
}

ALTER TABLE TB_TRATAMENTO_YARA ADD CONSTRAINT FK_TratamentoYara_LavouraID FOREIGN KEY (LavouraID) REFERENCES TB_LAVOURA(ID)
ALTER TABLE TB_TRATAMENTO_YARA ADD CONSTRAINT FK_TratamentoYara_ProdutoYaraID FOREIGN KEY (ProdutoYaraID) REFERENCES TB_PRODUTO_YARA(ID)



-- Tabela Tratamento Atual
CREATE TABLE TB_TRATAMENTO_ATUAL{
    ID INT,
    LavouraID INT,
    Foto VARCHAR(10),
    CustoTratamento DOUBLE(10,2),
    ProdutividadeTratamento DOUBLE(10,2),
    ProdutoAtualID INT,

    PRIMARY KEY (ID)
}

ALTER TABLE TB_TRATAMENTO_ATUAL ADD CONSTRAINT FK_TratamentoAtual_LavouraID FOREIGN KEY (LavouraID) REFERENCES TB_LAVOURA(ID)
ALTER TABLE TB_TRATAMENTO_ATUAL ADD CONSTRAINT FK_TratamentoAtual_ProdutoAtualID FOREIGN KEY (ProdutoAtualID) REFERENCES TB_PRODUTO_ATUAL(ID)



-- Tabela Relatorio
CREATE TABLE TB_RELATORIO{
    ID INT,
    
    ClienteID INT,
    LavouraID INT,
    TratamentoAtualID INT,
    TratamentoYaraID INT,

    PRIMARY KEY (ID)
}

ALTER TABLE TB_RELATORIO ADD CONSTRAINT FK_Relatorio_ClienteID FOREIGN KEY (ClienteIDXXX) REFERENCES TB_CLIENTE(ID)
ALTER TABLE TB_RELATORIO ADD CONSTRAINT FK_Relatorio_LavouraID FOREIGN KEY (LavouraID) REFERENCES TB_LAVOURA(ID)
ALTER TABLE TB_RELATORIO ADD CONSTRAINT FK_Relatorio_TratamentoAtualID FOREIGN KEY (TratamentoAtualID) REFERENCES TB_TRATAMENTO_ATUAL(ID)
ALTER TABLE TB_RELATORIO ADD CONSTRAINT FK_Relatorio_TratamentoYaraID FOREIGN KEY (TratamentoYaraID) REFERENCES TB_TRATAMENTO_YARA(ID)
