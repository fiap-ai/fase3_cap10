-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'estados'
-- Informações dos estados brasileiros
-- ---

DROP TABLE IF EXISTS `estados`;
		
CREATE TABLE `estados` (
  `id_estado` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `sigla` CHAR(2) NOT NULL DEFAULT 'NULL',
  `nome` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `regiao` VARCHAR(20) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id_estado`)
) COMMENT 'Informações dos estados brasileiros';

-- ---
-- Table 'produtos'
-- Cadastro de produtos agrícolas
-- ---

DROP TABLE IF EXISTS `produtos`;
		
CREATE TABLE `produtos` (
  `id_produto` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR(100) NOT NULL DEFAULT 'NULL',
  `categoria` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `unidade_area` VARCHAR(10) NOT NULL DEFAULT 'ha',
  `unidade_producao` VARCHAR(10) NOT NULL DEFAULT 't',
  `unidade_produtividade` VARCHAR(10) NOT NULL DEFAULT 'kg/ha',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produto`)
) COMMENT 'Cadastro de produtos agrícolas';

-- ---
-- Table 'safras'
-- Períodos de safra agrícola
-- ---

DROP TABLE IF EXISTS `safras`;
		
CREATE TABLE `safras` (
  `id_safra` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `ano_inicial` INTEGER NOT NULL DEFAULT NULL,
  `ano_final` INTEGER NOT NULL DEFAULT NULL,
  `periodo` VARCHAR(20) NOT NULL DEFAULT 'NULL',
  `descricao` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_safra`)
) COMMENT 'Períodos de safra agrícola';

-- ---
-- Table 'producao'
-- Dados de produção agrícola
-- ---

DROP TABLE IF EXISTS `producao`;
		
CREATE TABLE `producao` (
  `id_producao` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `id_estado` INTEGER NOT NULL DEFAULT NULL,
  `id_produto` INTEGER NOT NULL DEFAULT NULL,
  `id_safra` INTEGER NOT NULL DEFAULT NULL,
  `area_plantada` DECIMAL(12,2) NULL DEFAULT NULL,
  `produtividade` DECIMAL(12,2) NULL DEFAULT NULL,
  `producao` DECIMAL(12,2) NULL DEFAULT NULL,
  `data_coleta` DATE NOT NULL DEFAULT 'NULL',
  `fonte` VARCHAR(50) NOT NULL DEFAULT 'CONAB',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producao`)
) COMMENT 'Dados de produção agrícola';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `producao` ADD FOREIGN KEY (id_estado) REFERENCES `estados` (`id_estado`);
ALTER TABLE `producao` ADD FOREIGN KEY (id_produto) REFERENCES `produtos` (`id_produto`);
ALTER TABLE `producao` ADD FOREIGN KEY (id_safra) REFERENCES `safras` (`id_safra`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `estados` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `produtos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `safras` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `producao` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `estados` (`id_estado`,`sigla`,`nome`,`regiao`) VALUES
-- ('','','','');
-- INSERT INTO `produtos` (`id_produto`,`nome`,`categoria`,`unidade_area`,`unidade_producao`,`unidade_produtividade`,`created_at`,`updated_at`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `safras` (`id_safra`,`ano_inicial`,`ano_final`,`periodo`,`descricao`) VALUES
-- ('','','','','');
-- INSERT INTO `producao` (`id_producao`,`id_estado`,`id_produto`,`id_safra`,`area_plantada`,`produtividade`,`producao`,`data_coleta`,`fonte`,`created_at`,`updated_at`) VALUES
-- ('','','','','','','','','','','');