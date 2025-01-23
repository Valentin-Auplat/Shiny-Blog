library(shiny)
library(shinydashboard)
library(bslib)
library(DT)
library(rhandsontable)
library(shinyjs)
library(ggpubr)
library(dplyr)
library(tidyverse)
library(jtools)
library(tm)
library(mfx)
library(remotes)
library(stringr)
library(shinymanager)
library(fmsb)
library(shinycssloaders)


#Définition de l'interface utilisateur#########################################################################################################
ui <-
  fluidPage(
    tags$style(HTML("
    .sidebar-img {
      max-width: 100%;  /* Makes the image responsive */
      height: auto;    /* Maintains aspect ratio */
      display: block;  /* Ensures the image is treated as a block element */
      margin: 0 auto;  /* Centers the image horizontally */
    }
  ")),
  useShinyjs(),
  theme = bs_theme(
    version = 5,
    bootswatch = "minty",
    bg = "white",
    fg = "black",
    primary = "darkgreen",
    secondary = "darkgreen",
    success = NULL,
    info = NULL,
    warning = NULL,
    danger = NULL,
    base_font = NULL,
    code_font = NULL,
    heading_font = NULL),
    navbarPage(
    title = tagList("Valentin Auplat", actionLink("sidebar_button", "", icon = icon("bars"))),
#Définition de l'onglet Présentation##############################################################################################################   
tabPanel(h4("Who I am"),
         sidebarLayout(
           sidebarPanel(width = 4,
                        img(src = "header_img.png",
                            width = "100%",
                            height = "100%",
                            align = "center"),
                            HTML({"<div style='text-align: center;'>
                             <h4><strong>What I am doing</strong></h4>
                             <h5>Master 1 Analysis and Policy in Economics</h5>
                             <h5><font color = 'green'>Paris School of Economics - Ecole Normale Supérieure PSL</font></h5>
                             <p>President of the ENS parliamentary debating club (national champion 2024)</p>
                             <p>Co-organizer of the seminar <strong>Pour une science de la recherche</strong> at the ENS</p>
                             </div>"})),
mainPanel(
  tabPanel(HTML("<h2><strong>Hi there! I'm Valentin Auplat</strong></h2>
                <div style='text-align: justify;'>
                <p>As a graduate student in economics and an ENS student, I have a very versatile profile and I am 
                particularly proficient in mathematics, econometrics, and programming. I find my purpose in pursuing 
                my projects and making them profitable for as many people as possible, such as the tools I developed 
                for the French Ministry of Economics and Finance, or the seminar I initiated at the ENS. Identifying 
                and addressing issues through teamwork is what I do best.</p>
                </div>"),
             
             title=h4("Who am I"),
             
             HTML({"<div style='text-align: justify;'>

             <p></p>

             <p></p>
               </div>"}),
             
           downloadButton(outputId = "downloadDossierZip",
                          label = "Download my complete résumé/CV!",
                          icon = icon("download")),
           HTML("<br>
                <br>"
                ),
             accordion(open=FALSE,
                       accordion_panel(
                         title = HTML('<h4><strong>My Education</strong></h4>'),
                         HTML({"<div style='text-align: justify;'>
                        <ul style='list-style: none; padding-left: 0;'>
       <li><i class='fa-solid fa-graduation-cap' style='color: green;'></i> <strong>2024-2025:</strong> Master’s degree <strong>Analysis and Policy in Economics (APE) at Paris School of Economics</strong>. Second year at the <strong>Ecole Normale Supérieure-PSL</strong>. Organization of the seminar “Pour une science de la recherche” at the ENS-PSL.</li>
       <li><i class='fa-solid fa-graduation-cap' style='color: green;'></i> <strong>2023-2024:</strong> Undergrad at the Department of Economics of the <strong>ENS-PSL</strong>. Pursuing a research project about <strong>publicly funded R&D at CERES</strong> with Dr. Fleurbaey, and Dr. Ben Ari (INRAE).</li>
       <li><i class='fa-solid fa-graduation-cap' style='color: green;'></i> <strong>2022-2023:</strong> Undergrad at the Department of Economics of the <strong>ENS of Lyon</strong>. 2 internships in research.</li>
       <li><i class='fa-solid fa-graduation-cap' style='color: green;'></i> <strong>2019-2022:</strong> <strong>CPGE B/L at Faidherbe</strong> high school in Lille. Laureate of the <strong>Student Achievement award Louis Chatry</strong> for having insured the technical support of the pedagogical continuity during lockdown.</li>
       </ul>
                     </div>"
                         })
                       ),
                       accordion_panel(
                         HTML("<h4><strong>My professional experiences</strong></h4>"),
                         HTML({"<div style='text-align: justify;'>
                        <ul style='list-style: none; padding-left: 0;'>
       <li><i class='fa-solid fa-user-tie' style='color: green;'></i> <strong>2024:</strong> Internship at the French Ministry of Economics and Finance: analysis of environmental impact and trajectory of the investment plan France 2030. Note writing for the Minister. Development of a web app to share the results.</li>
       <li><i class='fa-solid fa-book-bookmark' style='color: green;'></i> <strong>June-Sept. 2023:</strong> Internship as a research assistant for Dr. Jensen (CNRS). Production of a data base on R and a report on the situation of publicly funded R&D between 2009 and 2022.</li>
       <li><i class='fa-solid fa-book-bookmark' style='color: green;'></i> <strong>2022-2023:</strong> Internship as a research assistant for Dr. Hatte, the head of Department of Economics of the ENS of Lyon. Creation of a data base using Python and web scraping technics.</li>
       <br>
       <p>To learn more about my <strong>international experiences</strong> and my <strong>many involvements</strong>, you can dowload my <strong>complete résumé/CV</strong> above!</p>
       
       </ul>
                     </div>"
                         })
                       ),
                       accordion_panel(
                         HTML("<h4><strong>Links and contact</strong></h4>"),
                         HTML({"<div style='text-align: justify;'>
                         <a><i class='fa-solid fa-envelope'></i> valentin.auplat@ens.psl.eu</a>
                  <br>
                  <a><i class='fa-solid fa-phone'></i> +33 (0) 6 95 93 65 36</a>
                  <br>
                   <a href='https://www.linkedin.com/in/valentin-auplat-01a590252/' target='_blank'> <i class='fa-brands fa-linkedin'></i> My LinkedIn page</a>
                   <br>
                  <a href='https://www.instagram.com/ens_scr_2024/profilecard/?igsh=MWw4c2gzMnM4OG1pMw==' target='_blank'> <i class='fa-brands fa-instagram'></i> 'Pour une science de la recherche' instagram page</a>
                  </div>"})
                       )
             )
             )
))),
#################################################################################################################################################
    navbarMenu(
#Définition de l'onglet Statistiques descriptives################################################################################################
      h4("My work"),
#Définition du sous-onglet Impact environnemental de FR30________________________________________________________________________________________
#_________________________________________________________________________________________________________________________________________________
##Définition du sous-onglet Avancée de FR30_______________________________________________________________________________________________________
            tabPanel("My projects",
               sidebarLayout(
                 sidebarPanel(width = 3,
                              HTML('<center><h4><strong>They trusted me:</strong></h4>
                                   <a href="https://www.ens-lyon.fr/" target="_blank"> <img src="ENSL.png" class="sidebar-img"></a>
                                   <br>
                                   <a href="https://www.ens.psl.eu/" target="_blank"> <img src="ENSP.png" class="sidebar-img"></a>
                                   <br>
                                   <a href="https://www.entreprises.gouv.fr/fr/la-direction-generale-des-entreprises-dge" target="_blank"> <img src="Ministere.png" class="sidebar-img"></a>
                                   <br>
                                   <a href="https://ffdebat.org/" target="_blank"> <img src="FFD.png" class="sidebar-img"></a>
                                   </center>')
                 ),
                 mainPanel(tabsetPanel(
                   navbarMenu(
                     h4("Productions"),
                     tabPanel(HTML("<font size='5'>'Pour une science de la recherche' ENS-PSL</font>"),#Définition des graphiques de l'avancée par outils
                              card(
                                card_header(HTML("<strong>'Pour une science de la recherche'</strong>, a seminar about how science works")),
                                HTML('<center>
                                   <img src="logo.jpg" width="200">
                                   </center>'),
                                HTML("<div style='text-align: justify;'>
                                     <p><strong><a href='https://economie.ens.psl.eu/pour-une-science-de-la-recherche/' target='_blank'>Pour une science de la recherche'</a> is a 12 sessions seminar</strong> I coorganized with <strong>Guillaume de Rochefort</strong> (ENS-Mines de 
                                     Paris student) at <strong>ENS-PSL</strong> to help students and young researchers to understand how <strong>the French system of research and innovation</strong> 
                                     works. This seminar covers many fields such as the history and philosophy of sciences, economics of research and innovation, 
                                     public policies design and evaluation, evaluation of scientific research, administrative, public, and private management 
                                     of research, etc. We benefited from the intervention of <strong>more than 25 experts</strong> of these fields. They presented their work, 
                                     their views, and sometime advice about all the topics covered in 'Pour une science de la recherche'.</p>
                                     <p>For now, the general guideline of the seminar, and the sessions guidelines up to the eight one are available. 
                                     All the transcripts of interventions will be available in Januray 2025.</p>
                                     <p>Guillaume and I are already preparing the 2025 edition of the seminar, which will focus on higher education.</p>
                                     </div>"),
                                downloadButton(outputId = "downloadPourUneScienceDeLaRecherche",
                                               label = "Download 'Pour une science de la recherche' folder",
                                               icon = icon("download"))
                              )
                              ),
                     tabPanel(HTML("<font size='5'>Evaluation of the investment plan France 2030</font>"),
                              card(card_header("Internship at the French Ministry of Economics and Finance"),
                                   HTML("<center><img src='FR30.png' width='200'></center>
                                        <div style='text-align: justify;'>
                                        <p>During a four months internship at the French Ministry of Economics and Financed, I evaluated the 
                                        evolution of the 54 billion euros investment plan <a href='https://www.economie.gouv.fr/france-2030' target='_blank'>France 2030</a> towards its goals, and its environmental 
                                        impact. I had to design indicators, to conduct data and statistical analysis, to write notes for the 
                                        Director-General of the <a href='https://www.entreprises.gouv.fr/fr/la-direction-generale-des-entreprises-dge' target='_blank'>Direction Générale des Entreprises</a> (General Direction dedicated to Companies), and 
                                        to develop and deploy a web app to share a dashboard of my results and a credits reorientation simulator.</p>
                                        <p>The results of the work are confidential. Instead, I make available the report I wrote after this internship 
                                        so you can learn more about the methods I used and what I had to hand off.</p>
                                        </div>"),
                                   downloadButton(outputId = "downloadFR30",
                                                  label = "Download the internship report",
                                                  icon = icon("download"))
                                   )
                     ),
                     tabPanel(HTML("<font size='5'>Evaluation of the objectives of French publicly funded research</font>"),#Définition des graphiques de l'avancée par consommation
                              card(
                                card_header("Objectives and environmental impact of publicy funded French research"),
                                HTML("<div style='text-align: justify;'>
                                     <p>The report on the objectives of French publicly funded research has been written during an internship 
                                     at the ENS de Lyon Department of Physics for Pablo Jensen (CNRS-ENSL). The main goal of the report is to 
                                     identify and quantify the research spendings pursuing environmental goals.</p>
                                     <p>The results of this report have not been published yet because they can be refined (especially regarding the 
                                     distribution of universities' budget). But this report has already been used by ONGs (Sciences Citoyennes, Ingénieurs 
                                     sans frontières) and French deputies in order to write a bill aiming to create a 'Citizens` Convention' on research 
                                     to make research funding more democratic.</p>
                                     <p>This report has also been shared and discussed with Marc Fleurbaey (Centre de formation sur l'environnement et la société 
                                     at ENS-PSL), and will be validated as a research experience in my diploma.</p>
                                     </div>"),
                                downloadButton(outputId = "downloadReportFrenchPubliclyFundedResearch",
                                               label = "Download the report file",
                                               icon = icon("download"))
                              )
                              ),
                     tabPanel(HTML("<font size='5'>Research projects</font>"),#Définition des graphiques de l'avancée des crédits restants
                              card(card_header(HTML("<strong>Monetary policies and dollar invoicing in international trade</strong>")),
                                   HTML("<div style='text-align: justify;'>
                                        <p>This research project realized with Jules Vérin during my undergrad at ENS of Lyon aims to identify and quantify the effects
                                        of the American Federal Reserve's policies on international trade through dollar invoicing and the global 
                                        use of dollar. This project is particularly relevant in the post-COVID context when interet rates rose to 
                                        hinder inflation. To do so, we used time series analysis techniques which could be refined in a future Master's thesis.</p>
                                        </div>"),
                                   downloadButton(outputId = "downloadDollarInvoicing",
                                                  label = "Download the dollar invoicing project file",
                                                  icon = icon("download"))
                                   ),
                              card(card_header(HTML("<strong>Informality: how does economic development drives companies to hide?</strong>")),
                                   HTML("<div style='text-align: justify;'>
                                        <p>The literature about informality underlines that contrary to what was expected, economic development 
                                        does not imply a reduction of economic informality. In many developing countries experiencing a rise in their GDP 
                                        per capita, informal companies still hide there activities and workers. The estimated share of their production in the GDP is even rising.</p>
                                        <p>This research project aims to explore an explanation that had not been discused before: the cost of administrative 
                                        rigidities. A developing State might implement taxes and thus controls on firms' activities in order to finance 
                                        new public services eventually benefiting to the whole country and economy such as education. Firms often declare that 
                                        taxes and financing themselves on markets is not the issue here. But we can note in many polls and reports such as Doing Business 
                                        (World Bank) that time devoted to administrative tasks rises a lot in this situation. Therefore, we can formulate the 
                                        hypothesis that a developing State implements policies and controls its administration is not capable of perfoming at first, 
                                        and these rigidities and the time spent by companies to meet new requirements are simply too costly. Therefore, informality remains.</p>
                                        <p>The results of this preliminary research on the matter back this hypothesis. The research proposal is available, and the complete 
                                        paper will soon be available as well.</p>
                                        </div>"),
                                   downloadButton(outputId = "downloadInformality",
                                                  label = "Download the informality project file",
                                                  icon = icon("download"))
                                   ),
                              card(card_header(HTML("<strong>Evolution of Bitcoin's price determinants over time</strong>")),
                                   HTML("<div style='text-align: justify;'>
                                        <p>This interdisciplinary research project aims to understand what drives the value of Bitcoin. With fellow 
                                        students studying History, Mathematics, and Computer science, we intended to emphasize what made the value 
                                        of Bitcoin vary over time. Thus, our objective was not to create a predictive model of the value of Bictoin, 
                                        but to prove its drivers are not the same over time. To do so, we used several techniques, and my role was 
                                        to perfom Chow tests in order to show in a statistically significant way that the determinants of the Bitcoin 
                                        value do not have a constant role overtime. The scientific poster we produced is available below.</p>
                                        </div>"),
                              downloadButton(outputId = "downloadBitcoin",
                                             label = "Download the scientific poster on Bitcoin",
                                             icon = icon("download"))
                              )),
                     tabPanel(HTML("<font size='5'>Data analysis for the Fédération Francophone de Débat</font>"),
                              card(card_header("For a data driven Fédération Francophone de Débat"),
                                   HTML("<center>
                                   <img src='FFD.png' width='200'>
                                   </center>
                                    <br>
                                    <div style='text-align: justify;'>
                                    <p>After winning the 2024 national parliamentary debate tournament organized by the <a href='https://ffdebat.org/' target='_blank'>Fédération Francophone de Débat (FFD)</a>, 
                                    and as the president of the ENS debating team and main contact between the FFD and the ENS-PSL where formations to public 
                                    speaking are organized by the Fédération, I took more responsabilities in the organisation. In particular, I took in charge 
                                    the collect and analysis of data in order to help the Fédération's board to take data driven decisions and improve their activities</p>
                                    
                                    <p>For example, descriptive statics will allow the Fédération to know if gender parity is respected among speakers in tournaments, 
                                    what their academic background is, how the composition of teams and their performances evolve over time. And statistical tests will 
                                    make possible to identify match subjects that advantage teams playing as the government or the opposition, and thus making possible 
                                    for the Fédération to adapt their subjects or the instructions given to juries.</p>
                                    </div>"),
                                   actionButton(inputId = "downloadFFD",
                                                  label = HTML("<i class='fa-solid fa-spinner'></i> First campaign in progress. Come back later for results")
                                                  )#Définition des graphiques de l'avancée des crédits restants
                              ))
    )))
  )),
tabPanel("Web development",
         sidebarLayout(
           sidebarPanel(width = 3,
                        HTML('<center><h4><strong>I usually work with:</strong></h4>
                                   <img src="Python.png" width="100">
                                   <img src="R.png" width="100">
                                   <img src="Stata.png" width="100">
                                   <img src="Shiny.png" width="100">
                                   <br>
                                   <br>
                                   <br>
                                   <h4><strong>I am currently learning:</strong></h4>
                                   <img src="Julia.png" width="100">
                                   <img src="Docker.png" width="100">
                                   <img src="SQL.png" width="150">
                                   </center>'),
                        
           ),
           
           mainPanel(tabsetPanel(
             tabPanel(h4("Environmental impact simulator"),
                      card(
                        card_header(HTML("<strong>Simulator of the environmental impact of companies/institutions' activities</strong>")),
                        HTML("<div style='text-align: justify;'>
                              <center><img src='Envi.png' width='300'></center>
                                <p>This application is a standardized simulator allowing a company or an institution to <strong>follow the deployment of a plan 
                                or a buget</strong> depending on various parameters. In addition, this dashboard makes possible to modify a dataset without 
                                using an external software or coding, and to immediately identify <strong>the variation in the environmental impact</strong> of the plan 
                                depending on the data</p>
                                <p>You can access the web app by clicking on the button bellow.
                                <br>
                                User id: RemoteAccess
                                <br>
                                Password: !R3m0t3_4cc3ss_K3y4690!
                                </p>
                                     </div>"),
                        actionButton(inputId = "downloadTableurAvancéeStratégie",
                                       label = HTML("<i class='fa-solid fa-arrow-up-right-from-square'></i> Click to test the web app"),
                                      onclick ="window.open('https://vauplat.shinyapps.io/Simulateur/', '_blank')")
                        
                      )),
             
             tabPanel(h4("Your State Budget"),
                      card(
                        card_header(HTML("<strong>Tracking and simulating the French State Budget</strong>")),
                        HTML("<div style='text-align: justify;'>
                              <center><img src='PLF.png' width='305'></center>
                                <p>This application makes possible to track the evolution of the <strong>French State's budget</strong> over time, and 
                                to modify it in order to simulate future State's budget. In addition, multiple indicators allow to identify 
                                what would be the impact of these simulations on the French Economics. It is a great tool to <strong>analyse quickly budget 
                                projects proposed by the government, or Parliament's propositions.</strong></p>
                                     </div>"),
                        actionButton(inputId = "downloadTableurAvancéeStratégie",
                                       label = HTML("<i class='fa-solid fa-link-slash'></i> Coming soon!")
                                       ),
                        
                      )
             )
           ))
         ))
    ),
###################################################################################################################################################
#Définition de l'onglet Réallocation des crédits###################################################################################################
  ))

#Définition des commandes du serveur###############################################################################################################
server <- function(input, output, session) {

#Initialisation de la sécurité et de l'esthétique de la barre supérieure___________________________________________________________________________
  observeEvent(input$sidebar_button,{
    shinyjs::toggle(selector = ".tab-pane.active div:has(> [role='complementary'])")
    
    js_maintab <- paste0('$(".tab-pane.active div[role=',"'main'",']")')
    
    runjs(paste0('
          width_percent = parseFloat(',js_maintab,'.css("width")) / parseFloat(',js_maintab,'.parent().css("width"));
          if (width_percent == 1){
            ',js_maintab,'.css("width","");
          } else {
            ',js_maintab,'.css("width","100%");
          }
          '))
  })
  
  output$downloadDossierZip <- downloadHandler(
    filename = function(){"CV Valentin Auplat.pdf"},
    content = function(file){
      file.copy("www/CV.pdf", file)
    }
  )
  
  output$downloadPourUneScienceDeLaRecherche <- downloadHandler(
    filename = function(){"Pour une science de la recherche.zip"},
    content = function(file){
      file.copy("www/Pour une science de la recherche.zip", file)
    }
  )
  
  output$downloadFR30 <- downloadHandler(
    filename = function(){"Rapport de stage Valentin Auplat.pdf"},
    content = function(file){
      file.copy("www/Rapport de stage Valentin Auplat.pdf", file)
    }
  )
  
  output$downloadReportFrenchPubliclyFundedResearch <- downloadHandler(
    filename = function(){"Expérience de recherche Valentin Auplat.pdf"},
    content = function(file){
      file.copy("www/Experience de recherche Valentin Auplat.pdf", file)
    }
  )
  
  output$downloadDollarInvoicing <- downloadHandler(
    filename = function(){"Dollar Invoicing Research Project.pdf"},
    content = function(file){
      file.copy("www/Dollar Invoicing.pdf", file)
    }
  )
  
  output$downloadInformality <- downloadHandler(
    filename = function(){"Informality Project.pdf"},
    content = function(file){
      file.copy("www/Informality Project.pdf", file)
    }
  )
  
  output$downloadBitcoin <- downloadHandler(
    filename = function(){"Poster Bitcoin Project.pdf"},
    content = function(file){
      file.copy("www/Poster.pdf", file)
    }
  )
  }


# Run the app ----
shinyApp(ui = ui, server = server)
