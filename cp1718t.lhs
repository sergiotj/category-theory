\documentclass[a4paper]{article}
\usepackage[a4paper,left=2cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1718t}
\usepackage{subcaption}
\usepackage{adjustbox}
%================= lhs2tex=====================================================%
%include polycode.fmt
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format for f i = "\mathsf{for}\ " f "\ " i
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format above = "\textsuperscript{*}"

%---------------------------------------------------------------------------

\title{
       	    Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2017/18
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex

\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 16
\\\hline
a77730 & Sérgio Jorge
\\
a77870 & Vítor Castro
\\
a79116 & Marcos Pereira
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.

Na sequência pedagógica dos planos de estudo dos dois cursos que têm esta
disciplina, restringe-se a aplicação deste método à programação funcional
em \Haskell. Assim,
o presente trabalho prático coloca os alunos perante problemas
concretos que deverão ser implementados em \Haskell.
Há ainda um outro objectivo: o de ensinar a documentar programas e
a produzir textos técnico-científicos de qualidade.

\section{Documentação}
Para cumprir de forma integrada os objectivos enunciados acima vamos recorrer
a uma técnica de programa\-ção dita ``\litp{literária}'' \cite{Kn92}, cujo
princípio base é o seguinte:
\begin{quote}\em
Um programa e a sua documentação devem coincidir.
\end{quote}
Por outras palavras, o código fonte e a documentação de um programa deverão estar no
mesmo ficheiro.

O ficheiro \texttt{cp1718t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1718t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1718t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1718t.lhs > cp1718t.tex
    $ pdflatex cp1718t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1718t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1718t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable #-}
import Cp
import List  hiding (fac)
import Nat
import Probability hiding (cond)
import BMP

import Data.List
import Data.Typeable
import Data.Ratio
import Data.Bifunctor
import Data.Maybe
import Data.Matrix hiding ((!))
import Test.QuickCheck hiding ((><),choose)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import GHC.IO.Exception
import Codec.Picture.Types
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1718t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1718t.aux
    $ makeindex cp1718t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell, a biblioteca
\href{https://hackage.haskell.org/package/JuicyPixels}{JuicyPixels} para processamento
de imagens e a biblioteca \href{http://gloss.ouroborus.net/}{gloss} para geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck JuicyPixels gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}

\section*{Problema 1}

Segundo uma \href{https://www.jn.pt/economia/interior/compra-diaria-de-bitcoins-iguala-acoes-da-apple-9257302.html}{notícia do Jornal de Notícias},
referente ao dia 12 de abril, \emph{``apenas numa hora, foram transacionadas 1.2 mil milhões de dólares em bitcoins. Nas últimas 24 horas, foram transacionados 8,5 mil milhões de dólares, num total de 24 mil milhões de dólares referentes às principais criptomoedas''}.

De facto, é inquestionável que as criptomoedas, e em particular as bitcoin, vieram para ficar.
%
Várias moedas digitais, e em particular as bitcoin, usam a tecnologia de block chain
para guardar e assegurar todas as transações relacionadas com a moeda.
%
Uma \href{https://en.bitcoin.it/wiki/Block_chain}{block chain} é uma coleção de blocos que registam os movimentos da moeda; a sua definição em Haskell é apresentada de seguida.

\begin{spec}
data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Block}{bloco} numa block chain
regista um número (mágico) único, o momento da execução, e uma lista de transações,
tal como no código seguinte:

\begin{spec}
type Block = (MagicNo, (Time, Transactions))
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Transaction}{transação}
define a entidade de origem da transferência, o valor a ser transacionado,
e a entidade destino (por esta ordem), tal como se define de seguida.

\begin{spec}
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
\end{spec}

A partir de uma block chain, é possível calcular o valor que cada entidade
detém, tipicamente designado de ledger:

\begin{spec}
type Ledger = [(Entity, Value)]
\end{spec}

Seguem as restantes definições Haskell para completar o código anterior.
Note que |Time| representa o momento da transação, como o número de \href{https://currentmillis.com}{milisegundos} que passaram desde 1970.

\begin{spec}
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int
\end{spec}

Neste contexto, implemente as seguintes funções:

\begin{enumerate}
\item Defina a função |allTransactions :: Blockchain -> Transactions|, como um catamorfismo, que calcula a lista com todas as transações numa dada block chain.

%if False
\begin{code}
allTransactions :: Blockchain -> Transactions
prop1a :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    As transações de uma block chain são as mesmas da block chain revertida:
\begin{code}
prop1a = sort . allTransactions .==. sort . allTransactions . reverseChain
\end{code}

Note que a função |sort| é usada apenas para facilitar a comparação das listas.
\end{propriedade}

\item Defina a função |ledger :: Blockchain -> Ledger|, utilizando catamorfismos e/ou anamorfismos, que calcula o ledger (i.e., o valor disponível) de cada entidade numa uma dada block chain.
    Note que as entidades podem ter valores negativos; de facto isso acontecerá para a primeira transação que executarem.

%if False
\begin{code}
ledger :: Blockchain -> Ledger
prop1b :: Blockchain -> Bool
prop1c :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    O tamanho do ledger é inferior ou igual a duas vezes o tamanho de todas as transações:
\begin{code}
prop1b = length . ledger .<=. (2*) . length . allTransactions
\end{code}
\end{propriedade}

\begin{propriedade}
    O ledger de uma block chain é igual ao ledger da sua inversa:
\begin{code}
prop1c = sort . ledger .==. sort . ledger . reverseChain
\end{code}
\end{propriedade}



\item Defina a função |isValidMagicNr :: Blockchain -> Bool|, utilizando catamorfismos e/ou anamorfismos, que verifica se todos os números mágicos numa dada block chain são únicos.

%if False
\begin{code}
isValidMagicNr :: Blockchain -> Bool
prop1d :: Blockchain -> Bool
prop1e :: Blockchain -> Property
\end{code}
%endif

\begin{propriedade}
    A concatenação de uma block chain com ela mesma nunca é válida em termos de números mágicos:
\begin{code}
prop1d = not . isValidMagicNr . concChain . (split id id)
\end{code}
\end{propriedade}

\begin{propriedade}
    Se uma block chain é válida em termos de números mágicos, então a sua inversa também o é:
\begin{code}
prop1e = isValidMagicNr .==>. isValidMagicNr . reverseChain
\end{code}
\end{propriedade}

\end{enumerate}



\section*{Problema 2}

Uma estrutura de dados frequentemente utilizada para representação e processamento de imagens de forma eficiente são as denominadas \href{https://en.wikipedia.org/wiki/Quadtree}{quadtrees}.
Uma \emph{quadtree} é uma árvore quaternária em que cada nodo tem quatro sub-árvores e cada folha representa um valor bi-dimensional.
\begin{spec}
data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)
\end{spec}

\begin{figure}
\begin{subfigure}{0.3\textwidth}
\begin{verbatim}
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 1 1 1 0 )
( 0 0 0 0 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 0 0 0 0 )
( 1 1 1 1 0 0 0 1 )
\end{verbatim}
\caption{Matriz de exemplo |bm|.}
\label{fig:bm}
\end{subfigure}
\begin{subfigure}{0.7\textwidth}
\begin{verbatim}
Block
 (Cell 0 4 4) (Block
  (Cell 0 2 2) (Cell 0 2 2) (Cell 1 2 2) (Block
   (Cell 1 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1)))
 (Cell 1 4 4)
 (Block
  (Cell 1 2 2) (Cell 0 2 2) (Cell 0 2 2) (Block
   (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 1 1 1)))
\end{verbatim}
\caption{Quadtree de exemplo |qt|.}
\label{fig:qt}
\end{subfigure}
\caption{Exemplos de representações de bitmaps.}
\end{figure}

Uma imagem monocromática em formato bitmap pode ser representada como uma
matriz de bits\footnote{Cf.\ módulo \href{https://hackage.haskell.org/package/matrix}{|Data.Matrix|}.},
tal como se exemplifica na Figura~\ref{fig:bm}.

O anamorfismo |bm2qt| converte um bitmap em forma matricial na sua codificação eficiente em quadtrees, e o catamorfismo |qt2bm| executa a operação inversa:

\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-1.5em
\rightskip\leftskip
\begin{code}
bm2qt :: (Eq a) => Matrix a -> QTree a
bm2qt = anaQTree f where
    f m = if one then i1 u else i2 (a,(b,(c,d)))
     where  x = (nub . toList) m
            u = (head x,(ncols m,nrows m))
            one = (ncols m == 1 || nrows m == 1 || length x == 1)
            (a,b,c,d) = splitBlocks (nrows m `div` 2) (ncols m `div` 2) m
\end{code}
\endgroup
\end{minipage}} %
\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-2em
\rightskip\leftskip
\begin{code}
qt2bm :: (Eq a) => QTree a -> Matrix a
qt2bm = cataQTree (either f g) where
    f (k,(i,j)) = matrix j i (const k)
    g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)
\end{code}
\endgroup
\end{minipage}}

O algoritmo |bm2qt| particiona recursivamente a imagem em $4$ blocos e termina produzindo folhas para matrizes unitárias ou quando todos os píxeis de um sub-bloco têm a mesma côr.
Para a matriz |bm| de exemplo, a quadtree correspondente |qt = bm2qt bm| é ilustrada na Figura~\ref{fig:qt}.

\begin{figure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person.png}
\caption{Bitmap de exemplo.}
\label{fig:person}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[height=0.2\linewidth]{cp1718t_media/person90.png}
\caption{Rotação.}
\label{fig:person90}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.4\linewidth]{cp1718t_media/personx2.png}
\caption{Redimensionamento.}
\label{fig:personx2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personinv.png}
\caption{Inversão de cores.}
\label{fig:personinv}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person1.png}
\caption{Compresão de $1$ nível.}
\label{fig:person1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person2.png}
\caption{Compresão de $2$ níveis.}
\label{fig:person2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person3.png}
\caption{Compresão de $3$ níveis.}
\label{fig:person3}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person4.png}
\caption{Compresão de $4$ níveis.}
\label{fig:person4}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut1.png}
\caption{Bitmap de contorno.}
\label{fig:personOut1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut2.png}
\caption{Bitmap com contorno.}
\label{fig:personOut2}
\end{subfigure}
%
\caption{Manipulação de uma figura bitmap utilizando quadtrees.}
\end{figure}

Imagens a cores podem ser representadas como matrizes de píxeis segundo o código de cores \href{https://en.wikipedia.org/wiki/RGBA_color_space}{RGBA}, codificado no tipo \href{https://hackage.haskell.org/package/JuicyPixels-3.2.9.5/docs/Codec-Picture.html#t:PixelRGBA8}{|PixelRGBA8|} em que cada pixel é um quádruplo de valores inteiros $(red,green,blue,alpha)$ contidos entre $0$ e $255$.
Atente em alguns exemplos de cores:
\begin{spec}
whitePx  = PixelRGBA8 255 255 255 255
blackPx  = PixelRGBA8 0 0 0 255
redPx    = PixelRGBA8 255 0 0 255
\end{spec}

O módulo |BMP|, disponibilizado juntamente com o enunciado, fornece funções para processar ficheiros de imagem bitmap como matrizes:
\begin{spec}
    readBMP :: FilePath -> IO (Matrix PixelRGBA8)
    writeBMP :: FilePath -> Matrix PixelRGBA8 -> IO ()
\end{spec}

Teste, por exemplo, no |GHCi|, carregar a Figura~\ref{fig:person}:
\begin{verbatim}
    > readBMP "cp1718t_media/person.bmp"
\end{verbatim}

Esta questão aborda operações de processamento de imagens utilizando quadtrees:
\begin{enumerate}
    \item Defina as funções |rotateQTree :: QTree a -> QTree a|, |scaleQTree :: Int -> QTree a -> QTree a| e |invertQTree :: QTree a -> QTree a|, como catamorfismos e/ou anamorfismos, que rodam\footnote{Segundo um ângulo de $90º$ no sentido dos ponteiros do relógio.}, redimensionam \footnote{Multiplicando o seu tamanho pelo valor recebido.} e invertem as cores de uma quadtree\footnote{Um pixel pode ser invertido calculando $255 - c$ para cada componente $c$ de cor RGB, exceptuando o componente alpha.}, respectivamente.
    Tente produzir imagens similares às Figuras~\ref{fig:person90}, \ref{fig:personx2} e \ref{fig:personinv}:
%if False
\begin{code}
rotateQTree :: QTree a -> QTree a
scaleQTree :: Int -> QTree a -> QTree a
invertQTree :: QTree PixelRGBA8 -> QTree PixelRGBA8
prop2c :: QTree Int -> Bool
prop2d :: Nat -> QTree Int -> Bool
prop2e :: QTree PixelRGBA8 -> Bool
\end{code}
%endif
        \begin{verbatim}
    > rotateBMP  "cp1718t_media/person.bmp" "person90.bmp"
    > scaleBMP 2 "cp1718t_media/person.bmp" "personx2.bmp"
    > invertBMP  "cp1718t_media/person.bmp" "personinv.bmp"
        \end{verbatim}

\begin{propriedade}
        Rodar uma quadtree é equivalente a rodar a matriz correspondente:
\begin{code}
prop2c = rotateMatrix . qt2bm .==. qt2bm . rotateQTree
\end{code}
    \end{propriedade}
\begin{propriedade}
    Redimensionar uma imagem altera o seu tamanho na mesma proporção:
\begin{code}
prop2d (Nat s) = sizeQTree . scaleQTree s .==. ((s*) >< (s*)) . sizeQTree
\end{code}
\end{propriedade}
\begin{propriedade}
    Inverter as cores de uma quadtree preserva a sua estrutura:
\begin{code}
prop2e = shapeQTree . invertQTree .==. shapeQTree
\end{code}
\end{propriedade}

    \item Defina a função |compressQTree :: Int -> QTree a -> QTree a|, utilizando catamorfismos e/ou anamorfismos, que comprime uma quadtree cortando folhas da árvore para reduzir a sua profundidade num dado número de níveis.
    Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:person1}, \ref{fig:person2}, \ref{fig:person3} e \ref{fig:person4}:
%if False
\begin{code}
compressQTree :: Int -> QTree a -> QTree a
prop2f :: Nat -> QTree Int -> Bool
\end{code}
%endif
        \begin{verbatim}
    > compressBMP 1 "cp1718t_media/person.bmp" "person1.bmp"
    > compressBMP 2 "cp1718t_media/person.bmp" "person2.bmp"
    > compressBMP 3 "cp1718t_media/person.bmp" "person3.bmp"
    > compressBMP 4 "cp1718t_media/person.bmp" "person4.bmp"
        \end{verbatim}
    \begin{propriedade}
        A quadtree comprimida tem profundidade igual à da quadtree original menos a taxa de compressão:
\begin{code}
prop2f (Nat n) = depthQTree . compressQTree n .==. (`minusNat` n) . depthQTree
\end{code}
    \end{propriedade}


    \item Defina a função |outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool|, utilizando catamorfismos e/ou anamorfismos, que recebe uma função que determina quais os píxeis de fundo e converte uma quadtree numa matriz monocromática, de forma a desenhar o contorno de uma \href{https://en.wikipedia.org/wiki/Polygon_mesh}{malha poligonal} contida na imagem.
        Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:personOut1} e \ref{fig:personOut2}:
%if False
\begin{code}
outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool
\end{code}
%endif
            \begin{verbatim}
    > outlineBMP    "cp1718t_media/person.bmp" "personOut1.bmp"
    > addOutlineBMP "cp1718t_media/person.bmp" "personOut2.bmp"
            \end{verbatim}
%if False
\begin{code}
prop2g :: QTree Int -> Bool
\end{code}
%endif
    \begin{propriedade}
        A matriz de contorno tem dimensões iguais às da quadtree:
\begin{code}
prop2g = sizeQTree .==. sizeMatrix . outlineQTree (<0)
\end{code}
    \end{propriedade}
    \begin{teste}
        Contorno da quadtree de exemplo |qt|:
\begin{code}
teste2a = outlineQTree (==0) qt == qtOut
\end{code}
    \end{teste}

\end{enumerate}

\section*{Problema 3}
O cálculo das combinações de |n| |k|-a-|k|,
\begin{eqnarray}
	|bin n k = frac (fac n)(fac k * (fac ((n-k))))|
	\label{eq:bin}
\end{eqnarray}
envolve três factoriais. Recorrendo à \material{lei de recursividade múltipla} do cálculo
de programas, é possível escrever o mesmo programa como um simples ciclo-for
onde se fazem apenas multiplicações e somas. Para isso, começa-se por estruturar
a definição dada da forma seguinte,
\begin{eqnarray*}
	|bin n k = h k (n - k)|
\end{eqnarray*}
onde
\begin{eqnarray*}
\start
       |h k d = frac (f k d) (g d)|
\more
       |f k d = frac (fac ((d+k))) (fac k)|
\more
       |g d = fac d|
\end{eqnarray*}
assumindo-se |d = n-k >=0|.
%
É fácil de ver que |f k| e |g| se desdobram em 4 funções mutuamente recursivas, a saber
\begin{spec}
f k 0 = 1
f k (d+1) = underbrace ((d+k+1)) (l k d) * f k d

l k 0 = k+1
l k (d+1) = l k d + 1
\end{spec}
e
\begin{spec}
g 0 = 1
g (d+1) = underbrace ((d+1)) (s d) * g d

s 0 = 1
s (d+1) = s n + 1
\end{spec}
A partir daqui alguém derivou a seguinte implementação:
\begin{code}
bin n k = h k (n-k) where  h k n = let (a,_,b,_) = for loop (base k) n in a % b
\end{code}
Aplicando a lei da recursividade múltipla para |split (f k) (l k)| e para
|split g s| e combinando os resultados com a \material{lei de banana-split},
derive as funções |base k| e |loop| que são usadas como auxiliares acima.

\begin{propriedade}
Verificação que |bin n k| coincide com a sua especificação (\ref{eq:bin}):
\begin{code}
prop3 (NonNegative n) (NonNegative k) = k <= n ==> (bin n k) == (fac n) % (fac k * (fac ((n-k))))
\end{code}
\end{propriedade}

\section*{Problema 4}

\begin{figure}
\begin{center}
\includegraphics[width=0.7\textwidth]{cp1718t_media/pythagoras-tree1.png}
\end{center}
\caption{Passos de construção de uma árvore de Pitágoras de ordem $3$.}
\label{fig:pitagoras1}
\end{figure}

\href{https://en.wikipedia.org/wiki/Fractal}{Fractais} são formas geométricas que podem ser construídas recursivamente de acordo com um conjunto de equações matemáticas.
Um exemplo clássico de um fractal são as \href{https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)}{árvores de Pitágoras}.
A construção de uma árvore de Pitágoras começa com um quadrado, ao qual se unem dois quadrados redimensionados pela escala $\sqrt{2}/2$, de forma a que os cantos dos $3$ quadrados coincidam e formem um triângulo rectângulo isósceles.
Este procedimento é repetido recursivamente de acordo com uma dada ordem, definida como um número natural (Figura~\ref{fig:pitagoras1}).

Uma árvore de Pitágoras pode ser codificada em Haskell como uma full tree contendo quadrados nos nodos e nas folhas, sendo um quadrado definido simplesmente pelo tamanho do seu lado:
\begin{spec}
data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float
\end{spec}

\begin{enumerate}
    \item Defina a função |generatePTree :: Int -> PTree|, como um anamorfismo, que gera uma árvore de Pitágoras para uma dada ordem.

%if False
\begin{code}
generatePTree :: Int -> PTree
prop4a :: SmallNat -> Bool
prop4b :: SmallNat -> Bool
\end{code}
%endif

\begin{propriedade}
    Uma árvore de Pitágoras tem profundidade igual à sua ordem:
\begin{code}
prop4a (SmallNat n) = (depthFTree . generatePTree) n == n
\end{code}
\end{propriedade}
\begin{propriedade}
    Uma árvore de Pitágoras está sempre balanceada:
\begin{code}
prop4b (SmallNat n) = (isBalancedFTree . generatePTree) n
\end{code}
\end{propriedade}

\item Defina a função |drawPTree :: PTree -> [Picture]|, utilizando catamorfismos e/ou anamorfismos, que anima incrementalmente os passos de construção de uma árvore de Pitágoras recorrendo à biblioteca \href{https://hackage.haskell.org/package/gloss}{gloss}.
    Anime a sua solução:
\begin{verbatim}
    > animatePTree 3
\end{verbatim}

%if False
\begin{code}
drawPTree :: PTree -> [Picture]

window = (InWindow "CP" (800,800) (0,0))
square s = rectangleSolid s s

animatePTree n = animate window white draw
    where
    pics = drawPTree (generatePTree n)
    draw t = pics !! (floor (t/2))
\end{code}
%endif

\end{enumerate}

\section*{Problema 5}

Uma das áreas em maior expansão no campo da informática é a análise de dados
e  \href{https://www.mathworks.com/discovery/machine-learning.html}{machine learning}. Esta questão aborda um \emph{mónade} que ajuda
a fazer, de forma simples, as operações básicas dessas técnicas. Esse mónade
é conhecido por \emph{bag}, \emph{saco} ou \emph{multi-conjunto}, permitindo
que os elementos de um conjunto tenham multiplicidades associadas. Por exemplo,
seja
\begin{code}
data Marble = Red | Pink | Green | Blue | White deriving (Read,Show,Eq,Ord)
\end{code}
um tipo dado.\footnote{``Marble" traduz para ``berlinde" em português.}
A lista |[ Pink,Green,Red,Blue,Green,Red,Green,Pink,Blue,White ]| tem elementos
repetidos. Assumindo que a ordem não é importante, essa lista corresponde ao saco
\begin{quote}\small
\begin{verbatim}
{ Red |-> 2 , Pink |-> 2 , Green |-> 3 , Blue |-> 2 , White |-> 1 }
\end{verbatim}
\end{quote}
que habita o tipo genérico dos ``bags":
\begin{code}
data Bag a = B [(a,Int)] deriving (Ord)
\end{code}
O mónade que vamos construir sobre este tipo de dados faz a gestão automática das multiciplidades.
Por exemplo, seja dada a função que dá o peso de cada berlinde em gramas:
\begin{code}
marbleWeight :: Marble -> Int
marbleWeight Red   = 3
marbleWeight Pink  = 2
marbleWeight Green = 3
marbleWeight Blue  = 6
marbleWeight White = 2
\end{code}
Então, se quisermos saber quantos \emph{berlindes} temos, de cada \emph{peso}, não teremos que fazer contas:
basta calcular
\begin{code}
marbleWeights = fmap marbleWeight bagOfMarbles
\end{code}
onde |bagOfMarbles| é o saco de berlindes referido acima, obtendo-se:
\begin{quote}\small
	\verb!{ 2 |-> 3 , 3 |-> 5 , 6 |-> 2 }!.
\end{quote}
%
Mais ainda, se quisermos saber o total de berlindes em |bagOfMarbles| basta
calcular |fmap (!) bagOfMarbles| obtendo-se \verb!{ () |-> 10 }!; isto é,
o saco tem |10| berlindes no total.


Finalmente, se quisermos saber a probabilidade da cor de um berlinde que tiremos do saco, basta converter
o referido saco numa distribuição correndo:
\begin{code}
marblesDist = dist bagOfMarbles
\end{code}
obtendo-se a distribuição (graças ao módulo \Probability):
\begin{quote}\small
\begin{verbatim}
Green  30.0%
  Red  20.0%
 Pink  20.0%
 Blue  20.0%
White  10.0%
\end{verbatim}
\end{quote}
cf.\ Figura \ref{fig:dist}.

\begin{figure}
\begin{center}
\includegraphics[width=0.4\textwidth]{cp1718t_media/marblesDist-mod5.png}
\end{center}
\caption{Distribuição de berlindes num saco.}
\label{fig:dist}
\end{figure}

Partindo da seguinte declaração de |Bag| como um functor e como um mónade,
\begin{code}
instance Functor Bag where
    fmap f = B. map (f><id) . unB

instance Monad Bag where
   x >>= f = (muB.fmap f) x where
   return = singletonbag
\end{code}
\begin{enumerate}
\item
Defina a função |muB| (multiplicação do mónade |Bag|) e a função auxiliar
|singletonbag|.
\item	Verifique-as com os seguintes testes unitários:
%if False
\begin{code}
muB :: Bag (Bag a) -> Bag a
\end{code}
%endif
\begin{teste}
Lei |muB.return=id|:
\begin{code}
test5a = bagOfMarbles == muB (return bagOfMarbles)
\end{code}
\end{teste}
\begin{teste}
Lei |muB.muB = muB . fmap muB|:
\begin{code}
test5b = (muB . muB) b3 == (muB .fmap muB) b3
\end{code}
\vskip 1em
onde |b3| é um saco dado em anexo.
\end{teste}
\end{enumerate}

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1718t}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Mónade para probabilidades e estatística}\label{sec:Dist}
%format B = "\mathit B"
%format C = "\mathit C"
Mónades são functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribuição estatística é captado pelo tipo
\begin{eqnarray}
	|newtype Dist a = D {unD :: [(a, ProbRep)]}|
	\label{eq:Dist}
\end{eqnarray}
em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de |0| a |100%|.

Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam |100%|.
Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
será representada pela distribuição
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrará assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}

Este mónade é adequado à resolução de problemas de \emph{probabilidades e
estatística} usando programação funcional, de forma elegante e como caso
particular de programação monádica.

\section{Definições auxiliares}\label{sec:helper_functions}
Funções para mostrar \emph{bags}:
\begin{code}
instance (Show a, Ord a, Eq a) => Show (Bag a) where
    show = showbag . consol . unB  where
       showbag = concat .
                 (++ [" }"]) .  ("{ ":) .
                 (intersperse " , ") .
                 sort .
                 (map f) where f(a,b) = (show a) ++ " |-> " ++ (show b)
unB (B x) = x
\end{code}
Igualdade de \emph{bags}:
\begin{code}
instance (Eq a) => Eq (Bag a) where
   b == b' = (unB b) `lequal` (unB b')
           where lequal a b = isempty (a `ominus` b)
                 ominus a b = a ++ neg b
                 neg x = [(k,-i) | (k,i) <- x]
\end{code}
Ainda sobre o mónade |Bag|:
\begin{code}
instance Applicative Bag where
    pure = return
    (<*>) = aap
\end{code}
O exemplo do texto:
\begin{code}
bagOfMarbles = B [(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)]
\end{code}
Um valor para teste (bags de bags de bags):
\begin{code}
b3 :: Bag (Bag (Bag Marble))
b3= B [(B [(B[(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)],5)
      ,(B [(Pink,1),(Green,2),(Red,1),(Blue,1)],2)],2)]
\end{code}
Outras funções auxiliares:
\begin{code}
a |-> b = (a,b)

consol :: (Eq b) => [(b, Int)] -> [(b, Int)]
consol = filter nzero . map (id >< sum) . col where nzero(_,x)=x/=0

isempty :: Eq a => [(a, Int)] -> Bool
isempty = all (==0) . map snd . consol

col x = nub [ k |-> [ d' | (k',d') <- x , k'==k ] | (k,d) <- x ]

consolidate :: Eq a => Bag a -> Bag a
consolidate = B . consol . unB

\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}

\subsection*{Problema 1}

Antes de proceder à resolução das alíneas, foi necessária a definição das funções relativas à manipulação de Blockchains:

\begin{code}
inBlockchain = either Bc Bcs
\end{code}

O out da Blockchain foi calculado da seguinte forma:

\begin{eqnarray*}
\start
    |out . in = id|
%
\just\equiv{ in = either Bc Bcs }
%
    |out . (either Bc Bcs) = id|
%
\just\equiv{ Lei 20 }
%
    |either (out . Bc) (out . Bcs) = id|
%
\just\equiv{ Lei 27 }
%
    |lcbr(
		out . Bc = i1
	)(
		out . Bcs = i2
	)|
%
\just\equiv{ Passando para pointwise }
%
    |lcbr(
		out (Bc a) = i1 a
	)(
		out (Bcs (a, b)) = i2 (a, b)
	)|
\qed
\end{eqnarray*}

Resultando no seguinte código Haskell:

\begin{code}
outBlockchain (Bc a) = i1 a
outBlockchain (Bcs (a, b)) = i2 (a, b)
\end{code}

As restantes funções são:

\begin{code}
recBlockchain f = id -|- (id >< f)
cataBlockchain g = g . (recBlockchain (cataBlockchain g)) . outBlockchain
anaBlockchain g = inBlockchain . (recBlockchain (anaBlockchain g)) . g
hyloBlockchain f g = cataBlockchain f . anaBlockchain g
\end{code}

\subsubsection*{allTransactions}

Para definir allTransactions, que calcula uma lista de todas as transações de uma Blockchain, foi usado um catamorfismo de Blockchains:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
           \ar[d]_-{|f|}
           \ar[r]^-{out}
&
    |Block + Block >< Blockchain|
           \ar[d]^-{|id + id >< f|}
\\
    C
&
    |Block + Block >< C|
           \ar[l]^-{g}
}
\end{eqnarray*}

Este catamorfismo simplesmente usa a função \emph{|p2|} para extrair as listas de transações de cada bloco:

\begin{code}
allTransactions = cataBlockchain (either getTransaction getTransactions)
getTransaction = p2 . p2
getTransactions = conc . ((p2 . p2) >< id)
\end{code}

É importante notar que \emph{conc} gera uma lista concatenando um par que contém duas listas: \emph{|([a], [a]) -> [a]|}

\subsubsection*{ledger}

Para calcular o ledger de uma blockchain vamos fazer 4 passos:

\vskip 2em

\begin{enumerate}
  \item Obter a lista das transações de uma blockchain (usando \emph{allTransactions});
  \item Obter uma lista de entidades a partir da lista de transações (usando o catamorfismo \emph{getEntities});
  \item Eliminar repetições da lista de entidades;
  \item Calcular o saldo de cada entidade fazendo map das entidades sobre uma função \emph{getBalance}.
\end{enumerate}

\vskip 1em

O diagrama seguinte mostra a composição de funções utilizada:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
           \ar[d]^-{allTransactions}
\\
    |[transaction]|
           \ar[d]^-{|split getUniqueEntities id|}
\\
    |([entity], [transaction])|
           \ar[d]^-{|id >< getBalance|}
\\
    |([entity], (getBalance [transaction]))|
           \ar[d]^-{|split p1 (mapPair . swap)|}
\\
    |([entity], [saldo])|
           \ar[d]^-{|zipPair|}
\\
    |[(entity, saldo)]|
}
\end{eqnarray*}

\vskip 1em


A lista |[(entity, saldo)]| no fim do diagrama anterior é o ledger que pretendemos calcular.

\vskip 1em

O código Haskell correspondente ao diagrama será:

\begin{code}
ledger = zipPair . (split p1 (mapPair . swap)) . (id >< getBalance) . (split getUniqueEntities id) . allTransactions
\end{code}

\vskip 1em

\emph{getEntities} será um catamorfismo de listas que calcula uma lista de entidades a partir de uma de transações.

\begin{code}
getEntities :: [Transaction] -> [String]
getEntities = cataList ( either nil (conc . ((pairToList . split p1 (p2 . p2)) >< id)) )
\end{code}

Para transformar uma transação em uma lista com as duas entidades, usamos \emph{|pairToList . (split p1 (p2 . p2))|}. \par
No caso final, usamos \emph{|nil|} para introduzir uma lista vazia. \par
É útil recordar que uma transação corresponde ao par \emph{|(origem, (valor, destino))|}.

\vskip 2em

A função getUniqueEntities remove repetições de uma lista de entidades:

\begin{code}
getUniqueEntities :: [Transaction] -> [String]
getUniqueEntities = remDup . getEntities
\end{code}

\vskip 1em

getBalance será um catamorfismo de listas de transações que calcula o saldo de uma dada entidade.

\begin{code}
getBalance :: [Transaction] -> String -> Int
getBalance transactions entity = (cataList ( either (const 0) ( addInt . ((delta entity) >< id) ) )) transactions
\end{code}

Esta função foi definida em pointwise uma vez que tem de receber a lista de transações antes da entidade,
o que nos é útil para o map que vamos querer executar.

\vskip 2em

A função delta retorna a diferença de saldo resultante de uma transação para uma dada entidade
(se a entidade não aparece na transação, delta será 0):

\begin{code}
delta :: String -> Transaction -> Int
delta entity (a, (v, b))
    | entity == a = -v
    | entity == b = v
    | otherwise = 0
\end{code}

\vskip 1em

Foi necessário definir as funções auxiliares \emph{mapPair} e \emph{zipPair}:

\begin{code}
mapPair :: (a -> b, [a]) -> [b]
mapPair (f, l) = map f l
\end{code}

\begin{code}
zipPair :: ([a], [b]) -> [(a, b)]
zipPair (x, y) = zip x y
\end{code}

\vskip 1em

A função addInt soma um par de Ints:

\begin{code}
addInt :: (Int, Int) -> Int
addInt (a, b) = a + b
\end{code}

\vskip 1em

A função remDup Remove elementos duplicados de uma lista:

\begin{code}
remDup :: (Ord a) => [a] -> [a]
remDup = map head . group . sort
\end{code}

Esta função foi uma descoberta interessante, e tem um desempenho melhor que a equivalente nativa -
\emph{nub} é \emph{O(N\textsuperscript{2})} enquanto que \emph{remDup} é \emph{O(N log(N))}.

\vskip 2em

Por fim, a função \emph{pairToList} cria um par a partir de uma lista com dois elementos:

\begin{code}
pairToList :: (a, a) -> [a]
pairToList (x, y) = [x, y]
\end{code}

\subsubsection*{isValidMagicNr}

Para definir \emph{isValidMagicNr} foi definido um catamorfismo \emph{getMagicNumbers}:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
           \ar[d]^-{|getMagicNumbers|}
\\
    |[String]|
           \ar[d]^-{|checkDuplicates|}
\\
    |Bool|
}
\end{eqnarray*}

Ao que corresponde o seguinte código Haskell:

\begin{code}
isValidMagicNr = checkDuplicates . getMagicNumbers
\end{code}

\vskip 1em

O catamorfismo getMagicNumbers retorna a lista de números mágicos de uma Blockchain:

\begin{code}
getMagicNumbers :: Blockchain -> [String]
getMagicNumbers = cataBlockchain (either (cons . (split p1 nil)) (cons . (p1 >< id)))
\end{code}

O caso final, \emph{|cons . (split p1 nil)|}, retorna uma lista que contém apenas o número mágico do último bloco.

\vskip 2em

A função checkDuplicates retorna \emph{true} se uma lista não tem elementos duplicados, usando a função \emph{remDup} definida anteriormente.

\begin{code}
checkDuplicates :: (Ord a) => [a] -> Bool
checkDuplicates x = (remDup x) == x
\end{code}

\vskip 1em

Foram também definidas duas Blockchains de teste de maneira a verificar as funcionalidades criadas para a resolução deste primeiro problema:

\begin{code}
block1 = ("1234",
  (177777, [
    ("Marcos", (200, "Tarracho")),
    ("Antonio", (200, "Joao")),
    ("Tarracho", (200, "Marcos")),
    ("Marcos", (200, "Tarracho"))
  ]))
block2 = ("6789",
  (177888, [
    ("Marcos", (200, "Tarracho")),
    ("Antonio", (200, "Joao"))
  ]))
block3 = ("4444",
  (177888, [
    ("Maria", (200, "Matilde")),
    ("Matilde", (200, "Maria"))
  ]))

testBlockchain1 = Bcs (block1, Bc block2)
testBlockchain2 = Bcs (block3, Bcs (block1, Bc block2))
\end{code}

\newpage

\subsection*{Problema 2}

Antes de proceder à resolução das alíneas, foi necessária a definição das funções relativas à manipulação de QTrees.

\begin{code}
toCell (a,(b,c)) = Cell a b c
toBlock (a,(b,(c,d))) = Block a b c d
\end{code}

Aplicando a definição de toBlock e toCell temos:
\begin{code}
inQTree = either toCell toBlock
\end{code}

O out da QTree foi calculado da seguinte forma:

\begin{eqnarray*}
\start
    |outQTree . inQTree = id|
%
\just\equiv{ Definição de inQTree }
%
    |outQTree . (either (toCell) (toBlock)) = id|
%
\just\equiv{ Lei da Fusão }
%
    |either (outQTree . toCell) (outQTree . toBlock) = id|
%
\just\equiv{ Universal-+ }
%
    |lcbr(
		id . i1 = outQTree . toCell
	)(
		id . i2 = outQTree . toBlock
	)|
%
\just\equiv{ Lei 1, 73 e 74 }
%
    |lcbr(
		outQTree toCell (a, (b, c)) = i1 (a, (b, c))
	)(
		outQTree toBlock (a, (b, (c, d))) = i2 (a, (b, (c, d)))
	)|

\qed
\end{eqnarray*}


Resultando na seguinte definição em Haskell:
\begin{code}
outQTree (Cell a b c) = i1 (a,(b,c))
outQTree (Block a b c d) = i2 (a,(b,(c,d)))
\end{code}

As restantes funções são:
\begin{code}
baseQTree g f = (g >< id) -|- (f >< (f >< (f >< f)))
recQTree f = baseQTree id f
cataQTree cata = cata . recQTree (cataQTree cata) . outQTree
anaQTree ana = inQTree . recQTree (anaQTree ana) . ana
hyloQTree f g = cataQTree f . anaQTree g

instance Functor QTree where
    fmap f = cataQTree (inQTree . (baseQTree f id))
\end{code}

\subsubsection*{rotateQTree}

Para uma rotação de 90 graus da QTree, temos de reposicionar as células e os blocos. Usou-se um catamorfismo de QTree.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree A|
           \ar[d]_-{|cataQTree r|}
&
    |(A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[d]^{|recQTree (cataQTree r)|}
           \ar[l]_-{|inQTree|}
\\
    |QTree A|
&
    |(A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[l]^-{|r|}
}
\end{eqnarray*}

Por questões de legibilidade, colocou-se \emph{r} ao invés do \emph{either} de \emph{rotateCell} e \emph{rotateBlock}.

Por isso, rotateQTree vem:
\begin{code}
rotateQTree = cataQTree (either rotateCell rotateBlock)
rotateCell (a,(b,c)) = Cell a c b
rotateBlock (a, (b, (c,d))) = Block c a d b
\end{code}

\subsubsection*{scaleQTree}

Para redimensionar, temos de multiplicar cada célula pelo fator de multiplicação. Usámos um catamorfismo de QTree. De notar que, devido à definição da \emph{baseQTree}, é possível aplicação do \emph{outQTree} apesar de termos um \emph{Int} de entrada.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Int >< QTree A|
           \ar[d]_-{|cataQTree s|}
&
    |Int ><  (A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[d]^{|recQTree (cataQTree s)|}
           \ar[l]_-{|inQTree|}
\\
    |QTree A|
&
    |Int >< (A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[l]^-{|s|}
}
\end{eqnarray*}

Por questões de legibilidade, colocou-se \emph{s} ao invés do \emph{either} de \emph{scaleCell a} e \emph{toBlock}.

Por isso, scaleQTree vem:
\begin{code}
scaleQTree a = cataQTree (either (scaleCell a) (toBlock))
scaleCell mult (a,(b,c)) = Cell a (mult * b) (mult * c)
\end{code}

\subsubsection*{invertQTree}

Para inverter as cores de uma QTree, temos de inverter a cor de cada pixel. Usámos um catamorfismo de QTree.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree A|
           \ar[d]_-{|cataQTree i|}
&
    |(A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[d]^{|recQTree (cataQTree i)|}
           \ar[l]_-{|inQTree|}
\\
    |QTree A|
&
    |(A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[l]^-{|i|}
}
\end{eqnarray*}

Por questões de legibilidade, colocou-se \emph{i} ao invés do \emph{either} de \emph{invertCell} e \emph{toBlock}.

Por isso, invertQTree vem:
\begin{code}
invertQTree = cataQTree (either (invertCell) (toBlock))
invertCell ((PixelRGBA8 r g b a),(x,y)) = Cell (PixelRGBA8 (255-r) (255-g) (255-b) a) x y
\end{code}

\subsubsection*{compressQTree}

Para a realização da \emph{compressQTree}, foi criado um anamorfismo que recebe
um par \emph{(Int, QTree)}.
Neste par, o inteiro representa o nível de compressão desejado.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree A|
&
    |(A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[l]_-{|in|}
\\
    |Int >< QTree A|
           \ar[u]^-{|f|}
           \ar[r]_-{|g|}
&
    |(A, (Int, Int)) + ((Int >< QTree A) ^ 4)|
           \ar[u]_-{|id + f >< f >< f >< f|}
}
\end{eqnarray*}

\begin{code}

compressQTree a b = (anaQTree geneCompress) (a, b)

geneCompress :: (Int, QTree a) -> Either (a, (Int, Int)) ((Int, QTree a), ((Int, QTree a),
 ((Int, QTree a), (Int, QTree a))))
geneCompress (x, (Cell a b c)) = i1 (a, (b, c))
geneCompress (x, t@(Block a b c d))
  | x >= (depthQTree t) = i1 ((anyValue t), ((fst (sizeQTree t)), (snd (sizeQTree t))))
  | otherwise = i2 (((x, a), ((x, b), ((x, c), (x, d)))))
\end{code}

O gene do anamorfismo faz uma de três coisas:

\vskip 1em

\begin{itemize}
  \item Se recebe uma \emph{Cell}, simplesmente coloca-a do lado esquerdo usando \emph{|i1|}, uma vez que chegamos a uma folha da árvore que não deve ser cortada.
  \item Se recebe um \emph{Block}, e a sua profundidade é menor ou igual ao nível de compressão
  desejado, converte esse bloco para uma célula, efetivamente cortando os filhos desse bloco.
  De seguida, executa \emph{|i1|} para colocar a nova célula do lado esquerdo.
  \item Se recebe um \emph{Block} e a sua profundidade é maior que o nível de compressão desejado,
  simplesmente coloca-o do lado direito usando \emph{|i2|}, sem alterar o seu conteúdo.
\end{itemize}

A função \emph{anyValue} é usada para obter um valor qualquer de uma QTree.
Esta funcionalidade é útil para quando queremos atribuir um valor a uma nova \emph{Cell}
criada a partir de um \emph{Block}.
\begin{code}
anyValue :: QTree a -> a
anyValue (Cell a b c) = a
anyValue (Block a b c d) = anyValue a
\end{code}

No futuro, poderia-se usar uma função que calcula a média do valor dos filhos de maneira
a realizar uma compressão mais elegante.

\subsubsection*{outlineQTree}

Para fazer o \emph{outline} da figura é preciso verificar se a célula, após aplicada a função dada, é de valor \emph{True}. Se sim, utiliza-se a função \emph{outlineBlock} que, dado um tamanho de bloco, procede ao contorno do mesmo. O cata apresentado é o que transforma uma \emph{QTree} em a respetiva \emph{QTree} de \emph{Bool}. Após esta conversão, basta utilizar a função \emph{qt2bm} para converter para \emph{Matrix}, tal como pedido.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree A|
           \ar[d]_-{|cataQTree o|}
&
    |f >< (A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[d]^{|recQTree (cataQTree o)|}
           \ar[l]_-{|inQTree|}
\\
    |QTree Bool|
&
    |f >< (A, (Int, Int)) + ((QTree A) ^ 4)|
           \ar[l]^-{|o|}
}
\end{eqnarray*}

Por questões de legibilidade, colocou-se \emph{o} ao invés do \emph{either} de \emph{outlineCell fun} e \emph{toBlock}.

Por isso, outlineQTree vem:
\begin{code}
outlineQTree fun = qt2bm . (cataQTree (either (outlineCell fun) (toBlock)))
outlineCell fun (a,(b,c)) = if (fun a) then (outlineBlock b c) else (Cell (fun a) b c)
outlineBlock a b = Block
    (Block (Cell True 1 1)
           (Cell True (a-2) 1)
           (Cell True 1 (b-2))
           (Cell False (a-2) (b-2)))
    (Cell True 1 (b-1))
    (Cell True (a-1) 1)
    (Cell True 1 1)
\end{code}

\subsection*{Problema 3}

\par Tendo em conta o enunciado do problema 3, decidimos que a estratégia a adotar seria fazer o \emph{split} de \emph{f} e \emph{l} e o \emph{split} de \emph{g} e \emph{s}. Faz-se, então, a seguinte demonstração:

\begin{eqnarray*}
\start
        |lcbr(
		fk 0 = 1
	)(
		fk (d+1) = (d + k + 1) * fk d
    )|
    |lcbr(
		lk 0 = 1
    )(
		lk (d+1) = lk d+1
	)|
%
\just\equiv{ lei 73 (x2), lei 74 (x4), definiçao de (d+k+1), lei 76 (x2), lei 78 }
%
    |lcbr(
		fk . (const 0) = const 1
	)(
		fk . succ = mul . (split lk fk)
    )|
    |lcbr(
		lk . (const 0) = const (k+1)
    )(
		lk . succ = succ . lk
	)|
%
\just\equiv{ lei eq-+ }
%
    |lcbr(
		either (fk . (const 0)) (fk . succ) = either (const 1) (mul . (split lk fk))
	)(
		either (lk . (const 0)) (lk . succ) = either (const (k+1)) (succ . lk)
	)|
%
\just\equiv{ definição de in dos naturais, lei da fusão (x2) e lei da absorção (x2) }
%
    |lcbr(
		fk . in = (either (const 1) mul) . (id + split lk fk)
	)(
		lk . in = (either (const (k+1)) succ) . (id + lk)
	)|
%
\just\equiv{ definição de swap e lei do cancelamento-x }
%
    |lcbr(
		fk . in = (either (const 1) mul . swap) . (id + split fk lk)
	)(
		lk . in = (either (const (k+1)) (succ . p2) . (id + split fk lk)
	)|
%
\just\equiv{ fokkinga }
%
	|split fk lk = cataA (split (either (const 1) (mul . swap)) (either (const (k+1)) (succ . p2)))|

\qed
\end{eqnarray*}

Neste passo, faz-se a demonstração respetiva ao \emph{g} e \emph{s}:

\begin{eqnarray*}
\start
    |lcbr(
		g 0 = 1
	)(
		g (d+1) = (d + 1) * g d
    )|
    |lcbr(
		s 0 = 1
    )(
		s (d+1) = s d+1
	)|
%
\just\equiv{ lei 73 (x2), lei 74 (x4), lei 76 (x2), definição de (d+1) e lei 78 }
%
    |lcbr(
		g . (const 0) = const 1
	)(
		g . succ = mul . (split s g)
    )|
    |lcbr(
		s . (const 0) = const 1
    )(
		s . succ = succ . s
	)|
%
\just\equiv{ lei eq-+ }
%
    |lcbr(
		either (g . (const 0)) (g . succ) = either (const 1) (mul . (split s g))
	)(
		either (s . (const 0)) (s . succ) = either (const 1) (succ . s)
	)|
%
\just\equiv{ definição de in dos naturais, lei da fusão (x2) e lei da absorção (x2) }
%
    |lcbr(
		g . in = (either (const 1) mul) . (id + split s g)
	)(
		s . in = (either (const (1)) succ . p1) . (id + split s g)
	)|
%
\just\equiv{ propriedade do swap (x2) e cancelamento-x }
%
    |lcbr(
		g . in = (either (const 1) (mul . swap)) . (id + split g s)
	)(
		s . in = (either (const 1) (succ . p1 . swap) . (id + split g s)
	)|
%
\just\equiv{ fokkinga }
%
	|split g s = cataA (split (either (const 1) (mul . swap)) (either (const 1) (succ . p1 . swap)))|

\qed
\end{eqnarray*}

Por fim, procedeu-se à combinação dos resultados obtidos através de um \emph{banana-split}, tal como sugerido no enunciado.

\begin{eqnarray*}
\start
    |lcbr(
            cataA i = cataA (split (either (const 1) (mul . swap)) (either (const (k+1)) (succ . p2)))
        )(
            cataA j = cataA (split (either (const 1) (mul . swap)) (either (const 1) (succ . p1 . swap)))
        )|
%
\just\equiv{ lei banana-split }
%
	|split (cataA i) (cataA j) = cataA ((split (either (const 1) (mul . swap)) (either (const (k+1)) (succ . p2))) >< (split (either (const 1) (mul . swap)) (either (const 1) (succ . p1 . swap))) . split (F p1) (F p2))|
%
\just\equiv{ lei da troca }
%
    |split (cataA i) (cataA j) = cataA ((either (split (const 1) (const (k+1))) (split (mul . swap) (succ . p2))) >< (either (split (const 1) (const 1)) (split (mul . swap) (succ . p1 . swap))) . split (F p1) (F p2))|
%
\just\equiv{ conforme 3.90 a 3.95 dos apontamentos / lei 11) }
%
    |split (cataA i) (cataA j) = cataA ( split ( (either (split (const 1) (const (k+1))) (split (mul . swap) (succ . p2))) . F p1 ) ( (either (split (const 1) (const (k+1))) (split (mul . swap) (succ . p2))) . F p2 ))|
%
\just\equiv{ lei da troca }
%
    |split (cataA i) (cataA j) = cataA ( either (split (split (const 1) (const (k+1))) (split (const 1) (const 1))) (split (split (mul . swap) (succ . p2) . p1) (split (mul . swap) (succ . p1 . swap) . p2)) )

    )|
%
\just\equiv{ definição de for b i }
%
    |lcbr(
		b = (split (split (mul . swap) (succ . p2) . p1) (split (mul . swap) (succ . p1 . swap) . p2))
	)(
		i = (split (split (const 1) (const (k+1))) (split (const 1) (const 1)))
	)|
\qed
\end{eqnarray*}

\par A \emph{base} foi extraída diretamente do cálculo anterior, enquanto que o \emph{loop} precisou de uns ajustes de tipos internos, os quais foram realizados através das funções \emph{tuple} e \emph{untuple}.

\begin{code}
untuple ((a,b),(c,d)) = (a,b,c,d)
tuple (a,b,c,d) = ((a,b),(c,d))

base = untuple . (split (split (const 1) (succ)) (split (const 1) (const 1)))
loop = untuple . (split ((split (mul . swap . p1) (succ . p2 . p1)) . tuple) ((split (mul . swap . p2) (succ . p1 . swap . p2)) . tuple))
\end{code}

\subsection*{Problema 4}

De maneira a resolver o problema 4, foi necessário definir as funções que facilitam a manipulação do tipo de dados \emph{FTree}:

\vskip 1em

\emph{|inFTree|} usa os construtores de \emph{|FTree|}, usando uma função auxiliar
\emph{|toComp|} de maneira a poder converter um par recebido.

\begin{code}
inFTree = either Unit toComp
toComp (a, (b, c)) = Comp a b c
\end{code}

\vskip 1em

\emph{|outFTree|} foi derivada de uma maneira semelhante à out das Blockchain (Problema 1):

\begin{code}
outFTree (Unit a) = i1 a
outFTree (Comp a b c) = i2 (a, (b, c))
\end{code}

\vskip 1em

As restantes funções são:

\begin{code}
baseFTree f g h = g -|- (f >< (h >< h))
recFTree f = baseFTree id id f
cataFTree g = g . (recFTree (cataFTree g)) . outFTree
anaFTree g = inFTree . (recFTree (anaFTree g)) . g
hyloFTree f g = cataFTree f . anaFTree g
\end{code}

\vskip 1em

A partir da lei 47 (def-map-cata) foi definido:

\begin{code}
instance Bifunctor FTree where
    bimap f g = cataFTree (inFTree . (baseFTree f g id))
\end{code}

\subsubsection*{generatePTree}

\emph{generatePTree} deve gerar uma árvore de Pitágoras para uma dada ordem,
sendo definida como um anamorfismo.\par

\vskip 1em

Para este efeito, o grupo partiu do diagrama do anamorfismo de \emph{FTree},
que pode ser usado em vez de \emph{PTree} simplesmente porque: \par

\vskip 1em

\emph{type PTree = FTree Square Square}\par

\vskip 1em

O diagrama é o seguinte:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |FTree A B|
&
    |B + A >< (FTree A B >< FTree A B)|
           \ar[l]_-{|in|}
\\
    C
           \ar[u]^-{|f|}
           \ar[r]_-{|g|}
&
    |B + A >< (C >< C)|
           \ar[u]_-{|id + id >< (f >< f)|}
}
\end{eqnarray*}

Neste diagrama, A e B ambos representam o tipo \emph{Float}, para que
a \emph{FTree} seja convertível para uma \emph{PTree}.

\vskip 1em

Na primeira tentativa, o grupo definiu um anamorfismo que recebe um \emph{Int}
igual ao rank da árvore de Pitágoras pretendida. Esse \emph{Int} iria
diminuindo, e o anamorfismo pararia quando este fosse igual a zero.

\vskip 1em

O gene deste primeiro anamorfismo era:

\vskip 1em

\emph{|genePTree = (id + (split p2 (split p1 p1))) . (id + (pred >< id)) . (id + (split id rankToMultiplier)) . (fromIntegral + id) . oneToLeft|}

\vskip 1em

O que aconteceu foi que o anamorfismo criado gerava uma árvore invertida,
pelo que seria necessário começar com o inteiro a zero e parar de iterar
quando este fosse igual ao rank pretendido. \par

\vskip 1em

Para isso foi criado um segundo anamorfismo que recebe um par \emph{(Int, Int)},
onde o primeiro inteiro representa o rank da iteração atual, e o segundo representa
o rank final pretendido. \par

Ao encaixar uma função \emph{|split (const 1) id|} antes do anamorfismo, consegue-se
manter esta mudança invisível para o utilizador. Ficamos então com uma função \emph{generatePTree}:\par

\begin{code}
generatePTree = anaFTree genePTree . (split (const 0) id)
\end{code}

Em que \emph{genePTree} é o gene do anamorfismo:

\begin{code}
genePTree = (id -|- (id >< (split id id))) . (id -|- (id >< (succ >< id))) . (id -|- (split (rankToMultiplier . p1) id))
 . ((rankToMultiplier . p1) -|- id) . checkComplete
\end{code}

Este gene é representado no seguinte diagrama:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Int >< Int|
           \ar[d]^-{checkComplete}
\\
    |Int >< Int + Int >< Int|
           \ar[d]^-{|(rankToMultiplier . p1) + id|}
\\
    |Float + Int >< Int|
           \ar[d]^-{|id + (split (rankToMultiplier . p1) id)|}
\\
    |Float + Float >< (Int >< Int) |
           \ar[d]^-{|id + id >< (succ >< id)|}
\\
    |Float + Float >< (Int >< Int)|
           \ar[d]^-{|id + id >< (split id id)|}
\\
    |Float + Float >< ((Int >< Int) >< (Int >< Int))|
}
\end{eqnarray*}

\vskip 1em

De seguida são definidas as funções usadas pelo anamorfismo: \par

\vskip 1em

\emph{rankToMultiplier} retorna o multiplicador de uma PTree para um dado Rank.
Por exemplo, o multiplicador de ordem 0 é 1,
o de ordem 1 é $\frac{\sqrt{2}}{2}$, e o de ordem 2 é $(\frac{\sqrt{2}}{2})^2$.

\begin{code}
rankToMultiplier :: Int -> Float
rankToMultiplier a = (((sqrt 2) / 2) ^ a)
\end{code}

\vskip 1em

\emph{checkComplete} executa \emph{|i1|} sobre um par de inteiros se estes forem iguais,
ou \emph{|i2|} se forem diferentes. Esta função é importante para determinar
quando chegamos à última iteração do anamorfismo.

\begin{code}
checkComplete :: (Int, Int) -> Either (Int, Int) (Int, Int)
checkComplete (a, b)
    | b < 0 = i1 (a, 0)
    | a == b = i1 (a, b)
    | otherwise = i2 (a, b)
\end{code}

O caso

\vskip 1em

\emph{|b < 0 = i1 (a, 0)|}

\vskip 1em

evita um loop infinito no caso de ser pedida uma \emph{PTree} com rank negativo.

\subsubsection*{drawPTree}

O grupo não definiu a função drawPTree.

\begin{code}
drawPTree = undefined
\end{code}

\subsection*{Problema 5}

\par Para a realização deste exercício, foi necessário compreender qual a função de \emph{singletonbag} e \emph{muB}. A primeira permite, tendo um determinado objeto, inseri-lo num dado \emph{Bag}. Quanto à segunda, dado um determinado \emph{Bag} com \emph{Bags} e o respetivo número dos mesmos, deve permitir criar apenas um \emph{Bag} com o conteúdo de todos os interiores.

\subsubsection*{singletonbag}

\par Para a realização de \emph{singletonbag}, devemos primeiro criar um tuplo com o elemento que recebemos, e o respetivo número de elementos, ou seja, um.

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |A|
            \ar[r]^-{|toTuple|}
&
    |A >< 1|
}
\end{eqnarray*}

\par Depois de ter o tuplo, este deve ser inserido dentro de uma lista, uma vez que o construtor de \emph{Bag} recebe tal. Para isso, usou-se \emph{singl}.
Posteriormente, basta aplicar o construtor \emph{B}. Abaixo, mostram-se as definições realizadas.

\begin{code}
singletonbag = B . singl . toTuple
toTuple a = (a,1)
\end{code}

\subsubsection*{|muB|}

\par Para fazer o |muB|, tendo em conta o seu objetivo, optou-se por, desde logo, realizar um \emph{fmap unB}. Isto vai permitir fazer \emph{unBag} dos \emph{Bags} interiores do \emph{Bag} fornecido. Desta forma, dentro do \emph{Bag} inicial vamos ter tuplos (cujo primeiro elemento é uma lista de elementos depois do \emph{unBag}, e o segundo é o respetivo número de sacos iguais existentes).

\begin{eqnarray*}
\xymatrix@@C=3cm{
    | Bag (Bag A, Int) above |
            \ar[r]^-{|fmap unB|}
&
    |Bag ((A, Int) above, Int) above|
}
\end{eqnarray*}

Depois de termos a \emph{Bag} com tuplos, em que o primeiro elemento do mesmo é uma lista de tuplos do \emph{Bag} interior, e em que o segundo é o número respetivo de \emph{Bags} existentes à \emph{priori}, é necessário retirar este último. Para retirar sem perder informação, devemos multiplicar o número de elementos de cada tipo em cada um dos \emph{bags} interiores, pelo respetivo número de \emph{bags} daquele tipo. Isso foi feito com recurso a um \emph{map multBags}, após um \emph{unBag}.

Faz-se então o \emph{unB}:

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |Bag ((A, Int) above, Int) above|
            \ar[r]^-{|unB|}
&
    | ((A, Int) above, Int) above|
}
\end{eqnarray*}

E agora aplicar a função \emph{multBags} a toda a lista, através de um \emph{map}.

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |((A, Int) above, Int) above|
            \ar[r]^-{|map multBags|}
&
    |((A, Int) above) above|
}
\end{eqnarray*}

Tendo feito todos os passos anteriores, basta concatenar as listas numa só, através da função \emph{concat}. Naturalmente, posteriormente, aplica-se o construtor \emph{B}, obtendo-se a \emph{Bag} final.

\begin{code}
muB = B . concat . (map multBags) . unB . (fmap unB)
multBags :: ([(a, Int)], Int) -> [(a, Int)]
multBags ([], c) = []
multBags (((a, b):tail), c) = [(a,b*c)] ++ (multBags (tail, c))
\end{code}

\subsubsection*{dist}

O \emph{dist}, após recebido um \emph{Bag} tem, naturalmente, que fazer o seu \emph{unBag}. Tendo a lista de tuplos, em que o primeiro elemento é um elemento específico e o segundo o número de existentes desse elemento. Feito isto, é usada a \emph{marbleReplication} (com recurso a \emph{map}), para transformar tuplos de A |><| Int em uma lista de A, como se demonstra.

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |(A, Int) above|
            \ar[r]^-{|map marbleReplication|}
&
    |A above above|
}
\end{eqnarray*}

Tendo agora uma lista com as listas formadas após replicação, resta fazer o concat das mesmas. Esta lista fica assim pronta a ser processada pela função \emph{uniform}, obtendo-se a distribuição pedida.

\begin{code}
dist = uniform . concat . map marbleReplication . unB
marbleReplication = uncurry replicate . swap
\end{code}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Outras definições auxiliares -------------------------------------------%

%if False
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

newtype Nat = Nat {getNat :: Int}
 deriving ( Eq, Ord, Show, Enum, Read, Typeable)

instance Arbitrary Nat where
  arbitrary =
    (frequency
       [ (5, (Nat . abs) `fmap` arbitrary)
       , (1, return (Nat 0))
       ]
    ) `suchThat` ge0
    where ge0 (Nat x) = x >= 0

  shrink (Nat x) =
    [ Nat x'
    | x' <- shrink x
    , x' >= 0
    ]

newtype SmallNat = SmallNat Int
 deriving ( Eq, Ord, Show, Read,Enum,Num,Typeable)

instance Arbitrary SmallNat where
  arbitrary = liftM SmallNat (QuickCheck.choose (0,10))

  shrink (SmallNat x) =
    [ SmallNat x'
    | x' <- shrink x
    , x' >= 0, x' <= 10
    ]

instance Arbitrary a => Arbitrary (Matrix a) where
  arbitrary = do
    rows <- QuickCheck.choose (0,100)
    cols <- QuickCheck.choose (0,100)
    xs <- vectorOf (rows * cols) arbitrary
    return (fromList rows cols xs)
  shrink = shrinkNothing

minusNat :: Int -> Int -> Int
minusNat x = Nat.for predNat x

predNat :: Int -> Int
predNat 0 = 0
predNat n = n - 1

-- * pergunta 1

data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
type Block = (MagicNo, (Time, Transactions))
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
type Ledger = [(Entity, Value)]
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int

inBlockchain :: Either Block (Block, Blockchain) -> Blockchain
outBlockchain :: Blockchain -> Either Block (Block, Blockchain)
recBlockchain :: (c -> d) -> Either b1 (b2, c) -> Either b1 (b2, d)
cataBlockchain :: (Either Block (Block, d) -> d) -> Blockchain -> d
anaBlockchain :: (c -> Either Block (Block, c)) -> c -> Blockchain
hyloBlockchain :: (Either Block (Block, c1) -> c1) -> (c2 -> Either Block (Block, c2)) -> c2 -> c1

list2chain [] = Bc ("numeromagico1", (0, []))
list2chain [b] = Bc b
list2chain (h:t) = Bcs (h, list2chain t)

instance Arbitrary Blockchain where
  arbitrary = do
    xs <- arbitrary
    -- nao convem ter numeros repetidos
    return $ list2chain $ nubBy (\(n, _) (n', _) -> n /= n') xs
  shrink = shrinkNothing

e1 = "ent1"
e2 = "ent2"

mg1 = "b1"
mg2 = "b2"
mg3 = "b3"

tm1 = 1
tm2 = 2
tm3 = 3

t1 = (e1, (100, e2))
t2 = (e2, (50, e1))

bl1, bl2, bl3 :: Block
bl1 = (mg1, (tm1, []))
bl2 = (mg2, (tm2, [t1]))
bl3 = (mg3, (tm3, [t2]))

bs1, bs2 :: Blockchain
bs1 = Bcs (bl1, Bcs (bl2, Bc bl3))
bs2 = Bcs (bl3, Bcs (bl2, Bc bl2))
bs3 = Bc bl2
bs4 = Bcs (bl1, Bc bl3)


reverseChain :: Blockchain -> Blockchain
reverseChain = cataBlockchain (either Bc snocChain)


snocChain :: (Block, Blockchain) -> Blockchain
snocChain (b, Bc b') = Bcs (b', Bc b)
snocChain (b, Bcs (b', bs)) = Bcs (b', snocChain (b, bs))


concChain :: (Blockchain, Blockchain) -> Blockchain
concChain (b1, (Bc b)) = snocChain (b, b1)
concChain (b1, (Bcs (b, bs))) = concChain ((snocChain (b, b1)), bs)


lenChain = cataBlockchain (either (const 1) (succ . p2))

-- * pergunta 2

data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)

inQTree :: Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a))) -> QTree a
outQTree :: QTree a -> Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))
baseQTree :: (a1 -> b) -> (a2 -> d1) -> Either (a1, d2) (a2, (a2, (a2, a2))) -> Either (b, d2) (d1, (d1, (d1, d1)))
recQTree :: (a -> d1) -> Either (b, d2) (a, (a, (a, a))) -> Either (b, d2) (d1, (d1, (d1, d1)))
cataQTree :: (Either (b, (Int, Int)) (d, (d, (d, d))) -> d) -> QTree b -> d
anaQTree :: (a1 -> Either (a2, (Int, Int)) (a1, (a1, (a1, a1)))) -> a1 -> QTree a2
hyloQTree :: (Either (b, (Int, Int)) (c, (c, (c, c))) -> c) -> (a -> Either (b, (Int, Int)) (a, (a, (a, a)))) -> a -> c

instance (Eq a,Arbitrary a) => Arbitrary (QTree a) where
  arbitrary = do
    rows <- QuickCheck.choose (1,100)
    cols <- QuickCheck.choose (1,100)
    xs <- vectorOf (rows * cols) arbitrary
    return ((bm2qt . fromList rows cols) xs)
  shrink = shrinkNothing

rotateMatrix :: Matrix a -> Matrix a
rotateMatrix m = matrix (ncols m) (nrows m) rot
    where
    rot (j,i) = unsafeGet (nrows m - i + 1) j m

rotatebm :: Eq a => Matrix a -> Matrix a
rotatebm = qt2bm . rotateQTree . bm2qt

rotateBMP :: FilePath -> FilePath -> IO ()
rotateBMP from to = withBMP from to rotatebm

instance Arbitrary PixelRGBA8 where
    arbitrary = do
        r <- px
        g <- px
        b <- px
        a <- px
        return (PixelRGBA8 r g b a)
      where px = QuickCheck.choose (0,255)
    shrink = shrinkNothing

sizeMatrix :: Matrix a -> (Int,Int)
sizeMatrix = ncols `split` nrows

sizeQTree :: QTree a -> (Int,Int)
sizeQTree = cataQTree (either snd g)
    where
    g (a,(b,(c,d))) = (fst a + fst b,snd a + snd c)

shapeQTree :: QTree a -> QTree ()
shapeQTree = fmap (!)

scalebm :: Eq a => Int -> Matrix a -> Matrix a
scalebm s = qt2bm . scaleQTree s . bm2qt

scaleBMP :: Int -> FilePath -> FilePath -> IO ()
scaleBMP s from to = withBMP from to (scalebm s)

invertbm :: Matrix PixelRGBA8 -> Matrix PixelRGBA8
invertbm = qt2bm . invertQTree . bm2qt

invertBMP :: FilePath -> FilePath -> IO ()
invertBMP from to = withBMP from to invertbm

depthQTree :: QTree a -> Int
depthQTree = cataQTree (either (const 0) f)
    where f (a,(b,(c,d))) = 1 + maximum [a,b,c,d]

compressbm :: Eq a => Int -> Matrix a -> Matrix a
compressbm n = qt2bm . compressQTree n . bm2qt

compressBMP :: Int -> FilePath -> FilePath -> IO ()
compressBMP n from to = withBMP from to (compressbm n)

outlinebm :: Eq a => (a -> Bool) -> Matrix a -> Matrix Bool
outlinebm isBackground = outlineQTree isBackground . bm2qt

outlineBMP :: FilePath -> FilePath -> IO ()
outlineBMP from to = withBMP from to (fmap mono . outlinebm (==whitePx))
    where
    mono False = whitePx
    mono True = blackPx

addOutlineBMP :: FilePath -> FilePath -> IO ()
addOutlineBMP from to = withBMP from to joinbm
    where
    joinbm bm = elementwiseUnsafe joinpx bm (outlinebm (==whitePx) bm)
    joinpx px1 False = px1
    joinpx px1 True = blackPx

qtOut = fromLists
    [[  True, True, True, True, True, True, True, True ]
    ,[  True,False,False, True, True, True, True, True ]
    ,[  True,False,False, True,False,False,False, True ]
    ,[  True, True, True, True,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False, True, True, True, True ]
    ,[ False,False,False,False, True, True, True,False ]
    ]

bm = fromLists [
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,1,1,1,0],
    [0,0,0,0,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,1]]

qt = bm2qt bm

-- * pergunta 4

data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float

inFTree :: Either b (a, (FTree a b, FTree a b)) -> FTree a b
outFTree :: FTree a1 a2 -> Either a2 (a1, (FTree a1 a2, FTree a1 a2))
baseFTree :: (a1 -> b1) -> (a2 -> b2) -> (a3 -> d) -> Either a2 (a1, (a3, a3)) -> Either b2 (b1, (d, d))
recFTree :: (a -> d) -> Either b1 (b2, (a, a)) -> Either b1 (b2, (d, d))
cataFTree :: (Either b1 (b2, (d, d)) -> d) -> FTree b2 b1 -> d
anaFTree :: (a1 -> Either b (a2, (a1, a1))) -> a1 -> FTree a2 b
hyloFTree :: (Either b1 (b2, (c, c)) -> c) -> (a -> Either b1 (b2, (a, a))) -> a -> c

depthFTree :: FTree a b -> Int
depthFTree = cataFTree (either (const 0) g)
    where g (a,(l,r)) = max l r + 1

isBalancedFTree :: FTree a b -> Bool
isBalancedFTree = isJust . cataFTree (either (const (Just 0)) g)
    where
    g (a,(l,r)) = join (liftA2 equal l r)
    equal x y = if x == y then Just (x+1) else Nothing
\end{code}
%endif

%----------------- Fim do documento -------------------------------------------%

\end{document}
