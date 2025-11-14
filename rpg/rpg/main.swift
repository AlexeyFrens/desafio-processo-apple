//
//  main.swift
//  rpg
//
//  Created by JOAO CLAUDIO DOS SANTOS SOUZA on 14/11/25.
//

import Foundation

enum EstadoJogo {
    case inicioNaBiblioteca
    case encontroComLourdes
    case rotaAcademicoUm
    case corredorAcademicoUm
    case salaAviaoAcademicoDois
    case salaTransmissaoVideo
}

var itens = Array<String>()

var jogadorStats = [
    "forca": 0,
    "quantidadeItensEncontrados": itens.count
]

var monstro = gerarMonstro(forca: 0, vida: 0)

var estadoAnterior: EstadoJogo
var estadoAtual: EstadoJogo = .inicioNaBiblioteca

jogoPrincipal()

func jogoPrincipal() {
    switch estadoAtual {
        case .inicioNaBiblioteca: mostrarCenaBiblioteca()
        case .encontroComLourdes: mostrarCenaEncontro()
        case .rotaAcademicoUm: mostrarCenaRotaAcademicoUm()
        case .corredorAcademicoUm: mostrarCenaCorredorAcademicoUm()
        case .salaAviaoAcademicoDois: mostrarCenaSalaAviaoAcademicoDois()
        case .salaTransmissaoVideo: mostrarSalaTransmissaoVideo()
    }
}

func mostrarCenaBiblioteca(){
    print("""
                [NARRADOR] Sua cabeça lateja. O cheiro de ozônio e... algo mais... mofo... preenche o ar. 
                Você abre os olhos. Você ainda está no banheiro do terceiro andar da biblioteca, mas parece 
                que você desmaiou. A luz principal está apagada, apenas as luzes de emergência verdes no 
                teto iluminam o local. Não há som. Sem alunos conversando, sem telefones tocando. Apenas um 
                silêncio pesado e anormal que se estende até as ruas lá fora. 
                  
                Você se levanta. O que você faz?
          """)

    print("\n[OPÇÕES]")
    print("1. Gritar por ajuda.")
    print("2. Procurar seu celular.")
    print("3. Ir silenciosamente até a porta.\n")

    var escolha = ""

    repeat {

        escolha = readLine() ?? ""
        
        switch escolha {
        case "1":
            print("Você escuta um rosnado de uma criatura aparentemente grande se afastando lá fora. Silêncio é a melhor opção.\n")
            mostrarCenaBiblioteca()
        case "2":
            print("O celular está sem sinal e com a bateria em 5%. Inútil.\n")
            mostrarCenaBiblioteca()
        case "3":
            print("Você abre a porta e vê que não há nada em sua volta. Ufa!\n")
            estadoAtual = .encontroComLourdes
            return jogoPrincipal()
        default:
            print("\nEscolha inválida\n")
            mostrarCenaBiblioteca()
        }
    }while(escolha != "3")
    
}

func mostrarCenaEncontro() {
    print("""
                [NARRADOR] Você desce as escadas da biblioteca até o térreo. O horror toma 
                conta de você. O praça central está uma zona com quase todas as árvores caídas. E as... 
                coisas... que andam por ele não são humanas. Seu colega de sala, Jonas, está lá. Mas 
                ele tem três braços agora, e sua pele é como pedra rachada. Ele está... comendo o 
                o tronco de uma árvore como se fosse um espetinho. Todos os alunos e professores. 
                Transformados. Você se esconde atrás de uma bancada, seu coração batendo tão forte que 
                você teme que eles possam ouvi-lo. De repente, uma mão ossuda toca seu ombro.
                
                [NARRADOR] Você se vira, pronto para morrer, mas vê apenas uma senhorinha encolhida. 
                Ela usa um casaco de lã, óculos grossos e tem o cabelo branco preso em um coque 
                apertado. Ela parece absolutamente apavorada.
                
                [SENHORINHA] "Shhh! Pelos céus, não faça barulho!" ela sussurra, a voz trêmula. "Eu... 
                eu me escondi na sala de estudos quando... quando a névoa roxa apareceu. Eu vi 
                tudo. As pessoas... mudando." "Meu nome é Lourdes. Eu sou professora de ciências. Escute, 
                querido, eu acho que sei como parar isso."
                
                [NARRADOR] Ela se inclina para mais perto.
                
                [SENHORINHA] "Eu tenho um livro de biomedicina. Mas eu... eu esqueci em cima da bancada 
                na sala de transmissão de vídeo" "Eu sou muito velha... minhas pernas... eu 
                não consigo ir até lá com todos esses bichos. Mas você... você é jovem. Por favor, você 
                pode buscar para mim? É um livro com uma capa roxa e uma decoração no meio, aperte na 
                decoração e eu receberei uma cópia do conteúdo em meu Iphone."
                
                [NARRADOR] Ela olha para você, os olhos marejados de lágrimas. "Se você pegar, poderei 
                produzir um medicamento que transforme todos de volta"
          """)

    print("\n[OPÇÕES]")
    print("1. \"Eu vou. Fique aqui. Onde fica a sala de transmissão de vídeo?\"")
    print("2. \"Isso é loucura. Como um simples livro de biomedicina pode ajudar contra... isso?\"")
    print("3. \"Eu não posso arriscar. Vou tentar sair daqui sozinho.\"\n")

    var escolha = ""

    repeat {
        escolha = readLine() ?? ""

        switch escolha {
            case "1":
                print("[NARRADOR] Você sai pela porta da biblioteca com muito orgulho, mas ao mesmo tempo com muito medo\n")
                print("""
                    [NARRADOR] Antes de sair da biblioteca, você recebe uma espada da professora Lourdes. Como ela arranjou uma espada 
                    do nada? Você não sabe, mas está muito apavorado para fazer mais perguntas.\n
                    
                    """)
                print("[NARRADOR] Após empunhar a espada, você sente uma força sobre-humana e agora parece que você pode enfrentar qualquer inimigo\n")
                    
                jogadorStats["forca"] = 20
                estadoAtual = .rotaAcademicoUm
                return jogoPrincipal()
            case "2":
                print("[SENHORINHA] \"Não temos tempo! Apenas confie em mim!\"\n")
                print("\nAperte ENTER para continuar")
                _ = readLine() ?? ""
                mostrarCenaEncontro()
            case "3":
                print("[SENHORINHA] \"Por favor, confie em mim! Todas aquelas pessoas precisam da sua ajuda!\"\n")
                print("\nAperte ENTER para continuar")
                _ = readLine() ?? ""
                mostrarCenaEncontro()
            default:
                print("\nEscolha inválida\n")
                mostrarCenaEncontro()

        }
    }while(escolha != "1")

}

func mostrarCenaRotaAcademicoUm() {
    print("""
                [NARRADOR] Você está quase chegando a entrada do Acadêmico 1, quando você houve algo ofegante à sua direita.
                Um monstro gigante com a pele formada por pedras se aproxima de você.
          """)
    
    print("\n\"Você não irá vencer monstro de pedras\"")
    print("\nAperte ENTER para continuar")
    _ = readLine() ?? ""
    
    monstro = gerarMonstro(forca: 15, vida: 60)
    
    batalha(monstro: monstro, proximoCenario: .corredorAcademicoUm, cenarioAnterior: .encontroComLourdes)
    
}

func mostrarCenaCorredorAcademicoUm() {
    print("""
                [NARRADOR] Você está passando pelo corredor do Acadêmico 1, quando um outro monstro interrompe a passagem para o próximo prédio. 
                Ele possui pele radiante vermelha.
          """)
    
    print("\n\"Você não irá vencer Hulk vermelho\"")
    print("\nAperte ENTER para continuar")
    _ = readLine() ?? ""
    
    monstro = gerarMonstro(forca: 30, vida: 80)
    
    batalha(monstro: monstro, proximoCenario: .salaAviaoAcademicoDois, cenarioAnterior: .rotaAcademicoUm)
}

func mostrarCenaSalaAviaoAcademicoDois() {
    print("""
                [NARRADOR] Você finalmente chega na sala do avião no Acadêmico 2. Há um monstro gigantesco no meio da sala, maior que 
                todos os outros que você enfrentou. Mas ainda sim você não tem medo, a experiência com os outros monstros te trouxe 
                confiança de sobra.
          """)
    
    print("\n\"Mais um para a conta\"")
    print("\nAperte ENTER para continuar")
    _ = readLine() ?? ""
    
    monstro = gerarMonstro(forca: 500, vida: 1000)
    
    batalha(monstro: monstro, proximoCenario: .salaTransmissaoVideo, cenarioAnterior: .corredorAcademicoUm)
}

func mostrarSalaTransmissaoVideo() {
    print("""
                [NARRADOR] Você entra na sala de transmissão de vídeo. Está escuro, exceto pelas luzes 
                de 'standby' dos equipamentos. Câmeras desligadas te observam como olhos vazios. Você 
                olha para a bancada dentro da sala e lá está ele. Um livro com capa roxa e um decorado 
                no meio, igual ao que a professora mencionou. Você aperta no decorado no meio do livro e
                instantanemente uma agulha perfura seu dedo (você larga o livro na hora). Um gás roxo bem
                forte começa a jorrar do livro, inundando a sala inteira.

                [NARRADOR] "Ah, que decepção." A voz vem da porta. Não é a voz trêmula de uma senhorinha. 
                É fria, forte e cheia de poder. A Professora Lourdes está lá. Mas ela não está mais 
                encolhida. Ela está em pé, ereta. Seus olhos brilham com a mesma energia roxa da pedra
                que decora o livro.

                [PROFESSORA Lourdes] "Eu realmente esperava mais de você. Achei que você seria 
                inteligente o suficiente para *não* vir aqui."
          """)
    
    print("\nOPÇÕES\n")
    print("1 - \"O que está acontecendo, o livro quebrou?\"")
    print("2 - \"Foi você... Você fez isso!\"")
    
    var escolha = readLine() ?? ""
    
    while(escolha != "1" && escolha != "2") {
        print("Opção inválida, tente novamente!")
        escolha = readLine() ?? ""
    }
    
    print("""
                [PROFESSORA Lourdes] HAHAHAHAHAHAHAHAHAHAHAHA "'Professora de ciências', 
                nessa escola podre? Por favor. Eu fui uma verdadeira cientista exemplar. Eu realizei 
                uma pesquisa que poderia revolucionar a humanidade. Finalmente consegui controlar as 
                células do nosso corpo, a ponto de fazer o que quiser com sua capacidade biocelular. 
                Me chamaram de louca, e para piorar o "playboyzinho" do Elon Musk recebeu o 
                financiamento do "projetinho de escola" dele, o Neuralink. 
                ESSE DINHEIRO ERA MEU! 
                Agora mostrarei o que é ciencias de verdade. HAHAHAHAHA
                "Eu precisava de uma gotinha do seu sangue. Você é especial, sua linhagem é especial
                e eu precisava disso para completar meu dispositivo"

                [NARRADOR] A pedra decorativa do livro começa a brilhar intensamente. O gás agora 
                apresenta uma cor avermelhada, bem escura.

                [NARRADOR] De alguma forma um simples furo no seu dedo drenou toda a sua energia. Você não
                consegue mais detê-la e apenas a observa com um olhar cedento por vingança.
                Você olha para suas mãos... Aos poucos sua pele se desprende, revelando seus musculos.
                "Será que estou me transformando?", você pensa antes de desmaiar no chão.

                \nFIM
          """)
}

func batalha(monstro: (forcaMonstro: Int, vidaMonstro: Int), proximoCenario: EstadoJogo, cenarioAnterior: EstadoJogo) {
    
    print("\nA BATALHA COMEÇA\n")
    
    var monstroAtual = monstro
    var forcaJogador = jogadorStats["forca"] ?? 0
    
    while(monstro.vidaMonstro > 0) {
        
        print("Você ataca")
        monstroAtual.vidaMonstro -= forcaJogador
        if monstroAtual.vidaMonstro < 0 {
            break
        }
        print("Monstro ataca")
        forcaJogador -= (monstro.forcaMonstro < (forcaJogador * 2)) ? 2 : 5
        if forcaJogador < 0 {
            break
        }
        print("Sua força: \(forcaJogador), Vida do monstro: \(monstroAtual.vidaMonstro)")
    }
    
    if monstroAtual.vidaMonstro < 0 {
        print("\nParabéns você derrotou o monstro!")
        jogadorStats["forca"] = (jogadorStats["forca"] ?? 0) + forcaJogador
    }else {
        print("\nVOCÊ MORREU!\n")
        estadoAtual = cenarioAnterior
        jogoPrincipal()
    }
    
    print("Gostaria de explorar o local?\n")
    print("OPÇÕES")
    print("1 - Sim")
    print("2 - Não")
    var escolha = readLine() ?? ""
    
    while(escolha != "1" && escolha != "2") {
        print("Opção inválida! Tente novamente.")
        escolha = readLine() ?? ""
    }
    
    switch escolha {
        case "1": descobrirLocal()
        case "2":
            estadoAtual = proximoCenario
            jogoPrincipal()
        default: print("Erro inesperado, contate o administrador")
    }
}

func descobrirLocal() {
    
    switch estadoAtual {
        case .rotaAcademicoUm: explorarRotaAcademicoUm()
        case .corredorAcademicoUm: explorarCorredorAcademicoUm()
        case .salaAviaoAcademicoDois: explorarSalaAviaoAcademicoDois()
        default: print("Erro inesperado, contate o administrador")
    }
}

func explorarRotaAcademicoUm() {
    print("\nVocê olha em volta, escolha um dos locais para procurar por itens:")
    print("\nOPÇÕES")
    print("1 - Monumento em formato de tábuas de madeira")
    print("2 - Árvore da praça da entrada")

    var escolha = readLine() ?? ""
    
    while(escolha != "1" && escolha != "2") {
        print("Opção inválida")
        escolha = readLine() ?? ""
    }

    if escolha == "1" {
        print("\nNão há nada aqui.\n")
        print("\nAperte ENTER para continuar")
        _ = readLine() ?? ""
    }

    if escolha == "2" {
        print("\nVocê encontrou um frasco com um líquido amarelo")
        print("💪Força +40")
        jogadorStats["forca"] = (jogadorStats["forca"] ?? 0) + 40
        itens.append("Frasco Amarelo - Comum")
        jogadorStats["quantidadeItensEncontrados"] = itens.count
        print("\(jogadorStats)\n")
        
        print("\nAperte ENTER para continuar")
        _ = readLine() ?? ""
    }
    
    estadoAtual = .corredorAcademicoUm
    jogoPrincipal()
}

func explorarCorredorAcademicoUm() {
    print("\nVocê olha em volta, escolha um dos locais para procurar por itens:")
    print("\nOPÇÕES")
    print("1 - Abaixo da rampa de acesso ao segundo andar")
    print("2 - Banheiro")
    
    var escolha = readLine() ?? ""
    
    while(escolha != "1" && escolha != "2") {
        print("Opção inválida")
        escolha = readLine() ?? ""
    }

    if escolha == "1" {
        print("\nVocê encontrou um frasco um líquido azul")
        print("💪Força +40")
        jogadorStats["forca"] = (jogadorStats["forca"] ?? 0) + 40
        itens.append("Frasco líquido azul - Comum")
        jogadorStats["quantidadeItensEncontrados"] = itens.count
        print("\(jogadorStats)\n")
        print("\nAperte ENTER para continuar")
        _ = readLine() ?? ""
    }

    if escolha == "2" {
        print("\nVocê encontrou um frasco grande com um líquido vermelho")
        print("💪Força +80")
        jogadorStats["forca"] = (jogadorStats["forca"] ?? 0) + 80
        itens.append("Frasco grande com líquido vermelho - Raro")
        jogadorStats["quantidadeItensEncontrados"] = itens.count
        print("\(jogadorStats)\n")
        print("\nAperte ENTER para continuar")
        _ = readLine() ?? ""
    }
    
    estadoAtual = .salaAviaoAcademicoDois
    jogoPrincipal()
}

func explorarSalaAviaoAcademicoDois() {
    print("\nVocê olha em volta, escolha um dos locais para procurar por itens:")
    print("\nOPÇÕES")
    print("1 - Avião pendurado")
    print("2 - Abaixo da rampa de acesso ao segundo andar")
    print("3 - Secretaria")
    
    var escolha = readLine() ?? ""
    
    while(escolha != "1" && escolha != "2" && escolha != "3") {
        print("Opção inválida")
        escolha = readLine() ?? ""
    }

    if escolha == "1" {
        print("\nVocê encontrou um canivete suiço vermelho")
        print("💪Força +20")
        jogadorStats["forca"] = (jogadorStats["forca"] ?? 0) + 20
        itens.append("Canivete suiço vermelho - Raro")
        jogadorStats["quantidadeItensEncontrados"] = itens.count
        print("\(jogadorStats)\n")
        print("\nAperte ENTER para continuar")
        _ = readLine() ?? ""
    }

    if escolha == "2" {
        print("\nNão há nada aqui\n")
    }
    
    if escolha == "3" {
        print("\nVocê encontrou uma nova espada de titânio✨")
        print("💪Força +200")
        jogadorStats["forca"] = (jogadorStats["forca"] ?? 0) + 200
        itens.append("Espada de titânio - Lendário")
        jogadorStats["quantidadeItensEncontrados"] = itens.count
        print("\(jogadorStats)\n")
        print("\nAperte ENTER para continuar")
        _ = readLine() ?? ""
    }
    
    estadoAtual = .salaTransmissaoVideo
    jogoPrincipal()
}

func gerarMonstro(forca: Int, vida: Int) -> (forcaMonstro: Int, vidaMonstro: Int) {
    (forcaMonstro: forca, vidaMonstro: vida)
}









