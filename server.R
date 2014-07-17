value.table = data.frame(value = paste("Input to Server",1:10),
                         foo = paste("foo",1:10),
                         bar = paste("bar",1:10),
                         stringsAsFactors=F)


added.items = NULL
vals.g1 = NULL

shinyServer(function(input, output, session) {  
  added_items = reactive({
    added.items = c(added.items,input$additemstolist)
    return(added.items)
  })
  
  output$ui_additemstolist = renderUI({
    input.values = paste("Input to Server",1:10)
    if(input$filter==1)
      input.values = input.values[1:3]
    if(input$filter==2)
      input.values = input.values[6:9]
    
    selectInput("additemstolist","(Hold 'ctrl' to select multiple items)",
                input.values,selected=NULL,multiple=T)  
  })
  
  
  output$drag_drop = renderText({
    c('
      <section id="user-levels">
      <div id="unassigned" ondrop="dropUser(this, event)" ondragenter="return false" ondragover="return false">
      Unassigned',
      paste('<span draggable="true" class="user" id="',
            tolower(gsub(" ","_",added_items())),'" ondragstart="dragUser(this, event)">',
            added_items(),
            '</span>'),
      '</div>
      <div id="group1" ondrop="dropUser(this, event)" ondragenter="return
      false" ondragover="return false">
      <em>Group 1</em>
      </div>
      <div id="group2" ondrop="dropUser(this, event)" ondragenter="return false"
      ondragover="return false">
      <em>Group 2</em>
      </div>
      </section>
      ')
  })
  
  output$results_unass = renderPrint({
    input$result_unass
  })
  
  output$g1_table = renderTable({
    if(length(input$group1_update)>0) {
      cat(vals.g1,"<-vals.g1\n")
      vals.g1 = c(vals.g1,unlist(strsplit(input$group1_update,"\\|")))
      cat(vals.g1,"<-vals.g1 part2\n")
      vals.fixed = sapply(vals.g1,function(x) substr(x,2,nchar(x)-1))
      value.table[value.table$value %in% vals.fixed,]
    }
  })
  
  output$g2_table = renderTable({
    if(length(input$group1_update)>0) {
      vals = unlist(strsplit(input$group2_update,"\\|"))
      vals.fixed = sapply(vals,function(x) substr(x,2,nchar(x)-1))
      value.table[value.table$value %in% vals.fixed,]
    }
  })
  
})