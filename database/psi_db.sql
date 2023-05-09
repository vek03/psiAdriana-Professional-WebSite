-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Maio-2023 às 03:31
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `psi_db`
--
CREATE DATABASE IF NOT EXISTS `psi_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `psi_db`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_adm` int(11) NOT NULL,
  `user` varchar(15) NOT NULL,
  `senha` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela que armazenará os dados dos administradores do site.';

--
-- Extraindo dados da tabela `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_adm`, `user`, `senha`) VALUES
(1, '@vek', '123456'),
(2, '@cabral', '123456'),
(3, '@mari', '123456'),
(4, '@psiAdriana', '123456');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_coments`
--

CREATE TABLE `tbl_coments` (
  `id_commit` int(11) NOT NULL,
  `id_prod` int(14) NOT NULL,
  `user` varchar(50) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela que armazenará os comentários sobre os produtos.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_produto`
--

CREATE TABLE `tbl_produto` (
  `id_prod` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `descr` longtext NOT NULL,
  `valor` double NOT NULL,
  `dt_lanc` int(4) NOT NULL,
  `num_pag` int(10) NOT NULL,
  `publico` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela que armazenará os dados dos produtos.';

--
-- Extraindo dados da tabela `tbl_produto`
--

INSERT INTO `tbl_produto` (`id_prod`, `title`, `descr`, `valor`, `dt_lanc`, `num_pag`, `publico`, `img`, `link`) VALUES
(1, 'EBOOK RE.VIVA', 'O Ebook RE.VIVA é um recurso terapêutico para ser utilizado por profissionais ou pela própria pessoa. Seu diferencial é que qualquer pessoa acima dos doze anos pode fazer uso.\r\n\r\nO Ebook RE.VIVA reúne mais de trinta ferramentas com exercícios de AUTOCONHECIMENTO e realização simples, prazerosa e inspiradora. Nessa jornada você vai SE DESCOBRIR e entender quais passos você precisa dar para trabalhar sua AUTOESTIMA e seu AMOR PRÓPRIO.\r\n\r\nA cada atividade você se surpreenderá com o resultado.\r\nRE.VIVA!', 29.99, 2022, 50, 'Mulheres', 'img/2.png', 'https://p.eduzz.com/1836586'),
(2, '5 PASSOS PARA TER AUTOESTIMA', 'Mais do que estar satisfeito com a imagem física, a AUTOESTIMA tem relações com entender a si próprio, conhecer os seus pontos fortes e ser seguro de si. Ela é fundamental para todos os aspectos da vida de uma pessoa: nos relacionamentos, saúde e, também na vida profissional. Esse ebook além de ter um questionário que vai te ajudar a saber como está sua autoestima, ele vai te auxiliar a desenvolve-la em apenas cinco passos.', 0, 2022, 34, 'Mulheres', 'img/1.png', 'https://p.eduzz.com/1836603'),
(3, 'TABULEIRO DAS EMOÇÕES', 'O tabuleiro das emoções é um jogo onde a criança vai poder falar dos seus sentimentos e emoções de uma forma leve e divertida. E o melhor, dá pra toda a família se divertir junta.', 0, 2022, 56, 'Mulheres', 'img/3.png', 'https://p.eduzz.com/1836612');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_adm`);

--
-- Índices para tabela `tbl_coments`
--
ALTER TABLE `tbl_coments`
  ADD PRIMARY KEY (`id_commit`),
  ADD KEY `commit-prod` (`id_prod`);

--
-- Índices para tabela `tbl_produto`
--
ALTER TABLE `tbl_produto`
  ADD PRIMARY KEY (`id_prod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_adm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbl_coments`
--
ALTER TABLE `tbl_coments`
  MODIFY `id_commit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbl_produto`
--
ALTER TABLE `tbl_produto`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbl_coments`
--
ALTER TABLE `tbl_coments`
  ADD CONSTRAINT `commit-prod` FOREIGN KEY (`id_prod`) REFERENCES `tbl_produto` (`id_prod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
