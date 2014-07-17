alanOutput = function(outputId) {
  div(id=outputId, class="shiny-alan-output")
}
# ui shiny practice dragdrop
shinyUI(pageWithSidebar(
  headerPanel("",
              tags$head(
                tags$link(rel="stylesheet", type="text/css", href="dragDrop.css"),
                tags$script(src="dragDrop.js"),
                tags$script(src="alanbinding.js")
              )
  ),
  
  sidebarPanel(
    h3("Select Items to add to list"),
    selectInput("filter","Filter:",c(0,1,2)),
    htmlOutput("ui_additemstolist"),
    tags$style(type="text/css","#additemstolist {height: 200px}")
  ),
  
  mainPanel(
    htmlOutput("drag_drop"),
    tags$p(style="padding-bottom: 200px;"),
    tags$hr(),
    HTML('<div id="group1_update" class= "alanBinding" style="display:none"></div>'),
    HTML('<div id="group2_update" class= "alanBinding" style="display:none"></div>'),
    h4("Group 1:"),
    tableOutput("g1_table"),
    h4("Group 2:"),
    tableOutput("g2_table")
  )
))